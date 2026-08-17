//******************************************************************************
// Rotina     : bbtnConfirmar/bbtnCancelar/bbtnConfirmarClick
// SOL        : 93417
// Kintana    : 406468
// Data       : 08/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementacao para tratar os constantes travamentos entre os
//               processos do módulo de Investimentos(propriedade visible = false,
//               para os botões bbtnConfirmar/bbtnCancelar).
//******************************************************************************
// Data      : 13/05/2008
// Código    : AL_15
// Pendencia : 27913
// SOL       : 85013
// Desc      : Devido a implementação na função "BuscaDataBloqContab(" que retorna a maior data
//              bloqueada na contabilidade e a mesma estava sendo incrementada e trazendo a
//              próxima data disponível. Foi alterada para o seu devido funcionamento.
//              A dDataIntegra recebe a data bloqueada e é incrementada com o próximo dia útil.
//******************************************************************************
// Data      : 10/04/2007
// Código    : AL_14
// Motivo    : Implementação das rotinas de aplicação e resgate a cotizar para
//             efetuar as operações após as atualizações de saldos.
//******************************************************************************
// Data      : 22/03/2007
// Código    : AL_13
// Pendencia : 24843
// Motivo    : Implementação das rotinas de aplicação e resgate a cotizar no
//             reprocessamento.
//******************************************************************************
// Data      : 21/03/2007
// Código    : AL_12
// Pendencia : 24834
// Desc      : Corrigindo AL_11
//             Retirando a obrigatoriedade do preenchimento do IDMOTBLOQPENFDO E
//             só realizar a IntegraPenhoraJuridico se IDMOTBLOQPENFDO estiver
//             preenchido.
//             Habilito o botão processa depois da data preenchida quando somete 1
//             fundo e ele está preenchido.
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_11
// Pendencia : 24384
// Desc      : Sugerir o Fundo de Investimento quando só existir um
//******************************************************************************
// Data      : 31/01/2007
// Código    : AL_10
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_9
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Implementação do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_8
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 06/09/2005
// Código   : Al_7
// Motivo   : Ajuste na abertura da query de seleção de fundos
//******************************************************************************
// Data     : 25/07/2005
// Código   : Al_6
// Motivo   : Implementação das funcionalidade de AtualizaCotaIntegralizar e AtualizaHistCotaIntegr
//******************************************************************************
// Data     : 25/07/2005
// Código   : Al_5
// Motivo   : Implementação o acrescimo dos fundos de Ações e FIDC
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_4
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Variável : bPrivProcessado
// Linhas   : AL_3
// Data     : 08/12/2004
// Descrição: Variável controla se foi processado ou não o Fundo de Investimento
//******************************************************************************
// Alteração: AL_2
// Data     : 08/12/2004
// Descrição: Se algo der errado na gravação, mostra mensagem para o sistema e
//            anula o fechamento, se der certo finaliza e libera o processamento
//******************************************************************************
// Alteração: AL_1
// Data     : 08/12/2004
// Descrição: Se algo der errado na gravação, mostra mensagem para o sistema e
//            anula o fechamento.
//******************************************************************************
unit FFechtoFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  ComCtrls, wwdblook, Db, Wwdatsrc, DBTables, Wwquery,
  FSairAjuda, UBibliotecaInvest, UOperacaoInvest, UOperComum, dOperComum,
  URegra, FOkCancelar, FAguarde, uCtrlInvContab;

type
  TfrmFechtoFundos = class(TfrmOkCancelarInv)
    bbtnCommita: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pnlDatas: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    dteDataInicio: TCMDateTimePicker;
    dteDataFinal: TCMDateTimePicker;
    pnlBarras: TPanel;
    lblDia: TLabel;
    lblDescFundo: TLabel;
    prbDatas: TProgressBar;
    prbAtualizaFundos: TProgressBar;
    QryTipoFundo: TwwQuery;
    DsTipoFundo: TwwDataSource;
    dbLkTipoFundo: TwwDBLookupCombo;
    lblTipodeFundo: TLabel;
    pnlPlanoPatrocinadora: TPanel;
    QryAux: TwwQuery;
    Label2: TLabel;
    QryParaminvest: TwwQuery;
    QryBuscaDataFech: TwwQuery;
    dbFundo: TwwDBLookupCombo;
    Label14: TLabel;
    Label3: TLabel;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    dbPlano: TwwDBLookupCombo;
    QryFundoInvest: TwwQuery;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    LblDataAplDesc: TLabel;
    LblAtualizacao: TLabel;
    LblDataMovDesc: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCommitaClick(Sender: TObject);
    procedure dbLkTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbLkTipoFundoExit(Sender: TObject);
    //AL_12
    procedure dteDataFinalExit(Sender: TObject);
  private
    { Private declarations }
    //AL_3
    bPrivProcessado : Boolean;
    iPrivIdTipoFundo: Integer;
    procedure PeriodoFundo;
    procedure TrataProcessar;    
  public
    { Public declarations }
  end;

