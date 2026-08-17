{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : WO18138
Responsável : Leandro Pocebon
Data        : 20/01/2025
Descrição   : Altera teste periodo contabil fechado pela data prevista da parcela
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 25/10/2018
Descrição   : Alteração do owner da tabela CONTRATOAD
--------------------------------------------------------------------------------
Pendência   : SOL 263973 PPM 1130612
Responsável : William Moreira da Silva
Data        : 28/10/2015
Descrição   : A funcionalidade estava permitindo desfazer parcelas já enviadas para a folha
--------------------------------------------------------------------------------
Pendência   : SOL 260658 PPM 1039277 - Inicio
Responsável : William Moreira da Silva
Data        : 24/08/2015
Descrição   : Segregação HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de contabilização / estorno / exclusão de acordo com
            parâmetro contábil por módulo, além do TestaPeríodo que já era feito
--------------------------------------------------------------------------------
Rotina    : EstornaParcelas
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19263
Descrição : if dtmEmptmo.qryParamEmptmoFLGCONTABPARCELA.AsInteger = 1
--------------------------------------------------------------------------------
Rotina    : EstornaParcelas
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '  AND H.HMESEQCOBRANCA          = 1 '
--------------------------------------------------------------------------------
Rotina    :
Data      : 04/08/2003
Autor     : Marchetti
Pendencia : 14763
Descrição : Gravação no LogTotalPrev o Filtro por Patro/Plano
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancGeraParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, uCalcEmptmo, FSairAjudaImob, DBGrids,
   mListaPatro, mListaPlano,UFuncoesEmptmo,
   uCtrlContab, uCtrlPadroes;

type
   TfrmCancGeraParcela = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Bevel3: TBevel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      qryParcela: TwwQuery;
      qryAux: TwwQuery;
      memResult: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      memErro: TMemo;
      lblTitulo: TfcLabel;
      qryContaParcelas: TwwQuery;
      qryContaParcelasQUANTIDADE: TFloatField;
      Label1: TLabel;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      qryParcelasEstorno: TwwQuery;
      updParcela: TUpdateSQL;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      edtDataLancto: TwwDBDateTimePicker;
      Label5: TLabel;
      qrySituacaoContrato: TwwQuery;
      qrySituacaoContratoFLGSITUACAO: TStringField;
      qryUpdateSituacao: TwwQuery;
      chkDuplicidade: TCheckBox;
      chkInArquivo: TCheckBox;
      chkNotInArquivo: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnContinuarClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);


   private  // Private declarations

      Contab : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      procedure AbreQueries;
      function VerificaPreenchimento: Boolean;

      function SelecionaParcelas: Boolean;
      function MontaSelecionaParcelas: String; //wo18138 leandro
      function RetornaDataMenorParcela: String; //wo18138 leandro
      function HaParcelasEnviadas: Boolean;
      function EstornaParcelas: Boolean;
      function MarcaEstornoDeParcela: Boolean;
      function ExisteContabilizacao : Boolean;


   public   // Public declarations


   end;



var
  frmCancGeraParcela: TfrmCancGeraParcela;



implementation
{$R *.DFM}

uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   dLookEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo, uLancContab,
   FProgresso, UTypesEmptmo;



procedure TfrmCancGeraParcela.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;
   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmCancGeraParcela.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;
   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmCancGeraParcela.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



function TfrmCancGeraParcela.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
	Result := False;

	try
      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      if length(trim(edtDataLancto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Estorno!', edtDataLancto);

      ParametrosSistema;
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataLancto.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataLancto);

         // André Pontes - 03/06/2005 - pendência 19404
         //WO18138 Leandro - Inicio

         sDataLanc   := RetornaDataMenorParcela;
         if Trim(sDataLanc) = '' then
           sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataLancto.Date);
         //WO18138 Leandro - Fim

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
           sMsgContab := Contab.MessageInfo;
           raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataLancto);
         end;
      end;
   except
      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TfrmCancGeraParcela.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   // preenche o ano de referência/competência
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);
   edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TfrmCancGeraParcela.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmCancGeraParcela.btnContinuarClick(Sender: TObject);
var
   sMsg          : String;
   bDesfaz       : Boolean;
   rLogTotalPrev : TLogTotalPrev;
