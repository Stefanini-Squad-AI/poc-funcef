// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Gleyber
// Data        : 17/11/2006
// Pendência   : 21785
// Alteração   : Acerto na passagem de parâmetro na funcionalidade que busca o
//               ultimo salário do participante antes da demissão.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 10/11/2006
// Pendência   : 23713
// Alteração   : Acerto na query de template
//               Não entra na regra de elegibilidade se não tiver regra.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 18/10/2006
// Pendência   : 23556
// Alteração   : Acerto na referência à query correta.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 15/09/2006
// Pendência   : 21893
// Alteração   : Abertura da query de benefícios para trabalhar benefícios de grupo
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 16/06/2006
// Pendência   : 19946
// Alteração   : Criação de rotina para criação de layout personalizado por plano.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 10/03/2006
// Pendência   : 19946
// Alteração   : Alterações para implementar o cálculo sobre as reservas associadas
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 21/02/2006
// Pendência   : 19946
// Alteração   : Alteração na query de busca de evento de demissão
//------------------------------------------------------------------------------
unit FParamRelExtratoDeslig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, TreeWzd, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  FPreview, Pptypes, ComCtrls, ppTmplat, Wwdatsrc, USistema;

type
  TFrmParamRelExtratoDeslig = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNomeParticip: TEdit;
    Label2: TLabel;
    edtNomePatro: TEdit;
    Label3: TLabel;
    edtInscricao: TEdit;
    Label4: TLabel;
    edtMatricula: TEdit;
    Label5: TLabel;
    edtNomePlano: TEdit;
    btnLocalizar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    memResult: TMemo;
    MontaSelect: TMontaSelect;
    qryAux: TwwQuery;
    qryCfg: TwwQuery;
    qryEvento: TwwQuery;
    qryTitular: TwwQuery;
    qryBeneficio: TwwQuery;
    qryContribuicoes: TwwQuery;
    pnlEtapas: TPanel;
    twEtapa: TTreeWzd;
    qrySaldoReservas: TwwQuery;
    dsSaldoReservas: TwwDataSource;
    updSaldoReservas: TUpdateSQL;
    qryExe: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure memResultChange(Sender: TObject);
  private
    { Private declarations }
    sSql         : String;
    iIdpessoa,
    iIdpessjur,
    iIdPlanoprev,
    iSeqproposta : Integer;
    dValorCota   : Double;  

    procedure LimpaTela;
    function RodaRegraElegibilidade(Var PsMsgErro : String): Boolean;
    function RodaRegraBeneficio(Var PbErro : Boolean; Var PsMsgErro : String): String;
    function GravaDados(PsIdEventoGerador, PsDescricao, PsValor : String): Boolean;
    function CalculaSalManut(PiIdPessJur, PiIdPessoa  : integer; PsMesRef, PsFlgInterno : string) : String;
    function GravaReservasAssociadas: Boolean; 
  public
    { Public declarations }
  end;

var
  FrmParamRelExtratoDeslig: TFrmParamRelExtratoDeslig;

implementation

uses DBaseDados, UDataBase, UMensErro, dRelExtratoDeslig, UBeneficio,
     UParticipante,UAdmPrev, UMovReserva;

{$R *.DFM}

procedure TFrmParamRelExtratoDeslig.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmParamRelExtratoDeslig.LimpaTela;
begin
  memResult.Lines.Clear;
  edtNomeParticip.Text := '';
  edtNomePatro.Text    := '';
  edtInscricao.Text    := '';
  edtMatricula.Text    := '';
  edtNomePlano.Text    := '';
end;

procedure TFrmParamRelExtratoDeslig.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  If MontaSelect.RetornouValor
   Then Begin
     iIdpessoa            := StrToInt(MontaSelect.ValoresChave[0]);
     iIdpessjur           := StrToInt(MontaSelect.ValoresChave[1]);
     iIdPlanoprev         := StrToInt(MontaSelect.ValoresChave[2]);
     edtNomeParticip.Text := MontaSelect.ValoresChave[3];
     edtNomePatro.Text    := MontaSelect.ValoresChave[4];
     edtNomePlano.Text    := MontaSelect.ValoresChave[5];
     edtInscricao.Text    := MontaSelect.ValoresChave[6];
     edtMatricula.Text    := MontaSelect.ValoresChave[7];
     iSeqproposta         := StrToInt(MontaSelect.ValoresChave[8]);
     memResult.Lines.Clear;
     memResult.Lines.Add('Demonstrativo de Demissão para o Participante: ');
     memResult.Lines.Add('             '+MontaSelect.ValoresChave[3]);
     memResult.Lines.Add('  ');
     twEtapa.Etapa.Pos    := 1;
     self.Height          := 384;   
   End;
end;