var
  frmFechtoFundos: TfrmFechtoFundos;
  DataProxFech, DataUltFech : TDate;

implementation

uses dBaseDados, UMensErro, USistema, UDataBase, UFundoComum, UDiasUteisInv, UDiasUteis,
     dOperacaoInvest,ULancContab,FPrincipal, UCotaComum;

{$R *.DFM}

procedure TfrmFechtoFundos.bbtnConfirmarClick(Sender: TObject);
var
    DataProc, DataAnt : TDateTime;
    iFundo, iPlano, iNumdias : integer;
    bFechado          : Boolean;
    //AL_10
    dDataIntegra : TDateTime;
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    
    iIdTipoFundo, iTipoFundoInvest : Integer;
begin
   //AL_12
   SelectNext(ActiveControl,True,True); // Passar o foco para próximo campo

   if VerEmAbertura(StrToInt(dbLkTipoFundo.LookupValue)) then
      Exit;

   bbtnCommita.Enabled   := False;
   bbtnCancelar.Enabled  := True;
   bbtnConfirmar.Enabled := False;
   inherited;

   if (Trim(dteDataInicio.Text) = '') or (Trim(dteDataFinal.Text) = '') then
   begin
      ShowMessage('As Datas de Início e Fim devem ser Preenchidas !!!!');
      if dteDataFinal.CanFocus then
         dteDataFinal.SetFocus;
      exit;
   end;

   // AL_4
   //AL_8
   if not CtrlInvContab.TestaPeriodo(dteDataInicio.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dteDataInicio.CanFocus then
         dteDataInicio.SetFocus;
      Exit;
   end;

   //Início: AL_1
   try
      //AL_3
      bPrivProcessado := False;
      GravaEmAbertura(StrToInt(dbLkTipoFundo.LookupValue),'S');
      iNumdias := DiasUteisInv.IntervaloDias(dteDataInicio.DateTime, dteDataFinal.DateTime);
      prbDatas.Max := iNumdias + 1;
      prbDatas.Position := 0;

      DataProc      :=StrToDate(dteDataInicio.Text);

      While DataProc <= StrToDate(dteDataFinal.Text) Do
      Begin
         lblDia.Caption := DateToStr(DataProc);
         lblDia.Repaint;
         Application.ProcessMessages;

         If dbFundo.Text <> '' Then
            iFundo := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger
         Else
            iFundo := -1;

         If dbPlano.Text <> '' Then
            iPlano := QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger
         Else
            iPlano := -1;

         //AL_14
         //AL_9
         //Al_4
         //Calcula a Cota Integralizar dos Fundos Imobiliários/Ações/FIDC/FIP
         if QryTipoFundo.FindField('IDTIPOINVEST').AsInteger in [6,7,9,10] then
         begin
            if not AtualizaCotaIntegralizar(DataProc, QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iFundo, True) then
            begin
               prbAtualizaFundos.Max := 0;
               prbAtualizaFundos.StepIt;
               bbtnCancelar.Click;
               Exit;
            end;

            if Not AtualizaHistCotaIntegr(DataProc, -1,
                                          QryTipoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                          QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                          iFundo, iPlano, True) then
            begin
               prbAtualizaFundos.Max := 0;
               prbAtualizaFundos.StepIt;
               bbtnCancelar.Click;
               Exit;
            end;
         end;

         if Not AtualizaSaldoFundos(QryTipoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                    QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    iFundo, iPlano, DataProc, True, True) then
         begin
            prbAtualizaFundos.Max := 0;
            prbAtualizaFundos.StepIt;
            bbtnCancelar.Click;
            Exit;
         end;

         //AL_14 - Ini
         //AL_13
         //Inicia Transação
         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         If Not CotizaAplicacao(DataProc, iFundo, iPlano,
                                QryTipoFundo.FindField('IDTIPOFUNDOINVEST').AsInteger) Then
         Begin
            prbAtualizaFundos.Max := 0;
            prbAtualizaFundos.StepIt;
            bbtnCancelar.Click;
            Exit;
         End;

         If Not CotizaResgate(DataProc, iFundo, iPlano,
                              QryTipoFundo.FindField('IDTIPOFUNDOINVEST').AsInteger) Then
         Begin
            prbAtualizaFundos.Max := 0;
            prbAtualizaFundos.StepIt;
            bbtnCancelar.Click;
            Exit;
         End;

         //AL_13
         // Confirma Transação
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         //AL_14 - Fim   

         // Incrementa data de Processamento
         DataProc      :=DataProc+1;
         //Dias uteis para todos os Fundos menos os Fundos Imobiliarios
         if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 1) then
         begin
            While not DiasUteisInv.DiaUtil(DataProc,-1,1,'',True,False,False) Do
               DataProc  := DataProc+1;   // Achar o próximo dia útil
         end;
         prbAtualizaFundos.Position:=0;
         prbDatas.StepIt;
      end;

      //AL_12
      if ((pRPI.IDMOTBLOQPENFDO <> 0) and (pRPI.IDMOTBLOQPENFDO <> null)) then
       begin
          //A rotina que busca a data bloqueada, foi alterada, para somente trazer a data bloqueada.
          //E antes essa rotina trazia a próxima da disponível.
          //AL_15
          //AL_10
          dDataIntegra := CtrlInvContab.BuscaDataBloqContab(dteDataInicio.Date);
          While not DiasUteisInv.DiaUtil(dDataIntegra,-1,1,'',True,False,False) Do
             dDataIntegra := dDataIntegra + 1;   // Achar o próximo dia útil

          if not IntegraPenhoraJuridico(dDataIntegra, StrToDate(dteDataFinal.Text), 0) then
          begin
             MsgDlg('Ocorreu um problema na Importação de Penhoras do Jurídico.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
             prbAtualizaFundos.Max := 0;
             prbAtualizaFundos.StepIt;
             bbtnCancelar.Click; // Faz RollBack
             exit;
          end;
      end;

      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := True;
      bbtnCommita.Enabled   := True;

      prbAtualizaFundos.Position := 0;
      prbAtualizaFundos.Max      := 0;
      prbAtualizaFundos.StepIt;

      DataProxFech := DataProc - 1;
      //Dias uteis para todos os Fundos menos os Fundos Imobiliarios
      if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 1) then
      begin
         While not DiasUteisInv.DiaUtil(DataProxFech,-1,1,'',True,False,False) Do
            DataProxFech  := DataProxFech - 1;   // Achar o dia útil anterior
      end;

      //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
      iIdTipoFundo := StrToInt(dbLkTipoFundo.LookupValue);

      If not DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.StartTransaction;

      ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET DATAULTFECHFDO = TO_DATE('''+
                   DateToStr(DataProxFech)+''',''DD/MM/YYYY'')');

      ExecutaQuery(QryAux,'UPDATE TIPOFUNDOINVEST SET DATAULTFECH = TO_DATE('''+
                   DateToStr(DataProxFech)+''',''DD/MM/YYYY'') WHERE IDTIPOFUNDOINVEST ='+
                   QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString);

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

      // Monta Registro do Parâmetro
      Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

      // Preenche Datas com o ultimo fechamento + 1
      if FazQuery(QryAux,'SELECT DATAULTFECHFDO FROM PARAMINVEST') then
      begin
         if QryAux.FieldByName('DATAULTFECHFDO').AsDateTime = 0 then
            dteDataInicio.Date := Date
         else
            dteDataInicio.Date := QryAux.FieldByName('DATAULTFECHFDO').AsDateTime+1;

         While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
            dteDataInicio.Date  := dteDataInicio.Date + 1;   // Achar o próximo dia útil
         dteDataFinal.Date := dteDataInicio.Date;
      end;

      iTipoFundoInvest := StrToInt(dbLkTipoFundo.LookupValue);

      OperComum.LimpaParametros(qryTipoFundo);
      QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryTipoFundo.Open;

      QryTipoFundo.Locate('IDTIPOFUNDOINVEST',iTipoFundoInvest,[]);

      dbLkTipoFundo.Text := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
      dbLkTipoFundo.LookupValue := IntToStr(iTipoFundoInvest);
      PeriodoFundo;
      pnlPlanoPatrocinadora.Caption := '';
      lblDia.Caption := '';
      prbAtualizaFundos.Position := 0;
      prbDatas.Position := 0;

      GravaEmAbertura(iIdTipoFundo,'N');
      bPrivProcessado := True;
      //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468

      pnlPlanoPatrocinadora.Caption := 'Processo Concluído com Sucesso.';
   except
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Rollback;
      pnlPlanoPatrocinadora.Caption := 'Não foi possível concluir a operação.';
      GravaEmAbertura(StrToInt(dbLkTipoFundo.LookupValue),'N');
   end;
   //Fim: AL_1
end;


procedure TfrmFechtoFundos.FormShow(Sender: TObject);
begin
   inherited;

   // Pega data de Acordo com o Tipo de Menu
   if TipoMenuInvest = 'A' then
   begin
      MsgDlg('Sistema Utilizado para Todos os Tipos de Investimento.'+#13+
             'Escolha Apenas Um dos Tipos.','Mensagem do Sistema', mtWarning,[MbOk],0);
      Close;
      Exit;
   end;

   if pRPI.DATAULTFECHFDO <> 0 then
   begin
      dteDataInicio.Date := pRPI.DATAULTFECHFDO + 1;
      dteDataFinal.Date  := pRPI.DATAULTFECHFDO + 1;
   end;

   QryTipoFundo.Close;
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   QryPatroPlanPrevContab.Close;
   QryPatroPlanPrevContab.Open;

   //AL_9
   OperComum.LimpaParametros(QryFundoInvest);
   //Al_7
   If QryTipoFundo.RecordCount = 1 then
   begin
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      //AL_11
      dbLkTipoFundo.Text := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
      //AL_12
      dbLkTipoFundo.PerformSearch; // Posicionar o ponteiro no lookup
   end
   else If QryTipoFundo.RecordCount < 1 then
           QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := -1;

   QryFundoInvest.Open;

   //Dias uteis para todos os Fundos menos os Fundos Imobiliarios
   if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 1) then
   begin
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date  := dteDataInicio.Date + 1;   // Achar o próximo dia útil

      dteDataFinal.Date := dteDataInicio.Date;
   end;

   if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 0) then
      bbtnConfirmar.Enabled := False
   else
      bbtnConfirmar.Enabled := True;

end;

procedure TfrmFechtoFundos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Caso o Banco esteja em Transacao Cancela
   If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Rollback;
   //AL_3
   if ((Not bPrivProcessado) And (Trim(dbLkTipoFundo.LookupValue) <> '')) then
      GravaEmAbertura(StrToInt(dbLkTipoFundo.LookupValue),'N');
      
   inherited;
   // Fecha Querys
   QryTipoFundo.Close;
end;

procedure TfrmFechtoFundos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   // Caso o Banco esteja em Transacao Rollbacka
   If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Rollback;

   // Inabilita Botao
   bbtnCancelar.Enabled  := False;
   bbtnCommita.Enabled := False;
   if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 0) then
      bbtnConfirmar.Enabled := False
   else bbtnConfirmar.Enabled := True;

   // Preenche Datas com o ultimo fechamento + 1
   if FazQuery(QryAux,'SELECT DATAULTFECHFDO FROM PARAMINVEST') then
   begin
      dteDataInicio.Text := DateToStr(QryAux.FieldByName('DATAULTFECHFDO').AsDateTime+1);
      // Achar o próximo dia útil
      While not DiasUteisInv.DiaUtil(StrToDate(dteDataInicio.Text),-1,1,'',True,False,False) Do
         dteDataInicio.Text  := DateToStr(StrToDate(dteDataInicio.Text) + 1);

      dteDataFinal.Text := dteDataInicio.Text;

      dteDataInicio.Repaint;
      dteDataFinal.Repaint;

   end;
   //AL_3
   if ((Not bPrivProcessado) And (Trim(dbLkTipoFundo.LookupValue) <> '')) then
      GravaEmAbertura(StrToInt(dbLkTipoFundo.LookupValue),'N');
   pnlPlanoPatrocinadora.Caption := '';
   pnlPlanoPatrocinadora.Repaint;

   lblDia.Caption := '';
   lblDia.Repaint;

   Label2.Visible := False;

   prbDatas.Max   := 0;
   prbDatas.StepIt;
   prbAtualizaFundos.Max := 0;
   prbAtualizaFundos.StepIt;

   OperComum.LimpaParametros(qryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    
   
end;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    

procedure TfrmFechtoFundos.PeriodoFundo;
begin
   //AL_9
   if QryTipoFundo.RecordCount > 0 then
      dteDataInicio.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime+1;
   //Dias uteis para todos os Fundos menos os Fundos Imobiliarios
   if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 1) then
   begin
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date  := dteDataInicio.Date+1;  // Achar o próximo dia útil
   end;
   dteDataFinal.Date := dteDataInicio.Date;
End;

procedure TfrmFechtoFundos.bbtnCommitaClick(Sender: TObject);
var iTipoFundoInvest, iIdTipoFundo : Integer;
begin
   iIdTipoFundo := StrToInt(dbLkTipoFundo.LookupValue);
   inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   //Início: AL_2
   try
      try
         // Guarda a Data do Ultimo Fechamento

         ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET DATAULTFECHFDO = TO_DATE('''+
                      DateToStr(DataProxFech)+''',''DD/MM/YYYY'')');

         ExecutaQuery(QryAux,'UPDATE TIPOFUNDOINVEST SET DATAULTFECH = TO_DATE('''+
                      DateToStr(DataProxFech)+''',''DD/MM/YYYY'') WHERE IDTIPOFUNDOINVEST ='+
                      QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString);

         // Caso o Banco esteja em Transacao Commita
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Commit;

         // Monta Registro do Parâmetro
         Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

         // Inabilita Botao
         bbtnCancelar.Enabled  := False;
         bbtnCommita.Enabled := False;
         if (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 0) then
             bbtnConfirmar.Enabled := False
         else bbtnConfirmar.Enabled := True;

         // Preenche Datas com o ultimo fechamento + 1
         if FazQuery(QryAux,'SELECT DATAULTFECHFDO FROM PARAMINVEST') then
         begin
            dteDataInicio.Date := QryAux.FieldByName('DATAULTFECHFDO').AsDateTime+1;
            While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
               dteDataInicio.Date  := dteDataInicio.Date + 1;   // Achar o próximo dia útil
            dteDataFinal.Date := dteDataInicio.Date;
         end;

         iTipoFundoInvest := StrToInt(dbLkTipoFundo.LookupValue);

         OperComum.LimpaParametros(qryTipoFundo);
         QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
         QryTipoFundo.Open;

         QryTipoFundo.Locate('IDTIPOFUNDOINVEST',iTipoFundoInvest,[]);

         dbLkTipoFundo.Text := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
         dbLkTipoFundo.LookupValue := IntToStr(iTipoFundoInvest);
         PeriodoFundo;
         pnlPlanoPatrocinadora.Caption := '';
         lblDia.Caption := '';
         prbAtualizaFundos.Position := 0;
         prbDatas.Position := 0;
      except
         MsgDlg('Não foi possível concluir a operação.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
         GravaEmAbertura(StrToInt(dbLkTipoFundo.LookupValue),'N');
      end;
   finally
      GravaEmAbertura(iIdTipoFundo,'N');
      //AL_3
      bPrivProcessado := True;
   end;
   //Fim: AL_2
end;

procedure TfrmFechtoFundos.TrataProcessar;
begin
   if (Trim(dbLkTipoFundo.Text) <> '') and
      (QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 0) then
       bbtnConfirmar.Enabled := True
   else
       bbtnConfirmar.Enabled := False;
end;

procedure TfrmFechtoFundos.dbLkTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   TrataProcessar;
   PeriodoFundo;
end;

procedure TfrmFechtoFundos.dbLkTipoFundoExit(Sender: TObject);
begin
  inherited;
   //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    
   pnlPlanoPatrocinadora.Caption := '';   

   TrataProcessar;

   //AL_9
   //Al_7
   OperComum.LimpaParametros(QryFundoInvest);
   If Trim(dbLkTipoFundo.Text) <> '' then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                      QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger
   else
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := -1;
   QryFundoInvest.Open;
end;

//AL_12
procedure TfrmFechtoFundos.dteDataFinalExit(Sender: TObject);
begin
  inherited;
  //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468    
   pnlPlanoPatrocinadora.Caption := '';   

  //AL_12
  If (QryTipoFundo.RecordCount = 1) and (dbLkTipoFundo.text <> '') then  
     TrataProcessar;
end;

end.