begin
   if not(VerificaPreenchimento) then Exit;

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   sMsg  := 'Só poderão ser desfeitas parcelas ainda não enviadas. ' + #13 +
            'Se alguma das parcelas que se deseja desfazer já houver sido enviada, ' +
            'é necessário desfazer o Envio primeiro. ' + #13 + #13 +
            'Deseja prosseguir?';

   if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   Repaint;

   // double-check
   sMsg  := 'Deseja realmente desfazer a Geração de Parcelas?';

   if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   Repaint;

   try
      DesabilitaBotoes;

      bDesfaz := True;

      // limpa os memos de resultado e erro
      memResult.Clear;
      memErro.Clear;

      // verifica se há parcelas já enviadas
      if HaParcelasEnviadas then
      begin
         bDesfaz := False;

         sMsg     := 'Existem parcelas já enviadas entre as selecionadas. ' +
                     'Para desfazer essas parcelas, é necessário desfazer o Envio primeiro.' + #13 + #13 +
                     'Deseja desfazer SOMENTE as parcelas que ainda não foram enviadas?';

         if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            Repaint;
            bDesfaz := True;
         end;

      end;  // if HaParcelasEnviadas


      // se não é para desfazer, sai...
      if not(bDesfaz) then Exit;

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      try
         // inicia o processamento do estorno propriamente dito
         if MarcaEstornoDeParcela then
         begin
            qryParcela.ApplyUpdates;

            ParametrosSistema;
            if dtmEmptmo.qryParamEmptmoFLGCONTABPARCELA.AsInteger = 1 then    // André Pontes - 17/05/2005 - pendência 19263
            begin
               // verifica se o parâmetro de contabilização está "ligado"
               if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
               begin
                  if not(EstornaParcelas) then
                  begin
                     qryParcela.CancelUpdates;
                     RollBackTransacao;
                     Exit;
                  end;
               end
               else  // dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1
               begin
                  if ExisteContabilizacao then
                  begin
                     sMsg  := 'Existem parcelas já contabilizadas, porém o Sistema não está contabilizando ' +
                              'presentemente. É necessário ativar a integração contábil para permitir o ' +
                              'estorno das parcelas.';

                     MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbOK], 0);
                     Repaint;

                     qryParcela.CancelUpdates;
                     RollBackTransacao;
                     Exit;
                  end;  // if ExisteContabilizacao
               end;  // dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1
            end;  // if dtmEmptmo.qryParamEmptmoFLGCONTABPARCELA.AsInteger = 1


            // -------------------------------------------------------------------------------------
            // Log de operações
            if not(Sistema.GravaLogOperacoes('Desfazer Geração de Parcelas ref: ' +
                                             FormatFloat('00', (cboMes.ItemIndex + 1)) + '/' +
                                             FormatFloat('0000', DBspnAno.Value))) then
            begin
               Raise Exception.Create('Falha na gravação do Log da operação.');
            end;
            // -------------------------------------------------------------------------------------

            (* havendo tudo corrido bem... *)
            qryParcela.CommitUpdates;

            // -------------------------------------------------------------------------------------
            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            if molContratoEmptmo.IdContrato > 0 then
               rLogTotalPrev.IDContrato := molContratoEmptmo.IdContrato
            else
               rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.Origem     := 1;
            if molContratoEmptmo.IdContrato > 0 then
               rLogTotalPrev.Operacao   := 'Desfazer Geração de parcela:' + IntToStr(cboMes.ItemIndex + 1) + '/' + IntToStr(Trunc(DBspnAno.Value)) + '-'+
                                        'Contrato: ' + FloatToStr(molContratoEmptmo.IdContrato)
            else
               rLogTotalPrev.Operacao   := 'Desfazer Geração de parcela:' + IntToStr(cboMes.ItemIndex + 1) + '/' + IntToStr(Trunc(DBspnAno.Value)) + '-'+
                                        'Patro: ' + molListaPatro.PegaPatro + '- Plano: ' + molListaPlano.PegaPlano;

            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);
            // -------------------------------------------------------------------------------------

            CommitTransacao;

            MsgDlg('Geração de Parcelas desfeita.', 'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;
         end
         else
         begin
            RollBackTransacao;
         end;

      except
         RollBackTransacao;

         Raise;
         Repaint;

         MsgDlg('Houve ERRO na tentativa de desfazer as Parcelas.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end;

   finally
      HabilitaBotoes;
   end;
end;



function TfrmCancGeraParcela.HaParcelasEnviadas: Boolean;
var
   sSQL : String;
begin
   Result := False;

   try
      MostraEspera('Verificando Parcelas...');

      sSQL :=
      'SELECT '                                                                              + #13 +
      '  COUNT(*) AS QUANTIDADE '                                                            + #13 +
      'FROM '                                                                                + #13 +
      '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                                                + #13 +
      '  TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                                 + #13 +
      'WHERE '                                                                               + #13 +
      '       H.FLGENVIO               IS NULL '                                             + #13 +
      '   AND H.HMETIPOMOV             = 1 '                                                 + #13 +
      '   AND ( H.HMECENTRALIZA        = 1 OR H.HMEDESTACADO = 1 ) '                         + #13 +
      '   AND NVL(H.FLGESTORNADO, 0)   = 0 '                                                 + #13 +
      '   AND NVL(H.FLGDIVERGPEND, 0)  = 0 '                                                 + #13 +
      '   AND NVL(H.FLGABONADO, 0)     = 0 '                                                 + #13 +
      '   AND NVL(H.FLGQUITADO, 0)     = 0 '                                                 + #13 +
      '   AND H.HMEANOCOMPETENCIA      = ' + IntToStr(trunc(DBspnAno.Value))                 + #13 +
      '   AND H.HMEMESCOMPETENCIA      = ' + IntToStr(cboMes.ItemIndex + 1)                  + #13 +
      '   AND H.PLNCODIGOESTORNO       IS NULL '                                             + #13;

      if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
      '   AND C.IDCONTRATOEMPTMO       = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + #13;


      if molContratoEmptmo.IDContrato <= 0 then
      begin
         if chkInArquivo.Checked then sSQL := sSQL +
//      '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13; //Everson Luiz - TIBERO
      '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;      //Everson Luiz - TIBERO

         if chkNotInArquivo.Checked then sSQL := sSQL +
//      '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13; //Everson Luiz - TIBERO
      '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;      //Everson Luiz - TIBERO
      end;


      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      '   AND TC.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                     + #13;

      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '   AND C.IDTIPOCONTREMPTMO      = ' + DBcboTipoContrato.LookupValue                   + #13 +
      '   AND TC.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                   + #13;


      sSQL := sSQL +
      '   AND C.IDPATRO                IN (' + molListaPatro.PegaPatro + ') '                + #13 +
      '   AND C.IDPLANOPREV            IN (' + molListaPlano.PegaPlano + ') '                + #13 +
      '   AND TE.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                     + #13 +

      '   AND C.IDTIPOCONTREMPTMO      = TC.IDTIPOCONTREMPTMO '                              + #13 +
      '   AND TC.IDTIPOEMPTMO          = TE.IDTIPOEMPTMO '                                   + #13 +
      '   AND C.IDCONTRATOEMPTMO       = H.IDCONTRATOEMPTMO ';

      with qryContaParcelas do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         Result := (FieldByName('QUANTIDADE').AsInteger > 0);
      end;

   finally
      EscondeEspera;
   end;
end;

function TfrmCancGeraParcela.MontaSelecionaParcelas: String;
var
   sSQL  : String;
   sAno  : String;
   sMes  : String;
begin
   Result := '';

   try
     sAno := FormatFloat('0000', DBspnAno.Value);
     sMes := FormatFloat('00', (cboMes.ItemIndex + 1));

     sSQL :=

      ' SELECT H.IDHISTMOVEMPTMO,'+ #13 +
      '       H.IDCONTRATOEMPTMO,       '+ #13 +
      '       H.IDITEMEMPTMO,                   '+ #13 +
      '       1 TIPOMOV,                                '+ #13 +
      '       to_number(to_char(h.DATAPREVISTA,''YYYY'')) ANOCOMPETENCIA,  '+ #13 +
      '       to_number(to_char(h.DATAPREVISTA,''MM'')) MESCOMPETENCIA,            '+ #13 +
      '       H.DATAPREVISTA,                                                            '+ #13 +
      '       H.DATAEFETIVA,                                                      '+ #13 +
      '       to_number(to_char(h.DATAVENCTO,''YYYY'')) ANOCOBRANCA,                '+ #13 +
      '       to_number(to_char(h.DATAVENCTO,''MM'')) MESCOBRANCA,                  '+ #13 +
      '       H.VLRPREVISTO,                                                      '+ #13 +
      '       H.VLREFETIVO,                                                       '+ #13 +
      '       H.SEQCOBRANCA,                                                      '+ #13 +
      '       H.PARCELA,                                                          '+ #13 +
      '       H.SALDODEV,                                                         '+ #13 +
      '       C.TXJUROS,                                                          '+ #13 +
      '       H.FORMACOBRANCA,                                                    '+ #13 +
      '       DECODE(h.flgquitabonoestorno,3,1,0) FLGESTORNADO,                   '+ #13 +
      '       C.FLGSITUACAO                                                       '+ #13 +
      ' FROM HMEPRESTACAO H                                                       '+ #13 +
      ' INNER JOIN CONTRATOEMPTMO C ON H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO    '+ #13 +
      ' INNER JOIN TIPOCONTREMPTMO TC ON C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '+ #13 +
      ' INNER JOIN TIPOEMPTMO TE ON TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO               '+ #13 +
      ' WHERE H.ORIGEM = 1                                                          '+ #13;

      if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
        '  AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
        '  AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                     + #13;

      if molContratoEmptmo.IDContrato <= 0 then
      begin
        if chkInArquivo.Checked then sSQL := sSQL +
          '   AND C.IDCONTRATOEMPTMO     IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) ' + #13;

        if chkNotInArquivo.Checked then sSQL := sSQL +
          '   AND C.IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) ' + #13;
      end;

      sSQL := sSQL +  ' AND (H.FLGBAIXADO = 0 OR H.VLREFETIVO = 0)                        '+ #13 +
      '   AND (H.VLREFETIVO IS NULL OR H.VLREFETIVO = 0)                                  '+ #13 +
      '   AND H.FLGQUITABONOESTORNO = 0                                                   '+ #13 +
      '   AND not exists (SELECT hcontab.plncodigoestorno                                 '+ #13 +
      '                   FROM hmecontabilizacao hcontab                                  '+ #13 +
      '                   WHERE hcontab.idhistmovemptmo = h.idhistmovemptmo)              '+ #13 +
      '   AND C.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                + #13 +
      '   AND C.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                + #13 +
      '   AND TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + #13 +
      '   AND to_number(to_char(DATAPREVISTA,''YYYY'')) = '+sAno + #13 +
      '   AND to_number(to_char(DATAPREVISTA,''MM'')) = '+sMes + #13 +
      '   AND NOT EXISTS (SELECT 1                                                        '+ #13 +
      '                   FROM HMEPRESTACAO HME                                           '+ #13 +
      '                   WHERE HME.ORIGEM = 1                                            '+ #13 +
      '                         AND HME.NATUREZAITEM > 0                                  '+ #13 +
      '                         AND HME.FLGQUITABONOESTORNO < 3                           '+ #13 +
      '                         AND (                                                     '+ #13 +
      '                               (HME.VLREFETIVO IS NOT NULL AND HME.VLREFETIVO <> 0) OR  '+ #13 +
      '                               (HME.FLGBAIXADO IS NULL AND HME.VLREFETIVO <> 0) OR      '+ #13 +
      '                               HME.FLGENVIO = 1 OR                                  '+ #13 +
      '                               exists (SELECT 1 FROM hmeenvio hev                       '+ #13 +
      '                                       WHERE hev.idhistmovemptmo = h.idhistmovemptmo) and    '+ #13 +
      '                               HME.FLGQUITABONOESTORNO in (1,2))                             '+ #13 +
      '                   AND to_number(to_char(hme.DATAPREVISTA,''YYYY'')) = to_number(to_char(h.DATAPREVISTA,''YYYY'')) '+ #13 +
      '                   AND to_number(to_char(hme.DATAPREVISTA,''MM'')) = to_number(to_char(h.DATAPREVISTA,''MM'')) '+ #13 +
      '                   AND HME.SEQCOBRANCA = H.SEQCOBRANCA        '+ #13 +
      '                   AND HME.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO) '#13;


      if chkDuplicidade.Checked then sSQL := sSQL +
        '  AND  TRUNC(H.TRGDTINCLUSAO) > H.HMEDATAVENCTO '                                  + #13;

      result := sSQL;
   Except
      Result := '';
   end;
end;

function TfrmCancGeraParcela.RetornaDataMenorParcela: String;
var
   sSQL  : String;
begin
   Result := '';

   sSQL := ' select MIN(DATAPREVISTA) as data from (' ;
   sSQL := sSQL + MontaSelecionaParcelas();
   sSQL := SSQL + ')';

   try
      with qryParcela do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         //SQL.SaveToFile(ftempregra + '\' + 'EP-CancGeraParcela.txt');
         Open;
         if not(isEmpty) then Result := qryParcela.fieldbyname('data').asstring;
      end;

   finally
   end;
end;


function TfrmCancGeraParcela.SelecionaParcelas: Boolean;
var
   sSQL  : String;
   sAno  : String;
   sMes  : String;
begin
   Result := False;
   {WO18138 - Leandro - inicio
   sAno := FormatFloat('0000', DBspnAno.Value);
   sMes := FormatFloat('00', (cboMes.ItemIndex + 1));

   //William Moreira da Silva - SOL 260658 PPM 1039277
   sSQL :=
   {'SELECT '                                                                           + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, '                         + #13 +
   '  H.HMETIPOMOV, '                                                                  + #13 +
   '  H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, '                                      + #13 +
   '  H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, '                                           + #13 +
   '  H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, '                                            + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                             + #13 +
   '  H.HMESEQCOBRANCA, '                                                              + #13 +
   '  H.HMEPARCELA, H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA,'                  + #13 +
   '  H.FLGESTORNADO, C.FLGSITUACAO '                                                  + #13 +

   'FROM '                                                                             + #13 +
   '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE '           + #13 +

   'WHERE '                                                                            + #13 +
   '      H.HMETIPOMOV           = 1 '                                                 + #13 +
   '  AND H.HMEORIGEM            = 1 '                                                 + #13 +
   '  AND (H.FLGBAIXADO          = 0     OR H.HMEVLREFETIVO = 0) '                     + #13 +
   '  AND (H.HMEVLREFETIVO       IS NULL OR H.HMEVLREFETIVO = 0) '                     + #13 +
   '  AND NVL(H.FLGESTORNADO, 0) = 0 '                                                 + #13 +
   '  AND NVL(H.FLGABONADO, 0)   = 0 '                                                 + #13 +
   '  AND NVL(H.FLGQUITADO, 0)   = 0 '                                                 + #13 +
   '  AND H.PLNCODIGOESTORNO     IS NULL '                                             + #13;

      ' SELECT H.IDHISTMOVEMPTMO,'+ #13 +
      '       H.IDCONTRATOEMPTMO,       '+ #13 +
      '       H.IDITEMEMPTMO,                   '+ #13 +
      '       1 TIPOMOV,                                '+ #13 +
      '       to_number(to_char(h.DATAPREVISTA,''YYYY'')) ANOCOMPETENCIA,  '+ #13 +
      '       to_number(to_char(h.DATAPREVISTA,''MM'')) MESCOMPETENCIA,            '+ #13 +
      '       H.DATAPREVISTA,                                                            '+ #13 +
      '       H.DATAEFETIVA,                                                      '+ #13 +
      '       to_number(to_char(h.DATAVENCTO,''YYYY'')) ANOCOBRANCA,                '+ #13 +
      '       to_number(to_char(h.DATAVENCTO,''MM'')) MESCOBRANCA,                  '+ #13 +
      '       H.VLRPREVISTO,                                                      '+ #13 +
      '       H.VLREFETIVO,                                                       '+ #13 +
      '       H.SEQCOBRANCA,                                                      '+ #13 +
      '       H.PARCELA,                                                          '+ #13 +
      '       H.SALDODEV,                                                         '+ #13 +
      '       C.TXJUROS,                                                          '+ #13 +
      '       H.FORMACOBRANCA,                                                    '+ #13 +
      '       DECODE(h.flgquitabonoestorno,3,1,0) FLGESTORNADO,                   '+ #13 +
      '       C.FLGSITUACAO                                                       '+ #13 +
      ' FROM HMEPRESTACAO H                                                       '+ #13 +
      ' INNER JOIN CONTRATOEMPTMO C ON H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO    '+ #13 +
      ' INNER JOIN TIPOCONTREMPTMO TC ON C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '+ #13 +
      ' INNER JOIN TIPOEMPTMO TE ON TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO               '+ #13 +
      ' WHERE H.ORIGEM = 1                                                          '+ #13;

         if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
   '  AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                     + #13;

   if molContratoEmptmo.IDContrato <= 0 then
   begin
      if chkInArquivo.Checked then sSQL := sSQL +
//    '   AND C.IDCONTRATOEMPTMO     IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) ' + #13; //Everson Luiz - TIBERO
    '   AND C.IDCONTRATOEMPTMO     IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) ' + #13;      //Everson Luiz - TIBERO

      if chkNotInArquivo.Checked then sSQL := sSQL +
//   '   AND C.IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) ' + #13;  //Everson Luiz - TIBERO
   '   AND C.IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) ' + #13;       //Everson Luiz - TIBERO
   end;

   sSQL := sSQL +  ' AND (H.FLGBAIXADO = 0 OR H.VLREFETIVO = 0)                        '+ #13 +
   '   AND (H.VLREFETIVO IS NULL OR H.VLREFETIVO = 0)                                  '+ #13 +
   '   AND H.FLGQUITABONOESTORNO = 0                                                   '+ #13 +
   '   AND not exists (SELECT hcontab.plncodigoestorno                                 '+ #13 +
   '                   FROM hmecontabilizacao hcontab                                  '+ #13 +
   '                   WHERE hcontab.idhistmovemptmo = h.idhistmovemptmo)              '+ #13 +
   '   AND C.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '   AND C.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                + #13 +
   '   AND TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + #13 +
   '   AND to_number(to_char(DATAPREVISTA,''YYYY'')) = '+sAno + #13 +
   '   AND to_number(to_char(DATAPREVISTA,''MM'')) = '+sMes + #13 +
   '   AND NOT EXISTS (SELECT 1                                                        '+ #13 +
   '                   FROM HMEPRESTACAO HME                                           '+ #13 +
   '                   WHERE HME.ORIGEM = 1                                            '+ #13 +
   '                         AND HME.NATUREZAITEM > 0                                  '+ #13 +
   '                         AND HME.FLGQUITABONOESTORNO < 3                           '+ #13 +
   '                         AND (                                                     '+ #13 +
   '                               (HME.VLREFETIVO IS NOT NULL AND HME.VLREFETIVO <> 0) OR  '+ #13 +
   '                               (HME.FLGBAIXADO IS NULL AND HME.VLREFETIVO <> 0) OR      '+ #13 +
   //William Moreira da Silva - SOL 263973 PPM 1130612
   //'                               HME.FLGENVIO IS NULL OR                                  '+ #13 +
   '                               HME.FLGENVIO = 1 OR                                  '+ #13 +
   //William Moreira da Silva - SOL 263973 PPM 1130612
   '                               exists (SELECT 1 FROM hmeenvio hev                       '+ #13 +
   '                                       WHERE hev.idhistmovemptmo = h.idhistmovemptmo) and    '+ #13 +
   '                               HME.FLGQUITABONOESTORNO in (1,2))                             '+ #13 +
   '                   AND to_number(to_char(hme.DATAPREVISTA,''YYYY'')) = to_number(to_char(h.DATAPREVISTA,''YYYY'')) '+ #13 +
   '                   AND to_number(to_char(hme.DATAPREVISTA,''MM'')) = to_number(to_char(h.DATAPREVISTA,''MM'')) '+ #13 +
   '                   AND HME.SEQCOBRANCA = H.SEQCOBRANCA        '+ #13 +
   '                   AND HME.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO) '#13;

   {if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
   '  AND C.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + #13;}

   {if molContratoEmptmo.IDContrato <= 0 then
   begin
      if chkInArquivo.Checked then sSQL := sSQL +
   '   AND C.IDCONTRATOEMPTMO     IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) ' + #13;

      if chkNotInArquivo.Checked then sSQL := sSQL +
   '   AND C.IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) ' + #13;
   end;}


   {if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue                     + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                   + #13 +
   '  AND TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue                   + #13;

   sSQL := sSQL +
   '   AND C.IDPATRO             IN (' + molListaPatro.PegaPatro + ') '                + #13 +
   '   AND C.IDPLANOPREV         IN (' + molListaPlano.PegaPlano + ') '                + #13 +
   '   AND TE.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                     + #13 +
   '   AND H.HMEANOCOMPETENCIA   = ' + sAno                                            + #13 +
   '   AND H.HMEMESCOMPETENCIA   = ' + sMes                                            + #13 +
   '   AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO '                                + #13 +
   '   AND C.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO '                              + #13 +
   '   AND TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO '                                   + #13;

   sSQL := sSQL +
   '   AND NOT EXISTS (SELECT 1 '                                                                     + #13 +
   '                   FROM '                                                                         + #13 +
   '                      HISTMOVEMPTMO HME '                                                         + #13 +
   '                   WHERE '                                                                        + #13 +
   '                          HME.HMETIPOMOV           = 1 '                                          + #13 +
   '                      AND HME.HMEORIGEM            = 1 '                                          + #13 +
   '                      AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                 + #13 +
   '                      AND NVL(HME.FLGESTORNADO, 0) = 0 '                                          + #13 +
   '                      AND ( '                                                                     + #13 +
   '                          (HME.HMEVLREFETIVO       IS NOT NULL AND HME.HMEVLREFETIVO <> 0) OR '   + #13 +
   '                          (HME.FLGBAIXADO          IS NULL     AND HME.HMEVLREFETIVO <> 0) OR '   + #13 +

   // André Pontes - 14/11/2005 - pendência 20716
   '                          HME.FLGENVIO             IS NULL OR '                                   + #13 +
   '                          HME.CODDOCUMENTO         IS NOT NULL OR '                               + #13 +
   '                          HME.IDTMPDESC            IS NOT NULL OR '                               + #13 +
   '                          HME.FLGABONADO           = 1 OR '                                       + #13 +
   '                          HME.FLGQUITADO           = 1 '                                          + #13 +
   '                          ) '                                                                     + #13 +

   '                      AND HME.HMEANOCOMPETENCIA    = H.HMEANOCOMPETENCIA '         + #13 +
   '                      AND HME.HMEMESCOMPETENCIA    = H.HMEMESCOMPETENCIA '         + #13 +
   '                      AND HME.HMESEQCOBRANCA       = H.HMESEQCOBRANCA '            + #13 +
   '                      AND HME.IDCONTRATOEMPTMO     = H.IDCONTRATOEMPTMO '          + #13 +
   '                  ) '                                                              + #13;

   if chkDuplicidade.Checked then sSQL := sSQL +
   '  AND  TRUNC(H.TRGDTINCLUSAO) > H.HMEDATAVENCTO '                                  + #13;
   //William Moreira da Silva - SOL 260658 PPM 1039277
   WO18138 - Leandro - fim}

   sSQL := MontaSelecionaParcelas();

   try
      MostraEspera('Selecionando Parcelas...');

      with qryParcela do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
      // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
      // SQL.SaveToFile(Sistema.TempDir + 'EP-CancGeraParcela.txt');
         SQL.SaveToFile(ftempregra + '\' + 'EP-CancGeraParcela.txt');
         Open;
         if not(isEmpty) then Result := True;
      end;

   finally
      EscondeEspera;
   end;
end;



function TfrmCancGeraParcela.MarcaEstornoDeParcela: Boolean;
var
   sErro : String;

begin
   Result := True;

   if not(SelecionaParcelas) then
   begin
      MsgDlg('Não há Parcelas geradas com os filtros escolhidos.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
      Result := False;
   end
   else
   begin
      try
         while not(qryParcela.EOF) do
         begin
            LimpaParametros(qryParcelasEstorno);
            qryParcelasEstorno.ParamByName('PIDHISTMOVEMPTMO').AsFloat     := qryParcela.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            qryParcelasEstorno.ParamByName('PHMEDATAESTORNO').AsDateTime   := edtDataLancto.Date;
            qryParcelasEstorno.ParamByName('PIDUSUARIOESTORNO').AsInteger  := Sistema.IDUsuario;

            qryParcelasEstorno.ExecSql;

            //William Moreira da Silva - SOL 260658 PPM 1039277 - Inicio
            // -------------------------------------------------------------------------------------
            //    Acerto da situação do Contrato
            // -------------------------------------------------------------------------------------
            CalcEmptmo.AcertaSituacaoContratual(qryParcela.FieldByName('IDCONTRATOEMPTMO').AsFloat, 51);
            // -------------------------------------------------------------------------------------
            //    FIM Acerto da situação do Contrato
            // -------------------------------------------------------------------------------------
            //William Moreira da Silva - SOL 260658 PPM 1039277 - Fim

            qryParcela.Next;
         end;

         //William Moreira da Silva - SOL 260658 PPM 1039277 - Inicio
         //qryParcela.first;
         //if not qryParcela.isEmpty then
         //begin
         //    CalcEmptmo.AcertaSituacaoContratual(qryParcela.FieldByName('IDCONTRATOEMPTMO').AsFloat, 51);
         //end;
         //William Moreira da Silva - SOL 260658 PPM 1039277- FIm

      except;
         Result := False;

         Raise;
         Repaint;
      end;
   end;
end;



function TfrmCancGeraParcela.EstornaParcelas: Boolean;
var
   sSQL              : String;
   sMes              : String;
   sAno              : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
begin
   Result := True;

   sAno := FormatFloat('0000', DBspnAno.Value);
   sMes := FormatFloat('00', (cboMes.ItemIndex + 1));

   //Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro := TStringList.Create;

   sSQL :=
   'SELECT '                                                                           + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, ITE.ITEDESCRICAO, '       + #13 +
   '  H.HMETIPOMOV, '                                                                  + #13 +
   '  H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, '                                      + #13 +
   '  H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, '                                           + #13 +
   '  H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, '                                            + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                             + #13 +
   '  H.HMESEQCOBRANCA, '                                                              + #13 +
   '  H.HMEPARCELA, H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA,'                  + #13 +
   '  H.FLGESTORNADO, '                                                                + #13 +
   '  TC.IDTIPOCONTREMPTMO, '                                                          + #13 +
   '  DECODE(C.IDPLANOORIGEM, NULL, C.IDPLANOPREV, C.IDPLANOORIGEM) AS IDPLANOPREV, '  + #13 +
   '  C.IDPATRO, C.IDPLANOORIGEM, '                                                    + #13 +
   '  ITC.TIPCODIGO '                                                                  + #13 +

   'FROM '                                                                             + #13 +
   '  HISTMOVEMPTMO     H, '                                                           + #13 +
   '  CONTRATOEMPTMO    C, '                                                           + #13 +
   '  ITEMXTIPOCONTR    ITC, '                                                         + #13 +
   '  ITEMEMPTMO        ITE, '                                                         + #13 +
   '  TIPOCONTREMPTMO   TC, '                                                          + #13 +
   '  TIPOEMPTMO        TE '                                                           + #13 +

   'WHERE '                                                                            + #13 +
   '      H.HMETIPOMOV              = 1 '                                              + #13 +
   '  AND H.HMEORIGEM               = 1 '                                              + #13 +

   '  AND NVL(H.HMECENTRALIZA, 0)   = 0 '                                              + #13 +
   '  AND H.FLGESTORNADO            = 1 '                                              + #13 +

   // André Pontes - 17/05/2005 - pendência 19249
   '  AND H.HMESEQCOBRANCA          = 1 '                                              + #13 +
   '  AND H.HMEVLRPREVISTO         <> 0 '                                              + #13 +

   // André Pontes - 17/05/2005 - pendência 19264
   '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '                                              + #13 +

   '  AND H.PLNCODIGOESTORNO        IS NULL '                                          + #13 +
   '  AND H.PLNCODIGO               IS NOT NULL '                                      + #13;

   if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
   '  AND ( C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + ' ) '  + #13;


   if molContratoEmptmo.IDContrato <= 0 then
   begin
      if chkInArquivo.Checked then sSQL := sSQL +
//   '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13;  //Everson Luiz - TIBERO
   '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;       //Everson Luiz - TIBERO

      if chkNotInArquivo.Checked then sSQL := sSQL +
//   '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13;  //Everson Luiz - TIBERO
   '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;       //Everson Luiz - TIBERO
   end;


   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND ( TC.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) '             + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND ( C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '  AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13;

   sSQL := sSQL +
   '  AND ( C.IDPATRO            IN ( ' + molListaPatro.PegaPatro + ' ) ) '            + #13 +
   '  AND ( C.IDPLANOPREV        IN ( ' + molListaPlano.PegaPlano + ' ) ) '            + #13 +
   '  AND ( TE.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +
   '  AND ( H.HMEANOCOMPETENCIA  = ' + sAno + ' ) '                                    + #13 +
   '  AND ( H.HMEMESCOMPETENCIA  = ' + sMes + ' ) '                                    + #13 +
   '  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                              + #13 +
   '  AND ( H.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO     = ITE.IDITEMEMPTMO ) '                                + #13 +
   '  AND ( H.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                + #13 +
   '  AND ( TC.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                           + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '  AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO ) '                                 + #13;

   sMes := cboMes.Text;
   sAno := FormatFloat('0000', DBspnAno.Value);

   sHistoricoContab := 'Emprestimo - Estorno de parcelas - Referencia ' + sMes + '/' + sAno;

   case IntegraEmptmo.ContabilizaItens('C',
                                       'E',
                                       sSQL,
                                       sHistoricoContab,
                                       edtDataLancto.Date,
                                       sResult,
                                       sErro,
                                       iPlanilhaResult
                                      ) of

      -7:
      begin
         Result := False;
         MsgDlg('Processo interrompido pelo usuário sem contabilização.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

      -6:
      begin
         Result := False;
         MsgDlg('Período contábil inválido.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

      -5:
      begin
         Result := False;
         MsgDlg('Ocorreu um ERRO ao executar os lançamentos contábeis.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

      -4:
      begin
         Result := False;
         MsgDlg('Ocorreu um ERRO ao buscar os parâmetros para integração.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

      -3:
      begin
         Result := False;
         MsgDlg('Ocorreu um ERRO ao tentar criar tabela para agrupamento dos lançamentos.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

      -1:
      begin
         Result := False;
         MsgDlg('Ocorreu um ERRO ao tentar selecionar os itens a estornar.', 'Empréstimo', mtInformation, [mbOK], 0);
         Repaint;
      end;

   end;  // case IntegraEmptmo.ContabilizaItens

   // Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro.Free;
end;



function TfrmCancGeraParcela.ExisteContabilizacao : Boolean;
var
   sSql : String;
   sAno  : String;
   sMes  : String;
begin
   Result := False;

   sAno := FormatFloat('0000', DBspnAno.Value);
   sMes := FormatFloat('00', (cboMes.ItemIndex + 1));

   sSQL :=
   'SELECT COUNT(*) AS TOTCONTAB'                                                         + #13 +

   'FROM '                                                                                + #13 +
   '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE '              + #13 +

   'WHERE '                                                                               + #13 +
   '      ( H.HMETIPOMOV         = 1 ) '                                                  + #13 +
   '  AND ( H.HMEORIGEM          = 1 ) '                                                  + #13 +
   '  AND ( H.FLGENVIO           = 0 ) '                                                  + #13 +
   '  AND ( H.FLGBAIXADO         = 0 ) '                                                  + #13 +
   '  AND ( ( H.FLGESTORNADO     = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '                  + #13 +
   '  AND ( H.FLGABONADO         IS NULL ) '                                              + #13 +
   '  AND ( H.FLGQUITADO         IS NULL ) '                                              + #13 +
   '  AND ( H.PLNCODIGOESTORNO   IS NULL ) '                                              + #13 +
   '  AND ( H.PLNCODIGO          IS NOT NULL ) '                                          + #13;

   if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
   '  AND ( C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IdContrato) + ' ) '     + #13;


   if molContratoEmptmo.IDContrato <= 0 then
   begin
      if chkInArquivo.Checked then sSQL := sSQL +
//   '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13;  //Everson Luiz - TIBERO
   '   AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;       //Everson Luiz - TIBERO

      if chkNotInArquivo.Checked then sSQL := sSQL +
//   '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '  + #13;  //Everson Luiz - TIBERO
   '   AND C.IDCONTRATOEMPTMO   NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '  + #13;       //Everson Luiz - TIBERO
   end;


   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND ( TC.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND ( C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13 +
   '  AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   sSQL := sSQL +
   '  AND ( C.IDPATRO            IN ( ' + molListaPatro.PegaPatro + ' ) ) '               + #13 +
   '  AND ( C.IDPLANOPREV        IN ( ' + molListaPlano.PegaPlano + ' ) ) '               + #13 +
   '  AND ( TE.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +
   '  AND ( H.HMEANOCOMPETENCIA  = ' + sAno + ' ) '                                       + #13 +
   '  AND ( H.HMEMESCOMPETENCIA  = ' + sMes + ' ) '                                       + #13 +
   '  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '  AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO ) '                                    + #13;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;
      if not(isEmpty) then Result := ( FieldByName('TOTCONTAB') .AsInteger > 0 );
   end;
end;



procedure TfrmCancGeraParcela.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCancGeraParcela.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCancGeraParcela.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmCancGeraParcela.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmCancGeraParcela.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.Filtro := 'AND CON.FLGSITUACAO       NOT IN (''C'', ''K'', ''Q'') ' + #13;

   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmCancGeraParcela.FormCreate(Sender: TObject);
begin
   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404
end;



procedure TfrmCancGeraParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   inherited;
end;



end.
