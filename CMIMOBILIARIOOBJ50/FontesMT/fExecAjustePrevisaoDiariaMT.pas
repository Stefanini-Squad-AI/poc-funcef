{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina             : btnContinuarClick
//N. SIG..........   : 59816   
//Data da Alteração: : 15/12/2017
//Alteração Form:    : fExecAjustePrevisaoDiariaMT
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Correção na rotina de fechamento imobiliário, para evitar a falha
//                     que ocorre ao término do processamento, além de evitar que oritna
//                     seja executada mais de uma vez.
//***************************************************************************************
Rotina......: -
Nº SOL......: 172601/14639 e 172601/14640  Admin e Alien
Nº KINTANA..: 2019067 e 2019131
Data........: 11/10/2013
Responsável.: Felipe A. Santos
Descrição...: criação da FLAG executar rotina via ETL para execução de todo o
              processo via ETL.
-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902 e 172902/8221 Admin e Alien
Nº KINTANA..: 1577381 e 1577344
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------
SOL: 70892, 70895
KTN: 523241, 533246
Responsável: Ricardo Alves
Data: 04/11/2009
Descrição: Na tela Previsões Diárias -> Ajusta Previsão, ao final do processo de ajuste
  de contabilização diária, se o último dia indicado na tela for o último dia
  daquele mês, o período contábil do sistema (Alienação, Administração
  Imobiliária) será bloqueado.

--------------------------------------------------------------------------------
Pendências  : 25820
Responsável : Daniel Simões
Data        : 10/07/2007
Descrição   : Torna o campo Documento visível apenas quando o usuário for
              'VINICIUS.CM'
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Retirados os parâmetros em desuso na chamada da função
              'UltimoFechamento'...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecAjustePrevisaoDiariaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Db, DBClient,
  uCMClientDataSet, uCtrlTipoCustoRecImov, uFuncoesImob, uCtrlParamIntegra,
  uComunsImobiliario, uVerificaPreenchimento, uSistema, uDataBase, fProgresso,
  fProgressoDuplo, uMensErro, uModuloImobiliario, dBaseDados, uCtrlPrevImob,
  mImovelouMestre, wwriched, Menus, uCtrlOperImob, wwdbdatetimepicker, CMDateTimePicker,
  TREdit,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab, DBTables, Wwquery;

type
  TfrmExecAjustePrevisaoDiariaMT = class(TfrmWizardMT)
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    memResultado: TwwDBRichEdit;
    pcSelecao: TPageControl;
    tsSelOperacao: TTabSheet;
    tsSelRecDes: TTabSheet;
    GroupBox1: TGroupBox;
    chkCalculaProvisao: TCheckBox;
    chkIntegraProvisao: TCheckBox;
    chkAtualizaDocum: TCheckBox;
    chkIntegraAtual: TCheckBox;
    chkCalculaReceita: TCheckBox;
    chkIntegraReceita: TCheckBox;
    chkCalculaJurosAlienacao: TCheckBox;
    chkIntegraJurosAlienacao: TCheckBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    rdPeriodicidade: TRadioGroup;
    dbCboTipoCustoRecImov: TwwDBLookupCombo;
    chkEncerra: TCheckBox;
    molImovelouMestre1: TmolImovelouMestre;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    GroupBox2: TGroupBox;
    chkAjusta: TCheckBox;
    chkConsolida: TCheckBox;
    chkIntegra: TCheckBox;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    edtDataProv: TCMDateTimePicker;
    Label4: TLabel;
    edtDataFim: TCMDateTimePicker;
    chkAtualizaResiduo: TCheckBox;
    chkIntegraAtualResiduo: TCheckBox;
    chkIntegraFinanc: TCheckBox;
    gbDocumento: TGroupBox;
    edtDoc: TRealEdit;
    chkGeraLog: TCheckBox;
    chkAtualizaSaldo: TCheckBox;
    chkIntegraSaldo: TCheckBox;
    chkCalculaCMAlienacao: TCheckBox;
    chkIntegraCMAlienacao: TCheckBox;
    chkExeRotinaETL: TCheckBox;
    procedure rdPeriodicidadeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure edtDocExit(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlPrevImob: TCtrlPrevImob;
    CtrlOperImob: TCtrlOperImob;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
    procedure Progresso (vParams: array of variant);
  public
    { Public declarations }
  end;

var
  frmExecAjustePrevisaoDiariaMT: TfrmExecAjustePrevisaoDiariaMT;

implementation

//uses
  //DateUtil;

{$R *.DFM}

{ TfrmAjustePrevisaoDiariaMT }


procedure TfrmExecAjustePrevisaoDiariaMT.FormCreate(Sender: TObject);
var
  dDiaAux: TDate;
  vDia, vMes, vAno: word;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------
   // Verifica a competencia de fechamento e parametros por módulo
   // ----------------------------------------------------------------------------------------------

   molImovelouMestre1.Visible       := (Sistema.IdModulo = 64);

   chkCalculaReceita.Checked        := (Sistema.IdModulo = 64);
   chkCalculaReceita.Visible        := (Sistema.IdModulo = 64);

   chkIntegraReceita.Checked        := (Sistema.IdModulo = 64);
   chkIntegraReceita.Visible        := (Sistema.IdModulo = 64);

   chkCalculaJurosAlienacao.Checked := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkCalculaJurosAlienacao.Enabled := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkCalculaJurosAlienacao.Visible := (Sistema.IdModulo  = 135);

   chkIntegraJurosAlienacao.Checked := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkIntegraJurosAlienacao.Enabled := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkIntegraJurosAlienacao.Visible := (Sistema.IdModulo  = 135);

   chkCalculaCMAlienacao.Checked    := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkCalculaCMAlienacao.Enabled    := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkCalculaCMAlienacao.Visible    := (Sistema.IdModulo  = 135);

   chkIntegraCMAlienacao.Checked    := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkIntegraCMAlienacao.Enabled    := ((Sistema.IdModulo = 135) and (ModuloImobiliario.Alienacao.bFlgCMJurDiario));
   chkIntegraCMAlienacao.Visible    := (Sistema.IdModulo  = 135);

   chkAtualizaResiduo.Checked       := (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0);
   chkAtualizaResiduo.Enabled       := (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0);
   chkAtualizaResiduo.Visible       := (Sistema.IdModulo  = 135);

   chkIntegraAtualResiduo.Checked   := (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0);
   chkIntegraAtualResiduo.Enabled   := (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0);
   chkIntegraAtualResiduo.Visible   := (Sistema.IdModulo  = 135);

   chkAtualizaSaldo.Checked         := (ModuloImobiliario.Alienacao.bFlgCMJurDiario = True);
   chkAtualizaSaldo.Enabled         := (ModuloImobiliario.Alienacao.bFlgCMJurDiario = True);
   chkAtualizaSaldo.Visible         := (Sistema.IdModulo = 135);

   chkIntegraSaldo.Checked          := (ModuloImobiliario.Alienacao.bFlgCMJurDiario = True);
   chkIntegraSaldo.Enabled          := (ModuloImobiliario.Alienacao.bFlgCMJurDiario = True);
   chkIntegraSaldo.Visible          := (Sistema.IdModulo = 135);

   // ----------------------------------------------------------------------------------------------

   if Sistema.IdModulo = 64 then
   begin
      dDiaAux := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                            ModuloImobiliario.AdminImob.iMesCompetencia,
                            1
                           );

      // -------------------------------------------------------------------------------------------

      if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
         (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
         (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
      begin
         chkAtualizaDocum.Checked   := True;
         chkIntegraAtual.Checked    := True;
         chkIntegraFinanc.Checked   := True;
         chkAtualizaDocum.Enabled   := True;
         chkIntegraAtual.Enabled    := True;
      end
      else
      begin
         chkAtualizaDocum.Checked   := False;
         chkIntegraAtual.Checked    := False;
         chkIntegraFinanc.Checked   := False;
         chkAtualizaDocum.Enabled   := False;
         chkIntegraAtual.Enabled    := False;
      end;

      // -------------------------------------------------------------------------------------------

      chkCalculaProvisao.Checked    := (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
      chkIntegraProvisao.Checked    := (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
      chkCalculaProvisao.Enabled    := (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
      chkIntegraProvisao.Enabled    := (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);

      chkCalculaReceita.Checked     := (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
      chkIntegraReceita.Checked     := (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
      chkCalculaReceita.Enabled     := (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
      chkIntegraReceita.Enabled     := (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
   end
   else  // if Sistema.IdModulo = 64
   begin
      if (ModuloImobiliario.Alienacao.iAnoCompetencia > 0) and
         (ModuloImobiliario.Alienacao.iMesCompetencia > 0) then
      begin
         dDiaAux := EncodeDate(ModuloImobiliario.Alienacao.iAnoCompetencia,
                               ModuloImobiliario.Alienacao.iMesCompetencia,
                               1
                              );
      end
      else
      begin
         dDiaAux := Date();
      end;


      if (ModuloImobiliario.Alienacao.iTipoOperAtualRes > 0) or
         (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
         (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
      begin
         chkAtualizaDocum.Checked   := True;
         chkIntegraAtual.Checked    := True;
         chkIntegraFinanc.Checked   := True;
         chkAtualizaDocum.Enabled   := True;
         chkIntegraAtual.Enabled    := True;
      end
      else
      begin
         chkAtualizaDocum.Checked   := False;
         chkIntegraAtual.Checked    := False;
         chkIntegraFinanc.Checked   := False;         
         chkAtualizaDocum.Enabled   := False;
         chkIntegraAtual.Enabled    := False;
      end;
   end;  // if Sistema.IdModulo = 64
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // FIM Verifica a competencia de fechamento e parametros por módulo
   // ----------------------------------------------------------------------------------------------

   dDiaAux := IncMonth (dDiaAux, 1);

   DecodeDate(dDiaAux, vAno, vMes, vDia);

   cboMes.ItemIndex  := vMes - 1;
   DBspnAno.Value    := vAno;

   CtrlTipoCustoRecImov    := TCtrlTipoCustoRecImov.Create;

   CtrlTipoCustoRecImov.Initialize(dtmBaseDados.dbBaseDados,
                                   True,
                                   Sistema.ConnectionType,
                                   Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer,
                                   True
                                  );

   // as mensagens serão mostradas no memo ComunsImobiliario.MensErroMT);

   rdPeriodicidade.OnClick(self);

   CtrlPrevImob            := TCtrlPrevImob.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro
                                                  );

   CtrlPrevImob.InitializeAs (CtrlTipoCustoRecImov);

   CtrlOperImob            := TCtrlOperImob.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   ParamIntegra.PlanoPrevGlobal,
                                                   ParamIntegra.PatroGlobal,
                                                   Sistema.UsaPlanoPatro
                                                  );

   CtrlOperImob.InitializeAs (CtrlTipoCustoRecImov);

   edtDataProv.Date := CtrlOperImob.UltimoFechamento+1;
   edtDataFim.Date         := edtDataProv.Date;

   CtrlPrevImob.Progresso  := Progresso;
   CtrlOperImob.Progresso  := Progresso;
   // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlTipoCustoRecImov);
end;



procedure TfrmExecAjustePrevisaoDiariaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoCustoRecImov);
  FreeAndNil(CtrlPrevImob);
  FreeAndNil(CtrlOperImob);
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
  inherited;
end;

procedure TfrmExecAjustePrevisaoDiariaMT.rdPeriodicidadeClick(Sender: TObject);
begin
   inherited;

   case rdPeriodicidade.ItemIndex of
      0: CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, '', -1, 'M');
      1: CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo, '', -1, 'A');
   end;

   chkAjusta.Checked    := not(CdsTipoCustoRecImov.IsEmpty);
   chkConsolida.Checked := not(CdsTipoCustoRecImov.IsEmpty);
   chkIntegra.Checked   := not(CdsTipoCustoRecImov.IsEmpty);

   chkAjusta.Enabled    := not(CdsTipoCustoRecImov.IsEmpty);
   chkConsolida.Enabled := not(CdsTipoCustoRecImov.IsEmpty);
   chkIntegra.Enabled   := not(CdsTipoCustoRecImov.IsEmpty);
end;



procedure TfrmExecAjustePrevisaoDiariaMT.btnContinuarClick(Sender: TObject);
var
   iIdTipoCustoRecimo : integer;
   iAno, iMes         : integer;
   iImovelMestre      : Integer;
   iImovel            : Integer;
   sFlgDiario         : String;
   iData              : Integer;
   iDataIni           : Integer;
   iDataFim           : Integer;
   dDataOperacao      : TDateTime;
   bResult            : Boolean;
   fCM, fJuros        : Extended;

   // Ricardo A. SOL 70892 KTN 523241
   sSql: String;
   dLastDayOfMonth: TDate;
   Year, Month, Day: Word;

   // Alterado por FHBS - SOL: 136336 KTN: 815081
   dDtInicioProc: TDateTime;

begin
   if (edtDataFim.Text = '') or (edtDataProv.Text = '') then begin
      MsgDlg('Informe as datas inicial e final para processamento','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   if edtDataFim.Date < edtDataProv.Date then begin
      MsgDlg('Período de data inválido','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;
   // Helen - SOL: 172902 KTN: 1577381 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataProv.text) then
   begin
      MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
      edtDataProv.SetFocus;
      Exit;
   end;
   // Helen - SOL: 172902 KTN: 1577381 - Fim

   if edtDoc.Value <> 0 then
        CtrlOperImob.iCodDocumentoAjuste := StrToInt(FloatToStr(edtDoc.Value))
   else CtrlOperImob.iCodDocumentoAjuste := -1;

   CtrlOperImob.bGeraLog := chkGeraLog.Checked;

   // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
   CtrlOperImob.DataInicio := edtDataProv.Date;
   CtrlOperImob.DataFim    := edtDataFim.Date;
   // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640 - fim

   //Cássio Rovaroto -  SIG nº 59816 - Início
   if not(CtrlOperImob.ExecutouETL) then
   begin
   	MsgDlg('Há um processamento em execução. Favor aguardar o término para iniciar uma nova execução.','Aviso',mtWarning,[mbOk],0);
    Exit;
   end;
   //Cássio Rovaroto -  SIG nº 59816 - Fim

   inherited;

   memResultado.Clear;
   bResult := True;

   iAno := word(trunc(DBspnAno.Value));
   iMes := cboMes.ItemIndex + 1;

   if dbCboTipoCustoRecImov.Text = '' then
      iIdTipoCustoRecimo := -1
   else
      iIdTipoCustoRecimo := CdsTipoCustoRecImovIDTIPOCUSTORECIMO.AsInteger;

   if rdPeriodicidade.ItemIndex = 0 then
      sFlgDiario := 'M'
   else
      sFlgDiario := 'A';

   iImovel        := -1;
   iImovelMestre  := -1;

   if molImovelouMestre1.edtImovel.Text <> '' then
   begin
      if molImovelouMestre1.iMestre <> -1 then           // imovel selecionado
         iImovel       := molImovelouMestre1.iImovel
      else
         iImovelMestre := molImovelouMestre1.iImovel   // mestre selecionado
   end;

  try
    CtrlPrevImob.CreateThreadProgresso;

    // Alterado por FHBS - SOL: 136336 KTN: 815081
    dDtInicioProc := Now;

    // Execuntando todo o processo via ETL -- Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    if chkExeRotinaETL.Checked then
    begin
         memResultado.Lines.Add ('===========================================================');
         memResultado.Lines.Add ('Início da execução da rotina, via ETL, em ' +
                                  FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '. Favor '+ #13 + 'aguardar.');
         memResultado.Lines.Add ('===========================================================');
         memResultado.Refresh;

         if not(CtrlOperImob.ExecutarETL) then
         begin
              ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
              Exit;
         end
         else
         begin
              memResultado.Lines.Add ('Encerramento da atualização em ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '.');
              memResultado.Lines.Add ('===========================================================');
              Exit; // sai da rotina pois todo processo já foi executado
         end;
    end;
    // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640 - fim
    
    // registra previsão - diária
    if chkAjusta.Checked then begin

      frmProgresso.MostraFormProgresso('Ajustando Previsão Atual...');
      if not CtrlPrevImob.AjustaPrevImob (CtrlPrevImob.ProgressFileName, True,
                                           sFlgDiario, Sistema.IdModulo,
                                           iAno, iMes, iIdTipoCustoRecimo,
                                           iImovelMestre, iImovel,
                                           chkEncerra.Checked) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        Exit;
      end else begin
        memResultado.Lines.Add ('Previsão Atual ajustada com sucesso! ');
        memResultado.Lines.Add ('===========================================================');
      end;
    end;

    // consolida a previsão diária
    if chkConsolida.Checked then begin
      frmProgresso.MostraFormProgresso('Consolidando Previsão Diária...');

      if not CtrlPrevImob.ConsolidaLancPrevImob(CtrlPrevImob.ProgressFileName,
                                True, Sistema.UsaPlanoPatro, Sistema.IdModulo,
                                Sistema.IdUsuario, iAno, iMes, iIdTipoCustoRecimo) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        Exit;
      end else begin
        memResultado.Lines.Add ('Previsão consolidada com sucesso! ');
        memResultado.Lines.Add ('===========================================================');
      end;
    end;

    // integra previsão diária
    if chkIntegra.Checked then begin
      memResultado.Lines.Add ('Resultado da Integração da Previsão..... ');
      memResultado.Lines.Add ('===========================================================');
      frmProgresso.MostraFormProgresso('Integrando Previsão Diária...');
      CtrlPrevImob.IntegraLancDiario(CtrlPrevImob.ProgressFileName,
                                     Sistema.IdEmpresa,
                                     Sistema.IdModulo, Sistema.IdUsuario,
                                     iAno, iMes,
                                     ParamIntegra.PlanoPrevGlobal,
                                     ParamIntegra.PatroGlobal,
                                     ModuloImobiliario.Global.sPlanoPrev,
                                     ModuloImobiliario.Global.sPatro,
                                     Sistema.UsaPlanoPatro,
                                     iIdTipoCustoRecImo);
    end;


    // ------------------------------------------------------------------------------------
    // OPERAÇÕES DIÁRIAS
    // ------------------------------------------------------------------------------------

    dDataOperacao := edtDataProv.Date;
    while dDataOperacao <= edtDataFim.Date do begin

       memResultado.Lines.Add ('Processando dia: ' + DateToStr(dDataOperacao) );
       memResultado.Lines.Add ('===========================================================');

       // Atualiza Documentos Vencidos
       if chkAtualizaDocum.Checked then begin
          memResultado.Lines.Add ('Resultado da Atualização de Documentos vencidos..... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Atualizando documentos vencidos e sem pagamento...');

          if Sistema.IdModulo = 64 then begin
             if not CtrlOperImob.AtualizaDocsVencidos(CtrlOperImob.ProgressFileName,
                                                      ModuloImobiliario.AdminImob.iTipoOperAtualMulta,
                                                      ModuloImobiliario.AdminImob.iTipoOperAtualJuros,
                                                      ModuloImobiliario.AdminImob.iTipoOperAtualCM,
                                                      dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização de documentos realizada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;
          end else begin
             if not CtrlOperImob.AtualizaDocsVencidos(CtrlOperImob.ProgressFileName,
                                                      ModuloImobiliario.Alienacao.iTipoOperAtualMulta,
                                                      ModuloImobiliario.Alienacao.iTipoOperAtualJuros,
                                                      ModuloImobiliario.Alienacao.iTipoOperAtualCM,
                                                      dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização de documentos realizada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;

             if ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualCMAC > 0 then
             begin
                if not CtrlOperImob.AtualizaDocsVencidos(CtrlOperImob.ProgressFileName,
                                                         ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC,
                                                         ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC,
                                                         ModuloImobiliario.Alienacao.iTipoOperAtualCMAC,
                                                         dDataOperacao,-1,False,'A') then begin
                  ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
                  Exit;
                end else begin
                  memResultado.Lines.Add ('Atualização de documentos de ACORDO realizada com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
                end;
             end;

          end;
       end;

       // Integra atualização de documentos vencidos - CONTABILIDADE
       if chkIntegraAtual.Checked then begin
          memResultado.Lines.Add ('Resultado da Integração Contábil da Atualização de Documentos..... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Atualização Contábil de documentos...');

          if Sistema.IdModulo = 64 then begin
             if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualMulta,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualJuros,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualCM, -1, -1,
                                                 '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT ( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização Contábil de Documentos integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;
          end else begin
             if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualMulta,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualJuros,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualCM, -1, -1,
                                                 '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT ( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização Contábil de Documentos integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;

             if ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualCMAC > 0 then
             begin
                if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualCMAC, -1, -1,
                                                    '', dDataOperacao) then begin
                  ComunsImobiliario.MensErroMT ( CtrlOperImob.MessageInfo );
                  Exit;
                end else begin
                  memResultado.Lines.Add ('Atualização Contábil de Documentos de ACORDO integrada com sucesso! ');
                  memResultado.Lines.Add ('====================================================================');
                end;
             end;
          end;
       end;

       // Integra atualização de documentos vencidos - FINANCEIRO - CAR
       if chkIntegraFinanc.Checked then begin
          memResultado.Lines.Add ('Resultado da Integração Financeira da Atualização de Documentos..... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Atualização Financeira de documentos...');

          if Sistema.IdModulo = 64 then begin
             if not CtrlOperImob.AtualizaAlteradores(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualMulta,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualJuros,
                                                 ModuloImobiliario.AdminImob.iTipoOperAtualCM,
                                                 dDataOperacao) then begin

               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização Financeira de Documentos integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;
          end else begin
             if not CtrlOperImob.AtualizaAlteradores(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualMulta,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualJuros,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualCM,
                                                 dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );

               Exit;
             end else begin
               memResultado.Lines.Add ('Atualização Financeira de Documentos integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;

             if ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC +
                ModuloImobiliario.Alienacao.iTipoOperAtualCMAC > 0 then
             begin
                if not CtrlOperImob.AtualizaAlteradores(CtrlOperImob.ProgressFileName,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualMultaAC,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualJurosAC,
                                                    ModuloImobiliario.Alienacao.iTipoOperAtualCMAC,
                                                    dDataOperacao) then begin
                  ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );

                  Exit;
                end else begin
                  memResultado.Lines.Add ('Atualização Financeira de Documentos de ACORDO integrada com sucesso! ');
                  memResultado.Lines.Add ('======================================================================');
                end;
             end;
          end;
       end;

       // -------------------------------------------------------------------------------------------
       //    Calcula Atualização de Resíduos de ALIENAÇÃO
       // -------------------------------------------------------------------------------------------
       if (chkAtualizaResiduo.Checked) and (Sistema.IdModulo = 135) then
       begin
          memResultado.Lines.Add ('Resultado do Cálculo Atualização de Resíduos... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Atualização de Resíduos...');

          if not(CtrlOperImob.CalculaAtualResiduo(CtrlOperImob.ProgressFileName,
                                                 ModuloImobiliario.Alienacao.iTipoOperAtualRes,
                                                 dDataOperacao,
                                                 ''
                                                )) then
          begin
             ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
             Exit;
          end
          else
          begin
             memResultado.Lines.Add ('Atualização de Resíduos calculada com sucesso! ');
             memResultado.Lines.Add ('===========================================================');
          end;
       end;

       // -------------------------------------------------------------------------------------------
       //    Integra Atualizaçào de Resíduos
       // -------------------------------------------------------------------------------------------
       if (chkIntegraAtualResiduo.Checked) and (Sistema.IdModulo = 135) then
       begin
          memResultado.Lines.Add ('Resultado da Integração de Atualização de Residuos... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Atualização de Resíduos...');

          if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName, -1, -1, -1,
                                              ModuloImobiliario.Alienacao.iTipoOperAtualRes, -1,
                                              '', dDataOperacao) then begin
            ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
            Exit;
          end else begin
            memResultado.Lines.Add ('Atualização de Resíduos integrada com sucesso! ');
            memResultado.Lines.Add ('===========================================================');
          end;
       end;



       // -------------------------------------------------------------------------------------------
       //    Calcula Atualização de Saldo
       // -------------------------------------------------------------------------------------------
       if (chkAtualizaSaldo.Checked) and (Sistema.IdModulo = 135) then
       begin
          memResultado.Lines.Add ('Resultado do Cálculo Atualização de Saldos... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Atualização de Saldos...');

          fCM    := 0;
          fJuros := 0;

          if Sistema.TipoCliente = 19981 then // CBS
          begin
             if not(CtrlOperImob.CalculaAtualSaldo14(CtrlOperImob.ProgressFileName,
                                                     fCM,
                                                     fJuros,
                                                     -1,
                                                     -1,
                                                     dDataOperacao,
                                                     -1,
                                                     ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                     ModuloImobiliario.Alienacao.iTipoRecJuros,
                                                     True)) then
             begin
                ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                Exit;
             end
             else
             begin
                memResultado.Lines.Add ('Atualização de Saldos calculada com sucesso! ');
                memResultado.Lines.Add ('===========================================================');
             end;
          end
          else
          begin
             if not(CtrlOperImob.CalculaAtualSaldo(CtrlOperImob.ProgressFileName,
                                                   fCM,
                                                   fJuros,
                                                   -1,
                                                   -1,
                                                   dDataOperacao,
                                                   -1,
                                                   ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                   ModuloImobiliario.Alienacao.iTipoRecJuros,
                                                   True)) then
             begin
                ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                Exit;
             end
             else
             begin
                memResultado.Lines.Add ('Atualização de Saldos calculada com sucesso! ');
                memResultado.Lines.Add ('===========================================================');
             end;
          end;
       end;

       // -------------------------------------------------------------------------------------------
       //    Integra Atualizaçào de Saldos
       // -------------------------------------------------------------------------------------------
       if (chkIntegraSaldo.Checked) and (Sistema.IdModulo = 135) then
       begin
          memResultado.Lines.Add ('Resultado da Integração de Atualização de Saldos... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Atualização de Saldos...');

          if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                              -1,
                                              ModuloImobiliario.Alienacao.iTipoRecJuros,
                                              ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                              -1,
                                              -1,
                                              '',
                                              dDataOperacao) then begin
            ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
            Exit;
          end else begin
            memResultado.Lines.Add ('Atualização de Saldos integrada com sucesso! ');
            memResultado.Lines.Add ('===========================================================');
          end;
       end;

       // registra provisão de perdas
       if chkCalculaProvisao.Checked then begin
          memResultado.Lines.Add ('Resultado do Calculo de Provisão de Perdas..... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Provisão de Perdas...');
          if Sistema.IdModulo = 64 then begin
             if not CtrlOperImob.AtualizaProvisaoPerdas(CtrlOperImob.ProgressFileName,
                                                        ModuloImobiliario.AdminImob.iTipoOperProvPerdas,
                                                        '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Provisão de Perdas calculada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;
          end else begin
             if not CtrlOperImob.AtualizaProvisaoPerdas(CtrlOperImob.ProgressFileName,
                                                        ModuloImobiliario.Alienacao.iTipoOperProvPerdas,
                                                        '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Provisão de Perdas calculada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;

             if ModuloImobiliario.Alienacao.iTipoOperProvPerdasAC > 0 then
             begin
                if not CtrlOperImob.AtualizaProvisaoPerdas(CtrlOperImob.ProgressFileName,
                                                           ModuloImobiliario.Alienacao.iTipoOperProvPerdasAC,
                                                           '', dDataOperacao,'A') then begin
                  ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
                  Exit;
                end else begin
                  memResultado.Lines.Add ('Provisão de Perdas de ACORDO calculada com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
                end;
             end;
          end;
       end;

       // Integra provisão de perdas
       if chkIntegraProvisao.Checked then begin
          memResultado.Lines.Add ('Resultado da Integração da Provisão de Perdas..... ');
          memResultado.Lines.Add ('===========================================================');
          frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Provisão de Perdas...');
          if Sistema.IdModulo = 64 then begin
             if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName, -1, -1, -1,
                                                 ModuloImobiliario.AdminImob.iTipoOperProvPerdas, -1,
                                                 '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Provisão de Perdas integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;
          end else begin
             if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName, -1, -1, -1,
                                                 ModuloImobiliario.Alienacao.iTipoOperProvPerdas, -1,
                                                 '', dDataOperacao) then begin
               ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
               Exit;
             end else begin
               memResultado.Lines.Add ('Provisão de Perdas integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
             end;

             if ModuloImobiliario.Alienacao.iTipoOperProvPerdasAC > 0 then
             begin
                if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName, -1, -1, -1,
                                                    ModuloImobiliario.Alienacao.iTipoOperProvPerdasAC, -1,
                                                    '', dDataOperacao) then begin
                  ComunsImobiliario.MensErroMT( CtrlOperImob.MessageInfo );
                  Exit;
                end else begin
                  memResultado.Lines.Add ('Provisão de Perdas de ACORDO integrada com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
                end;
             end;
          end;
       end;

       // registra provisão de receitas
       if (chkCalculaReceita.Checked) and (Sistema.IdModulo = 64) then begin
         memResultado.Lines.Add ('Resultado do Calculo de Provisão de Receitas de Locação... ');
         memResultado.Lines.Add ('===========================================================');

         frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Provisão de Receitas de Locação...');
         if not CtrlOperImob.AtualizaProvisaoReceita(CtrlOperImob.ProgressFileName,
                                                     ModuloImobiliario.AdminImob.iTipoOperProvReceita,
                                                     dDataOperacao) then begin
           ComunsImobiliario.MensErroMT (CtrlOperImob.MessageInfo);
           Exit;
         end else begin
           memResultado.Lines.Add ('Provisão de Receitas calculada com sucesso! ');
           memResultado.Lines.Add ('===========================================================');
         end;
       end;

       // Integra provisão de Receitas
       if (chkIntegraReceita.Checked) and (Sistema.IdModulo = 64) then begin
         memResultado.Lines.Add ('Resultado da Integração da Provisão de Receitas de Locação... ');
         memResultado.Lines.Add ('===========================================================');

         frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Provisão de Receitas de Locação...');
         if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName, -1, -1, -1, -1,
                                             ModuloImobiliario.AdminImob.iTipoOperProvReceita,
                                             '', dDataOperacao) then begin
           ComunsImobiliario.MensErroMT (CtrlOperImob.MessageInfo);
           Exit;
         end else begin
           memResultado.Lines.Add ('Provisão de Receitas de Locação integrada com sucesso! ');
           memResultado.Lines.Add ('===========================================================');
         end;
       end;


         // -------------------------------------------------------------------------------------------
         //    Calcula juros diários
         // -------------------------------------------------------------------------------------------
         if (chkCalculaJurosAlienacao.Checked) and (Sistema.IdModulo = 135) then
         begin
            memResultado.Lines.Add ('Resultado do Cálculo de Juros de Alienação... ');
            memResultado.Lines.Add ('===========================================================');
            frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Juros de Alienação...');

            if not(CtrlOperImob.CalculaJurosAlienacao(CtrlOperImob.ProgressFileName,
                                                      ModuloImobiliario.Alienacao.iTipoRecJuros,
                                                      dDataOperacao,
                                                      '')) then
            begin
               ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
               Exit;
            end
            else
            begin
               memResultado.Lines.Add ('Juros de Alienação calculados com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
            end;

            if ModuloImobiliario.Alienacao.iTipoRecJurosAC > 0 then
            begin
               if not(CtrlOperImob.CalculaJurosAlienacao(CtrlOperImob.ProgressFileName,
                                                         ModuloImobiliario.Alienacao.iTipoRecJurosAC,
                                                         dDataOperacao,
                                                         '','A')) then
               begin
                  ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                  Exit;
               end
               else
               begin
                  memResultado.Lines.Add ('Juros de ACORDO calculados com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
               end;
            end;
         end;

         // -------------------------------------------------------------------------------------------
         //    Integra juros diários
         // -------------------------------------------------------------------------------------------
         if (chkIntegraJurosAlienacao.Checked) and (Sistema.IdModulo = 135) then
         begin
            memResultado.Lines.Add ('Resultado da Integração de Juros de Alienação... ');
            memResultado.Lines.Add ('===========================================================');
            frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Juros de Alienação...');

            if not(CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                -1,
                                                -1,
                                                -1,
                                                -1,
                                                ModuloImobiliario.Alienacao.iTipoRecJuros,
                                                '',
                                                dDataOperacao
                                               )) then
            begin
               ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
               Exit;
            end
            else
            begin
               memResultado.Lines.Add ('Juros de Alienação integrados com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
            end;

            if ModuloImobiliario.Alienacao.iTipoRecJurosAC > 0 then
            begin
               if not(CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                   -1,
                                                   -1,
                                                   -1,
                                                   -1,
                                                   ModuloImobiliario.Alienacao.iTipoRecJurosAC,
                                                   '',
                                                   dDataOperacao
                                                  )) then
               begin
                  ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                  Exit;
               end
               else
               begin
                  memResultado.Lines.Add ('Juros de ACORDO integrados com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
               end;
            end;
         end;

         // -------------------------------------------------------------------------------------------
         //    Calcula CM Diária
         // -------------------------------------------------------------------------------------------
         if (chkCalculaCMAlienacao.Checked) and (Sistema.IdModulo = 135) then
         begin
            memResultado.Lines.Add ('Resultado do Cálculo de Corr. Mon. de Alienação... ');
            memResultado.Lines.Add ('===========================================================');
            frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Calculando Juros de Alienação...');

            if not(CtrlOperImob.CalculaCMAlienacao(CtrlOperImob.ProgressFileName,
                                                   ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                   dDataOperacao,
                                                   ''
                                                  )) then
            begin
               ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
               Exit;
            end
            else
            begin
               memResultado.Lines.Add ('Corr. Mon. de Alienação calculada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
            end;

            if ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC > 0 then
            begin
               if not(CtrlOperImob.CalculaCMAlienacao(CtrlOperImob.ProgressFileName,
                                                      ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC,
                                                      dDataOperacao,
                                                      '','A'
                                                     )) then
               begin
                  ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                  Exit;
               end
               else
               begin
                  memResultado.Lines.Add ('Corr. Mon. de ACORDO calculada com sucesso! ');
                  memResultado.Lines.Add ('===========================================================');
               end;
            end;
         end;

         // -------------------------------------------------------------------------------------------
         //    Integra CM Diária
         // -------------------------------------------------------------------------------------------
         if (chkIntegraCMAlienacao.Checked) and (Sistema.IdModulo = 135) then
         begin
            memResultado.Lines.Add ('Resultado da Integração de Corr. Mon. de Alienação... ');
            memResultado.Lines.Add ('===========================================================');
            frmProgresso.MostraFormProgresso(DateToStr(dDataOperacao) + ' - Integrando Corr. Mon. de Alienação...');

            iAno     := DiasUteis.ExtraiAno(dDataOperacao);
            iMes     := DiasUteis.ExtraiMes(dDataOperacao);
            iDataFim := trunc(DiasUteis.UltDiaMes(iAno, iMes));

            if dDataOperacao = iDataFim then
            begin
               iDataIni := trunc(EncodeDate(iAno, iMes, 1));

               for iData := iDataIni to iDataFim do
               begin
                  if not(CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                      -1,
                                                      -1,
                                                      -1,
                                                      -1,
                                                      ModuloImobiliario.Alienacao.iTipoRecCorrecao,
                                                      '',
                                                      iData
                                                     )) then
                  begin
                     ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                     Exit;
                  end;

                  if not(CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                                      -1,
                                                      -1,
                                                      -1,
                                                      -1,
                                                      ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC,
                                                      '',
                                                      iData
                                                     )) then
                  begin
                     ComunsImobiliario.MensErroMT(CtrlOperImob.MessageInfo);
                     Exit;
                  end;
               end;

               memResultado.Lines.Add ('Corr. Mon. de Alienação integrada com sucesso! ');
               memResultado.Lines.Add ('===========================================================');
            end
            else  // if dDataOperacao = iDataFim
            begin
               memResultado.Lines.Add ('Corr. Mon. de Alienação não deve ser integrada nessa data ');
               memResultado.Lines.Add ('===========================================================');
            end;  // if dDataOperacao = iDataFim
         end;

       // Incrementa um dia no processamento
       dDataOperacao := dDataOperacao + 1;
    end;
    // -------------------------------------------------------------------------------------------
    // FIM - OPERAÇÕES DIARIAS
    // -------------------------------------------------------------------------------------------

    // Ricardo A. SOL 70892 KTN 523241
    // se último dia do mês bloqueia a contabilidade para o módulo
    DecodeDate( edtDataFim.Date, Year, Month, Day );
    Day := 1;
    if Month < 12 then Inc( Month )
    else
    begin
      Inc( Year );
      Month := 1;
    end;

    dLastDayOfMonth := EncodeDate( Year, Month, Day )-1;
    if ( edtDataFim.Date = dLastDayOfMonth ) then
    begin
      sSql := 'UPDATE DIASBLOQMOD SET DATABLOQUEIO = TO_DATE(' +
        QuotedStr( DateToStr(edtDataFim.Date ) ) + ', ''DD/MM/YYYY'')' +
        ' WHERE ' +
        ' IDMODULO = ' + IntToStr( Sistema.IdModulo );
      CtrlOperImob.ExecSql( sSql )
    end;

   finally
      frmProgresso.EscondeFormProgresso;
      CtrlPrevImob.FreeThreadProgresso;
   end;

   // Alterado por FHBS - SOL: 136336 KTN: 815081
   try
     if not frmProgresso.Cancelou then
       MsgDlg('Processamento Encerrado.'+#13+#13+
              'Início: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDtInicioProc) +
              ' Término: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now),
              'Atenção',mtInformation,[mbOk],0);
   except
   end;
   // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081

end;



procedure TfrmExecAjustePrevisaoDiariaMT.Progresso(vParams: array of variant);
begin
  // Progresso simples
  if vParams[3] = -1 then begin
     if (vParams[1] = 1) and (High(vParams) = 5) then
          frmProgresso.MostraFormProgresso( vParams[5] )
     else frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);

     if (High(vParams) = 5) then
       if vParams[5] <> '' then memResultado.Lines.Add ( vParams[5] );

  end else begin
     // Progresso duplo
     // Ajusta a quantidade máxima  ( não tem default )
     if vParams[3] = 1 then begin
        frmProgressoDuplo.MostraFormProgressoDuplo('Integrando Atualização Financeira de documentos...',
                                                   'Alteradores...', 1, 1, vParams[2], vParams[4], True, True);
     end;

     // Anda o progresso
     frmProgressoDuplo.AndaFormProgressoDuplo(vParams[1], vParams[3]);

     // Grava a mensagem no memo
     if (High (vParams) = 5) then
       if vParams[5] <> '' then memResultado.Lines.Add ( vParams[5] );
  end;
end;


procedure TfrmExecAjustePrevisaoDiariaMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialog1.Execute;
  if SaveDialog1.FileName <> '' then
    memResultado.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmExecAjustePrevisaoDiariaMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  memResultado.Print('');
end;

procedure TfrmExecAjustePrevisaoDiariaMT.edtDocExit(Sender: TObject);
begin
  inherited;
  chkIntegraProvisao.Checked := (edtDoc.Value = 0);
  chkIntegraAtual.Checked    := (edtDoc.Value = 0);

  chkCalculaJurosAlienacao.Checked  := (edtDoc.Value = 0);
  chkIntegraJurosAlienacao.Checked  := (edtDoc.Value = 0);
  chkCalculaCMAlienacao.Checked  := (edtDoc.Value = 0);
  chkIntegraCMAlienacao.Checked  := (edtDoc.Value = 0);
  chkAtualizaResiduo.Checked  := (edtDoc.Value = 0);
  chkIntegraAtualResiduo.Checked  := (edtDoc.Value = 0);

  chkCalculaProvisao.Checked    := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
  chkIntegraProvisao.Checked    := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
  chkCalculaProvisao.Enabled    := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);
  chkIntegraProvisao.Enabled    := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvPerdas > 0);

  chkCalculaReceita.Checked     := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
  chkIntegraReceita.Checked     := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
  chkCalculaReceita.Enabled     := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);
  chkIntegraReceita.Enabled     := (Sistema.IdModulo = 64) and (edtDoc.Value = 0) and (ModuloImobiliario.AdminImob.iTipoOperProvReceita > 0);

end;

end.