procedure TFrmParamRelExtratoDeslig.bbtnConfirmarClick(Sender: TObject);
Var
  bErro,
  bJaExiste        : Boolean;
  sMsgErro         : String;

  // Variáveis para inserção de dados
  sIdEventoGerador,
  sDescricao,
  sValor           : String;
  dValor           : Double;
  sNomeArq         : String;    
  fTemplate        : TStrings;  
begin
  // Crítica dos campos
  If Trim(edtNomeParticip.Text)=''
   Then Begin
     MsgDlg('Escolha primeiro o participante a executar a simulação.','Erro',mtError,[mbOk],0);
     btnLocalizar.SetFocus;
     Exit;
   End
   Else Begin
     // Verificar se a configuração para o plano existe
     qryCfg.Close;
     qryCfg.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
     qryCfg.Open;

     If qryCfg.IsEmpty
      Then Begin
        MsgDlg('O plano previdenciário do participante não está configurado.'+#13+#10+
               'Execute a configuração primeiro.','Erro',mtError,[mbOk],0);
        bbtnSair.SetFocus;
        Exit;
      End;

     // Veriicar se o participante já foi demitido
     qryEvento.Close;
     qryEvento.ParamByName('PIDPESSOA').AsInteger    := iIdpessoa;
     qryEvento.ParamByName('PIDPESSJUR').AsInteger   := iIdpessjur;
     qryEvento.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
     qryEvento.Open;

     If qryEvento.IsEmpty
      Then Begin
        MsgDlg('Não foi localizado evento de demissão para este participante.'+#13+#10+
               'Efetue, em primeiro lugar, o Evento de Demissão da Patrocinadora.','Erro',mtError,[mbOk],0);
        bbtnSair.SetFocus;
        Exit;
      End;
   End;

   // Abrir a query com os dados do participante
   qryTitular.Close;
   qryTitular.ParamByName('IDPESSJUR').AsInteger   := iIdpessjur;
   qryTitular.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoprev;
   qryTitular.ParamByName('IDPESSOA').AsInteger    := iIdpessoa;
   qryTitular.ParamByName('SEQPROPOSTA').AsInteger := iSeqproposta;
   qryTitular.Open;


  // Execução do processo
  If Not dtmBaseDados.dbBaseDados.InTransaction
    Then dtmBaseDados.dbBaseDados.StartTransaction;

  Try
    With memResult.Lines do
     Begin
       Add('- Iniciado às '+DateTimeToStr(Now)+'.');
       Add(' ');
       Add('- Verificando existência de extrato anterior.');

       twEtapa.Etapa.Pos := 2;
       Screen.Cursor := crSQLWait;

       bJaExiste := False;
       sSql := 'SELECT DISTINCT TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') DATA '+
               'FROM SIMULADESLIG '+
               'WHERE IDPESSOA = '+IntToStr(iIdpessoa)+
               ' AND IDPESSJUR = '+IntToStr(iIdpessjur)+
               ' AND IDPLANOPREV = '+IntToStr(iIdPlanoprev);

       If FazQuery(qryAux, sSql)
        Then Begin
         Screen.Cursor := crDefault;
         Add('- Encontrado cálculos do participante na data de '+qryAux.FieldByName('DATA').AsString+'.');
         If MsgDlg('Foi encontrado dados sobre extrato calculado em '+qryAux.FieldByName('DATA').AsString+
                   '.'+#13+#10+'Deseja fazer novo cálculo ?','Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
          Then Begin // Passa direto para a etapa do relatório
            bJaExiste := True;
            With dtmRelExtratoDeslig do
             Begin
               twEtapa.Etapa.Pos := 4;

               qryExtSimDeslig.Close;
               qryExtSimDeslig.ParamByName('PIDPESSOA').AsInteger    := iIdpessoa;
               qryExtSimDeslig.ParamByName('PIDPESSJUR').AsInteger   := iIdpessjur;
               qryExtSimDeslig.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
               qryExtSimDeslig.Open;

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT IDPLANOPREV, TEMPLATE');
               qryAux.SQL.Add('FROM CFGSIMULADESLIG');
               qryAux.SQL.Add('WHERE TEMPLATE IS NOT NULL');
               qryAux.SQL.Add('  AND IDPLANOPREV = '+IntToStr(iIdPlanoprev));

               qryAux.Open;

               If Not qryAux.FieldByName('TEMPLATE').IsNull
                Then Begin
                  sNomeArq := Sistema.TempDir + 'relsim.tcm';
                  fTemplate := TStringList.Create;
                  fTemplate.Clear;

                  fTemplate.SaveToFile(sNomeArq);
                  fTemplate.Add(qryAux.FieldByName('TEMPLATE').AsString);
                  fTemplate.SaveToFile(sNomeArq);

                  dsgExtSimDeslig.Report.Template.FileName := sNomeArq;
                  dsgExtSimDeslig.Report.Template.LoadFromFile;
                End;

               dsgExtSimDeslig.Report.Template.SaveTo   := stFile;
               dsgExtSimDeslig.Report.Template.Format   := ftASCII;
               dsgExtSimDeslig.Report.Device            := dvScreen;
               TFrmPreview.CreateModalPreview(Application, dsgExtSimDeslig.Report, 'AdmPREV - Demonstrativo de Desligamento');
             End; // With dtmRelExtratoDeslig do

          End // If MsgDlg
          Else Begin // Apaga os dados sobre o participante na tabela e continua normalmente
            Screen.Cursor := crSQLWait;
            sSql := 'DELETE FROM SIMULADESLIG '+
                    'WHERE IDPESSOA = '+IntToStr(iIdpessoa)+
                    ' AND IDPESSJUR = '+IntToStr(iIdpessjur)+
                    ' AND IDPLANOPREV = '+IntToStr(iIdPlanoprev);
            Add(' - Apagando cálculos anteriores.');

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSql);
            qryAux.ExecSQL;
          End // Else Begin
        End;  // If FazQuery(qryAux, sSql)

       If Not bJaExiste
        Then Begin
          twEtapa.Etapa.Pos := 3;
          qryCfg.First;

          While Not qryCfg.Eof do
           Begin // Laço para executar eventos na ordem dada na configuração.
             sIdEventoGerador := qryCfg.FieldByName('IDEVENTOGERADOR').AsString;
             If (qryCfg.FieldByName('FLGINTERNO').AsString <> 'MP') And
                (qryCfg.FieldByName('FLGINTERNO').AsString <> 'DM') And
                (qryCfg.FieldByName('FLGINTERNO').AsString <> 'DS')
              Then Begin
               qryBeneficio.Close;
               qryBeneficio.ParamByName('IDEVENTOGERADOR').AsInteger := qryCfg.FieldByName('IDEVENTOGERADOR').AsInteger;
               qryBeneficio.ParamByName('IDPLANOPREV').AsInteger     := iIdPlanoprev;

               Add(' - Verificando benefícios envolvidos.');

               qryBeneficio.Open;
               While Not qryBeneficio.Eof do
                Begin // Laço para executar regras dos benefícios envolvidos.

                  // Verifica se foi configurado para executar regra de elegibilidade
                  If qryCfg.FieldByName('FLGRODAELEG').AsInteger = 1
                   Then
                     If Not RodaRegraElegibilidade(sMsgErro)
                      Then Begin
                         If Trim(sMsgErro) <> ''
                          Then Add('   Erro na execução da regra de elegibilidade:'+#13+#10+
                                   sMsgErro+#13+#10+'   Processo cancelado.')
                          Else Add('   Participante não passou pela regra de elegibilidade.'+#13+#10+'   Processo cancelado.');
                         Screen.Cursor := crDefault;

                         If dtmBaseDados.dbBaseDados.InTransaction
                          Then dtmBaseDados.dbBaseDados.Rollback;
                         Exit;
                      End; // If Not RodaRegraElegibilidade(sMsgErro)

                  Add(' - Preparando dados para execução da regra de cálculo.');
                  sValor := RodaRegraBeneficio(bErro, sMsgErro);

                  If bErro
                   Then Begin
                     Add('   Erro na execução da regra de cálculo:'+#13+#10);
                     If Trim(sMsgErro) <> ''
                      Then Add(sMsgErro+#13+#10);
                     Add('   Processo cancelado.');
                     If dtmBaseDados.dbBaseDados.InTransaction
                      Then dtmBaseDados.dbBaseDados.Rollback;
                     Screen.Cursor := crDefault;
                     Exit;
                   End; // If bErro

                  sValor := OraNumero(sValor);

                  Add(' - Gravando dados do benefício.');
                  sDescricao := qryBeneficio.FieldByName('NOMEBENEFICIO').AsString;
                  If Not GravaDados(sIdEventoGerador,sDescricao,sValor)
                   Then Begin
                     Add('   Erro na gravação dos dados do benefício:'+#13+#10+
                         sDescricao+#13+#10+'   Processo cancelado.');
                     If dtmBaseDados.dbBaseDados.InTransaction
                      Then dtmBaseDados.dbBaseDados.Rollback;
                     Screen.Cursor := crDefault;
                     Exit;
                   End; // If Not GravaDados(sIdEventoGerador,sDescricao,sValor);

                  qryBeneficio.Next;
                End;  // While Not qryBeneficio.Eof do
              End  // If qryCfg.FieldByName('FLGINTERNO').AsString <> 'MP'
              Else
              // Tratamento específico para Diferimento
              If qryCfg.FieldByName('FLGINTERNO').AsString = 'DS'
              Then Begin
                qrySaldoReservas.Open;
                Add(' - Calculando dados sobre Diferimento.');
                dValor := CalcPadraoMovReserva(iIdpessjur,
                                               iIdPlanoPrev,
                                               iIdpessoa,
                                               iSeqproposta,
                                               StrToInt(sIdEventoGerador),
                                               iIdpessjur,
                                               iIdPlanoPrev,
                                               qryCfg.FieldByName('FLGINTERNO').AsString,
                                               qryEvento.FieldByName('DATAEVENTO').AsString,
                                               sMsgErro,
                                               0,
                                               qrySaldoReservas);
                If Trim(sMsgErro) <> ''
                 Then Begin
                     Add('   Erro na execução do cálculo da reserva:'+#13+#10+sMsgErro);
                     Add('   Processo cancelado.');
                     If dtmBaseDados.dbBaseDados.InTransaction
                      Then dtmBaseDados.dbBaseDados.Rollback;
                     Screen.Cursor := crDefault;
                     Exit;
                 End; // If Trim(sMsgErro) <> ''

                sValor := OraNumero(FloatToStr(dValor));

                Add(' - Gravando dados o valor do Diferimento.');

                qrySaldoReservas.First;

                While Not qrySaldoReservas.Eof do
                 Begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT CODHIERARQUIA, NOME FROM RESERVAXPLANO');
                  qryAux.SQL.Add('WHERE IDPLANOPREV   = ' + IntToStr(iIdPlanoPrev));
                  qryAux.SQL.Add('  AND IDTIPORESERVA = ' + qrySaldoReservas.FieldByName('IDTIPORESERVA').AsString);
                  qryAux.Open;

                  If qryAux.IsEmpty
                   Then Begin
                     qrySaldoReservas.Next;
                     Continue;
                   End;

                  dValorCota := qrySaldoReservas.FieldByName('VALORCOTA').AsFloat;

                  If Not GravaDados(sIdEventoGerador,
                                    '('+qryAux.FieldByName('CODHIERARQUIA').AsString + ') '+
                                    qryAux.FieldByName('NOME').AsString + ' - '+
                                    qrySaldoReservas.FieldByName('QTDCOTAS').AsString + ' X ' +
                                    qrySaldoReservas.FieldByName('VALORCOTA').AsString,
                                    OraNumero(qrySaldoReservas.FieldByName('SALDORESERVA').AsString))
                   Then Begin
                     Add('   Erro na gravação dos dados do diferimento:'+#13+#10+
                         '   Processo cancelado.');
                     If dtmBaseDados.dbBaseDados.InTransaction
                      Then dtmBaseDados.dbBaseDados.Rollback;
                     Screen.Cursor := crDefault;
                     Exit;
                   End; 

                  qrySaldoReservas.Next;

                 End; 

                qrySaldoReservas.CancelUpdates;
                qrySaldoReservas.Close;
              End 

              // Manutenção (Auto-Pat)
              Else Begin

                // Grava salário de manutenção
                Add(' - Calculando salário de manutenção.');

                sSql := 'SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+
                        qryEvento.FieldByName('IDSITPARTATUAL').AsString;
                FazQuery(qryAux, sSql);

                sValor := CalculaSalManut(iIdpessjur, iIdpessoa,
                                          Copy(MontaSelect.ValoresChave[9],7,4)+Copy(MontaSelect.ValoresChave[9],3,3), 
                                          qryAux.FieldByName('FLGINTERNO').AsString);

                sValor := OraNumero(sValor);

                Add(' - Gravando dados do salário de manutenção.');
                If Not GravaDados(sIdEventoGerador,'SALÁRIO DE MANUTENÇÃO',sValor)
                 Then Begin
                   Add('   Erro na gravação dos dados do salário de manutenção:'+#13+#10+
                       '   Processo cancelado.');
                   If dtmBaseDados.dbBaseDados.InTransaction
                    Then dtmBaseDados.dbBaseDados.Rollback;
                   Screen.Cursor := crDefault;
                   Exit;
                 End; 

                // Lendo as contribuicões atuais do participante
                Add(' - Lendo as contribuicões atuais do participante.');
                qryContribuicoes.Close;
                qryContribuicoes.ParamByName('PISEQPROPOSTA').AsInteger := iSeqproposta;
                qryContribuicoes.ParamByName('PIIDPESSJUR').AsInteger   := iIdpessjur;
                qryContribuicoes.ParamByName('PIIDPLANOPREV').AsInteger := iIdPlanoPrev;
                qryContribuicoes.ParamByName('PIIDPESSOA').AsInteger    := iIdpessoa;
                qryContribuicoes.ParamByName('PDDATAEVENTO').AsDate     := qryEvento.FieldByName('DATAEVENTO').AsDateTime;

                qryContribuicoes.Open;

                Add(' - Gravando dados das contribuições atuais do participante.');
                While Not qryContribuicoes.Eof do
                 Begin
                   sDescricao := qryContribuicoes.FieldByName('NOME').AsString;
                   sValor     := OraNumero(qryContribuicoes.FieldByName('VALORESPERADO').AsString);

                   If Not GravaDados(sIdEventoGerador,sDescricao,sValor)
                    Then Begin
                      Add('   Erro na gravação das contribuições atuais do participante:'+#13+#10+
                          '   Processo cancelado.');
                      If dtmBaseDados.dbBaseDados.InTransaction
                       Then dtmBaseDados.dbBaseDados.Rollback;
                      Screen.Cursor := crDefault;
                      Exit;
                    End; 

                   qryContribuicoes.Next;
                 End; 

              End; 
              qryCfg.Next;
           End; 
        End; 

       Add(' - Gravando reservas associadas.');
       If Not GravaReservasAssociadas
        Then Begin
          Add('   Erro na gravação das reservas associadas:'+#13+#10+
              '   Processo cancelado.');
          If dtmBaseDados.dbBaseDados.InTransaction
           Then dtmBaseDados.dbBaseDados.Rollback;
          Screen.Cursor := crDefault;
          Exit;
        End;

       Add(' - Gerando relatório da simulação.');
       Screen.Cursor := crDefault;
       With dtmRelExtratoDeslig do
        Begin
          twEtapa.Etapa.Pos := 4;
          qryExtSimDeslig.Close;
          qryExtSimDeslig.ParamByName('PIDPESSOA').AsInteger    := iIdpessoa;
          qryExtSimDeslig.ParamByName('PIDPESSJUR').AsInteger   := iIdpessjur;
          qryExtSimDeslig.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
          qryExtSimDeslig.Open;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('SELECT IDPLANOPREV, TEMPLATE');  
          qryAux.SQL.Add('FROM CFGSIMULADESLIG');
          qryAux.SQL.Add('WHERE TEMPLATE IS NOT NULL');
          qryAux.SQL.Add('  AND IDPLANOPREV = '+IntToStr(iIdPlanoprev));

          qryAux.Open;

          If Not qryAux.FieldByName('TEMPLATE').IsNull
           Then Begin
             sNomeArq := Sistema.TempDir + 'relsim.tcm';
             fTemplate := TStringList.Create;
             fTemplate.Clear;

             fTemplate.SaveToFile(sNomeArq);
             fTemplate.Add(qryAux.FieldByName('TEMPLATE').AsString);
             fTemplate.SaveToFile(sNomeArq);

             dsgExtSimDeslig.Report.Template.FileName := sNomeArq;
             dsgExtSimDeslig.Report.Template.LoadFromFile;
           End;

          dsgExtSimDeslig.Report.Template.SaveTo   := stFile;
          dsgExtSimDeslig.Report.Template.Format   := ftASCII;
          dsgExtSimDeslig.Report.Device            := dvScreen;
          TFrmPreview.CreateModalPreview(Application, dsgExtSimDeslig.Report, 'AdmPREV - Demonstrativo de Desligamento');
        End; 

       twEtapa.Etapa.Pos := 5;
       Add(' ');
       Add('- Finalizado às '+DateTimeToStr(Now)+'.');
       dtmBaseDados.dbBaseDados.Commit;
     End; 
  Except
    dtmBaseDados.dbBaseDados.Rollback;
    Screen.Cursor := crDefault;
    memResult.Lines.Add('- Ocorreu um erro durante o processamento.');
    memResult.Lines.Add('  Processamento cancelado.');
  End; 

 If fTemplate <> nil Then fTemplate.Free;

 If FileExists(sNomeArq) Then  DeleteFile(sNomeArq);
end;

function TFrmParamRelExtratoDeslig.RodaRegraElegibilidade(Var PsMsgErro : String): Boolean;
Var
 bErro    : Boolean;
 sMsgErro : String;
begin
  If qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger = 0
  Then Exit;
  
  memResult.Lines.Add(' - Verificando regra de elegibilidade.');
  memResult.Lines.Add('   Regra de Elegibilidade - Nº '+qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+'.'); 

  Result := ExecutaRegraElegibilidade(qryAux,
                                      qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,   
                                      iIdpessjur,
                                      iIdPlanoprev,
                                      iIdpessoa
                                      iSeqproposta,
                                      qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,        
                                      0,  // Opcao1
                                      0,  // Opcao2
                                      0,  // Opcao3
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      DateToStr(Date), // Data do Requerimento
                                      'AT',
                                      'DP',
                                      qryEvento.FieldByName('IDSITPARTATUAL').AsString,
                                      qryEvento.FieldByName('IDSITPLANOATUAL').AsString,
                                      qryEvento.FieldByName('IDSITFUNCATUAL').AsString,
                                      qryEvento.FieldByName('IDSITPARTNOVO').AsString,
                                      qryEvento.FieldByName('IDSITPLANONOVO').AsString,
                                      qryEvento.FieldByName('IDSITFUNCNOVO').AsString,
                                      1,
                                      0,
                                      bErro,
                                      sMsgErro,
                                      0);
end;

function TFrmParamRelExtratoDeslig.RodaRegraBeneficio(
Var PbErro : Boolean; Var PsMsgErro : String): String;
Var
  sMsgErro,
  sSalpart,
  sSalarioIntegral,
  sRemTotal,
  sDataInscFund,
  sFlgSitPartAntes,
  sIdSitFuncAtual,
  sIdSitPartAtual,
  sIdSitPlanAtual,
  sIdSitFuncAntes,
  sIdSitPartAntes,
  sIdSitPlanAntes,
  sMesReferencia    : String;
  iIdCalculo,
  iIdRegraCalculo   : Integer;
begin

  sSql := 'SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+
          qryEvento.FieldByName('IDSITPARTATUAL').AsString;
  FazQuery(qryAux, sSql);

  sMesReferencia   := Copy(DateToStr(Date),7,4)+Copy(DateToStr(Date),3,3);
  sFlgSitPartAntes := qryAux.FieldByName('FLGINTERNO').AsString;
  sSalPart         := '0';
  sIdSitFuncAtual := qryEvento.FieldByName('IDSITFUNCNOVO').AsString;
  sIdSitPartAtual := qryEvento.FieldByName('IDSITPARTNOVO').AsString;
  sIdSitPlanAtual := qryEvento.FieldByName('IDSITPLANONOVO').AsString;
  sIdSitFuncAntes := qryEvento.FieldByName('IDSITFUNCATUAL').AsString;
  sIdSitPartAntes := qryEvento.FieldByName('IDSITPARTATUAL').AsString;
  sIdSitPlanAntes := qryEvento.FieldByName('IDSITPLANOATUAL').AsString;

  sSalPart         := BuscaSalario(iIdPessJur,
                                   iIdPlanoPrev,
                                   iIdPessoa,
                                   sMesReferencia,
                                   sFlgSitPartAntes,
                                   sSalPart,
                                   sMsgErro,
                                   qryAux);

  sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL(qryAux,
                                                 iIdPessJur,
                                                 iIdPlanoPrev,
                                                 iIdpessoa,
                                                 iSeqProposta,
                                                 sFlgSitPartAntes,
                                                 sMesReferencia );


  sRemTotal := ORANUMERO(CalcREMTOTAL( iIdPessJur,
                                       iIdPessoa,
                                       SAnoMesAnterior(sMesReferencia),
                                       qryAux));

  sDataInscFund := CalcDataInscFund(iIdPessJur,
                                    iIdPlanoPrev,
                                    iIdpessoa,
                                    iSeqProposta,
                                    qryAux);
  sSQL := ' SELECT DISTINCT  1 FLGCONCESSAO, PP.SEQPROPOSTA, PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, '+
          '        PP.INSCRICAODATA, PP.INSCRICAOTIPO, PP.DTINICIOINSC,  '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, EL.FLGDIRETOR, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, PP.IDPESSOA AS IDTITULAR, '+
          '        0 AS PERCPROVISORIO, 0 AS FLGPROVISORIO, 0 AS PRAZOPROVISORIO, '+
          '        0 AS FLGPOSSUIACOMPINSS, '+
          qryBeneficio.FieldByName('IDBENEFICIO').AsString+ ' AS IDBENEFICIO , '+
          '        0 AS NUMEROPROCESSO , '+
          qryBeneficio.FieldByName('IDBENEFICIO').AsString+ ' AS IDBENEFICIO , '+
          '        0 AS NUMEROPROCESSO , '+
          QuotedStr(qryTitular.FieldByName('INSCRICAODATA').AsString)+' AS INSCRICAODATAFUND , '+
          '        0 AS VLRCALCINSS, '+
          '        0 AS VLRINFINSS, '+
          OraNumero(sSALPART)        +  ' AS VALORPROVENTO, '+
          OraNumero(sREMTOTAL)       +  ' AS VALORREMTOTAL, '+
          OraNumero(sSalarioIntegral)+  ' AS VALORINTEGRAL, '+
          '        0 AS VALORBASE1, '+
          '        0 AS VALORBASE2, '+
          '        0 AS VALORBASE3, '+
          '        0 AS VALORRESERVA, '+
          OraNumero(sIdSitFuncAtual)+  ' AS IDSITFUNC, ' +
          OraNumero(sIdSitPartAtual)+  ' AS IDSITPART, ' +
          OraNumero(sIdSitPlanAtual)+  ' AS IDSITPLANOPREV ,  '+
          OraNumero(sIdSitPartAntes)+  ' AS IDSITPARTATUAL,   '+
          OraNumero(sIdSitPlanAntes)+  ' AS IDSITPLANOATUAL,  '+
          OraNumero(sIdSitFuncAntes)+  ' AS IDSITFUNCATUAL,   '+
          '        0 AS FLGTIPOINSS, '+
          QuotedStr(DateToStr(Date))+' AS DATAREF, '+
          QuotedStr(DateToStr(Date))+' AS DATAINICIO, '+
          QuotedStr(DateToStr(Date))+' AS DATAINICIOFUND, '+
          QuotedStr(DateToStr(Date))+' AS DATAINICIOINSS,   '+
          QuotedStr(DateToStr(Date))+' AS DATAINICIOPAGTO,  '+
          QuotedStr(DateToStr(Date))+' AS DATAREQUERIMENTO, '+
          ' ''          ''  AS IDTPPAGTOANT,     '+
          ' ''          ''  AS ULTMESREAJANT,    '+
          ' ''          ''  AS FLGBENEFMINANT,   '+
          ' ''          ''  AS DATAEVENTOANT,    '+
          ' ''          ''  AS CODBENEFICIOANT,  '+
          ' ''          ''  AS DATAINICIOANT,    '+
          '        0 AS VLBENEFPGTO,        '+
          '        0 AS VALORBENEFANT,      '+
          '        0 AS VALORBINSSANT1,     '+
          '        0 AS VALORBINSSANT2,     '+
          '        0 AS VALORBINSSANT3,     '+
          '        0 AS NUMBENEF,           '+
          '        0 AS VALORBASE1INSS,     '+
          '        0 AS VALORBASE2INSS,     '+
          '        0 AS VALORBASE3INSS,     '+
          '        0 AS VALORSRB,           '+
          '        0 AS SOMAITEMNOPBC,  '+
          '        0 AS SOMAITEMNADIB,  '+
          '        ''          '' AS DATAFINAL,   '+
          '        0 AS VALORASSOCIADO, 0 AS ASSOC1OP1, 0 AS ASSOC2OP1, 0 AS ASSOC3OP1, '+
          '        0 AS ASSOC1OP2, 0 AS ASSOC2OP2, 0 AS ASSOC3OP2, '+
          '        0 AS ASSOC1OP3, 0 AS ASSOC2OP3, 0 AS ASSOC3OP3  '+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITPART SP, SITFUNC SF, BENEFPLANOPART BPL,  '+
          ' BENEFBFCIARIO BFC '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(iIdPessoa)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND '+
          '        BFC.IDBENEFICIO(+) = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString + ' AND '+
          '        EL.IDPESSJUR       = PP.IDPESSJUR AND '+
          '        EL.IDPESSOA        = PP.IDPESSOA AND '+
          '        PF.IDPESSOA        = EL.IDPESSOA AND '+
          '        EL.IDSITFUNC       = SF.IDSITFUNC AND '+
          '        PP.IDPESSJUR       = BFC.IDPESSJUR(+) AND '+
          '        PP.IDPLANOPREV     = BFC.IDPLANOPREV(+) AND '+
          '        PP.IDPESSOA        = BFC.IDPESSOA(+) AND '+
          '        PP.SEQPROPOSTA     = BFC.SEQPROPOSTA(+) AND '+
          '        SP.IDSITPART       = PP.IDSITPART AND '+
          '        BPL.IDPESSJUR(+)   = BFC.IDPESSJUR AND '+
          '        BPL.IDPESSOA(+)    = BFC.IDTITULAR AND '+
          '        BPL.IDPESSOA (+)   = BFC.IDPESSOA AND '+
          '        BPL.IDPLANOPREV(+) = BFC.IDPLANOPREV AND '+
          '        BPL.SEQPROPOSTA(+) = BFC.SEQPROPOSTA AND '+
          '        BPL.IDBENEFICIO(+) = BFC.IDBENEFICIO ';


  iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraCalculo').AsInteger;
  memResult.Lines.Add(' - Executando regra de cálculo do benefício.');
  memResult.Lines.Add('   Regra de Cálculo Nº '+IntToStr(iIdRegraCalculo)+'.');

  Result := RegraNumerica(IntToStr(iIdRegraCalculo),sSQL, PbErro, iIdCalculo );

  if PbErro
   then begin
     PbErro    := True;
     PsMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(iIdRegraCalculo)+') ';
     Result    := '0';
     Exit;
  end;

  if Trim(Result) = ''
  then begin
     PbErro    := True;
     PsMsgErro := '   A regra de cálculo nº '+IntToStr(iIdRegraCalculo)+' retornou um valor nulo';
     Result    := '0';
     Exit;
  end;
end;

function TFrmParamRelExtratoDeslig.GravaDados(PsIdEventoGerador,
  PsDescricao, PsValor: String): Boolean;
Var
  iIdSimulaDeslig : Integer;
begin
  iIdSimulaDeslig := LeUltRegistro(qryExe,'SIMULADESLIG');

  qryExe.Close;
  qryExe.SQL.Clear;
  qryExe.SQL.Add('INSERT INTO SIMULADESLIG ');
  qryExe.SQL.Add('  (IDSIMULADESLIG, IDPESSOA, IDPESSJUR, IDPLANOPREV,');
  qryExe.SQL.Add('IDEVENTOGERADOR, DESCRICAO, VALOR) ');
  qryExe.SQL.Add('VALUES (');
  qryExe.SQL.Add(IntToStr(iIdSimulaDeslig)+', ');  // IDSIUMULADESLIG
  qryExe.SQL.Add(IntToStr(iIdpessoa)+', ');        // IDPESSOA
  qryExe.SQL.Add(IntToStr(iIdpessjur)+', ');       // IDPESSJUR
  qryExe.SQL.Add(IntToStr(iIdPlanoPrev)+', ');     // IDPLANOPREV
  qryExe.SQL.Add(PsIdEventoGerador+', ');          // IDEVENTOGERADOR
  qryExe.SQL.Add(QuotedStr(PsDescricao)+', ');     // DESCRICAO
  qryExe.SQL.Add(PsValor+')');                     // VALOR

  Try
    qryExe.ExecSQL;
    Result := True;
  Except
    Result := False;
  End;
end;

function TFrmParamRelExtratoDeslig.CalculaSalManut(PiIdPessJur,
  PiIdPessoa: integer; PsMesRef, PsFlgInterno: string): String;
Var
  RegSal : TRegSalMes;
begin
  RegSal := CalcUltSalPart(PiIdPessJur,
                          PiIdPessoa,
                          PsMesRef,
                          PsFlgInterno,
                          qryAux);

  Result := RegSal.Valor;
end;

procedure TFrmParamRelExtratoDeslig.memResultChange(Sender: TObject);
begin
  inherited;
  If memResult.Lines.Count > 14
   Then memResult.ScrollBars := ssVertical
   Else memResult.ScrollBars := ssNone;
end;

function TFrmParamRelExtratoDeslig.GravaReservasAssociadas : Boolean;
Var
 dValor : Double;
 sValor : String;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CD.IDCFGSIMULADESLIG, CD.IDEVENTOGERADOR, RD.IDTIPORESERVA,');
  qryAux.SQL.Add('       RXP.NOME, RXP.CODHIERARQUIA, RP.VALORRESERVA');
  qryAux.SQL.Add('FROM RESERVAPART RP,');
  qryAux.SQL.Add('	 RESERVADESLIG RD,');
  qryAux.SQL.Add('     RESERVAXPLANO RXP,');
  qryAux.SQL.Add('     CFGSIMULADESLIG CD');
  qryAux.SQL.Add('WHERE RP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
  qryAux.SQL.Add('  AND RP.IDPESSJUR   = '+IntToStr(iIdpessjur));
  qryAux.SQL.Add('  AND RP.IDPESSOA    = '+IntToStr(iIdpessoa));
  qryAux.SQL.Add('  AND RD.IDTIPORESERVA = RP.IDTIPORESERVA');
  qryAux.SQL.Add('  AND CD.IDCFGSIMULADESLIG = RD.IDCFGSIMULADESLIG');
  qryAux.SQL.Add('  AND RXP.IDPLANOPREV = RP.IDPLANOPREV');
  qryAux.SQL.Add('  AND RXP.IDTIPORESERVA = RP.IDTIPORESERVA');
  qryAux.SQL.Add('  AND NVL(RP.VALORRESERVA,0) > 0');
  qryAux.SQL.Add('ORDER BY CD.IDCFGSIMULADESLIG, CD.IDEVENTOGERADOR, RXP.CODHIERARQUIA');
  qryAux.Open;

  qryAux.First;
  While Not qryAux.Eof do
   Begin
    dValor := qryAux.FieldByName('VALORRESERVA').AsFloat * dValorCota;
    sValor := OraNumero(FloatToStr(dValor));

    If Not GravaDados(qryAux.FieldByName('IDEVENTOGERADOR').AsString,
                      '('+qryAux.FieldByName('CODHIERARQUIA').AsString + ') '+
                      qryAux.FieldByName('NOME').AsString + ' - '+
                      qryAux.FieldByName('VALORRESERVA').AsString + ' X ' +
                      FloatToStr(dValorCota),
                      sValor)
     Then Begin
      Result := False;
      Exit;
     End; 

    qryAux.Next;
   End; 
   Result := True;
end;

end.
