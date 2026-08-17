{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Alterações  : MontaSQLContab, MontaSQLEstorno, MontaSQLAbono
Pendência   : SIG66515
Responsável : Andre Imakawa
Data        : 04/07/2018
Descrição   : Recuperar o Perfil de Investimento conforme a data original do
              processamento.
-------------------------------------------------------------------------------
Rotina             : MontaSQLContab
N. SIG..........   : 63986
Data da Alteração: : 26/02/2018
Alteração Form:    : FExecContabilizaLotePrestacao
Responsável:       : Hébio de Souza Vieira
Descrição.......   : Correção para considerar o perfil padrão por contrato de empréstimo
--------------------------------------------------------------------------------
Alterações  : Contabiliza, MontaSQLContab, MontaSQLEstorno, MontaSQLAbono
Pendência   : SIG57627
Responsável : Edilaine
Data        : 21/11/2017
Descrição   : Ajustar queries para adequação a segregação contábil (perfil de investimento)
-------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 12/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
-------------------------------------------------------------------------------
Pendência   : SOL 237521 PPM 486716
Responsável : William Moreira da Silva
Data        : 15/08/2014
Descrição   : Corrigir queries de contabilização
-------------------------------------------------------------------------------
Pendência   : SOL 234429 PPM 429309
Responsável : William Moreira da Silva
Data        : 27/06/2013
Descrição   : Corrigir queries de contabilização
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 150004  Kintana 1084065
Responsável : Fernando Xavier
Data        : 04/01/2011
Descrição   : Retirar indicação de indice do processo de contabilização de prestação por lote.
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 127517  Kintana 663664
Responsável : Jéssica Lana
Data        : 27/11/2009
Descrição   : Acrescentei a condição (HMEDESTACADO = 1) na sql de abono.
--------------------------------------------------------------------------------
Pendência   : SOL 126578 Kintana 663664
Responsável : Renato Visoni
Data        : 20/11/2009
Descrição   : Cantabilizando abonos no evento de prestação, da mesma forma
              como é contabilizado o abono de encargos.
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
Rotina    : MontaSQLContab e MontaSQLEstorno
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : 'AND HME.HMESEQCOBRANCA = 1'
--------------------------------------------------------------------------------
Rotina    : MontaSQLContab
Data      : 22/10/2003
Autor     : André Pontes
Pendencia :
Descrição : Na query que traz os itens a contabilizar, incluído filtro para
            trazer apenas os itens com valor previsto <> 0
            '   AND HME.HMEVLRPREVISTO      <> 0 '
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecContabilizaLotePrestacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
   mListaPlano, mListaPatro, wwdblook, mContratoEmptmo, wwdbdatetimepicker,
   Db, DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdbspin,
   uCtrlContab, uCtrlPadroes;

//Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
const
  IDTIPOMOV = 1; {Legenda: 0-Contabilização de Concessão Por Lote;
                           1-Contabilização de Prestações Por Lote
                           2-Contabilização de Amortização Por Lote
                           3-Contabilização de Quitações Por Lote
                           4-Contabilização de Encargos por Lote
                           6-Contabilização de Ajustes Por Lote}
//Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim

type
   TfrmExecContabilizaLotePrestacao = class(TfrmWizardMTEP)
      Panel3: TPanel;
      qryContratosAContabilizar: TwwQuery;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label2: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      dtsContratosAContabilizar: TwwDataSource;
      DBgrdHistMov: TwwDBGrid;
      TabSheet3: TTabSheet;
      memResult: TMemo;
      Panel2: TPanel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryContratosAContabilizarIDCONTRATOEMPTMO: TFloatField;
      qryContratosAContabilizarDESC_EVENTO: TStringField;
      qryContratosAContabilizarNOME: TStringField;
      qryContratosAContabilizarHMEVLRPREVISTO: TFloatField;
      qryContratosAContabilizarHMEDATAPREVISTA: TDateTimeField;
      Panel4: TPanel;
      Label15: TLabel;
      Label6: TLabel;
      cboMesOld: TComboBox;
      DBspnAno: TwwDBSpinEdit;
      edtDataOld: TwwDBDateTimePicker;
      chkExibeContratos: TCheckBox;
      lblTotContrato: TLabel;
      gbxPeriodo: TGroupBox;
      Label5: TLabel;
      Label3: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;

      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);

   private  // Private declarations

      Contab : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      procedure AbreQueries;

      function  VerificaPreenchimento: Boolean;

      function  AbreContratosAContabilizar: boolean;

      function  MontaSQLContab(const sData: String): String;
      function  MontaSQLEstorno(const sData: String): String;
      function  MontaSQLAbono(const sData: String): String;


      procedure Contabiliza;


   public   // Public declarations


   end;



var
  frmExecContabilizaLotePrestacao: TfrmExecContabilizaLotePrestacao;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uLancContab, uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, UTypesEmptmo;



procedure TfrmExecContabilizaLotePrestacao.AbreQueries;
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



function TfrmExecContabilizaLotePrestacao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      ParametrosSistema;

      if not(dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) then
         raise EValidacao.CreateVal('O Sistema está parametrizado para NÃO gerar integração contábil!', edtDataIni);

      // data inicial
      if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

      // data final
      if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

      // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
      // estorno na data de cancelamento indicada
      sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';

      if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
         raise EValidacao.CreateVal('Não é possível contabilizar no período de datas indicado:' + #13 + '"' + sMsgContab + '"', edtDataIni);

      //Pendência 24800 - 23/03/2007 - Alberto
      if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      begin
         sMsgContab := Contab.MessageInfo;
         raise EValidacao.CreateVal('Não é possível contabilizar no período de datas indicado:' + #13 + '"' + sMsgContab + '"', edtDataIni);
      end;
      //Fim Pendência 24800

      // André Pontes - 03/06/2005 - pendência 19404
      if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      begin
         sMsgContab := Contab.MessageInfo;
         raise EValidacao.CreateVal('Não é possível contabilizar no período de datas indicado:' + #13 + '"' + sMsgContab + '"', edtDataIni);
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

   except

      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecContabilizaLotePrestacao.AbreContratosAContabilizar: boolean;
var
   sSQL     : String;
begin
   Result := False;

   sSQL :=
//   'SELECT /*+INDEX(HME XIE4HISTMOVEMPTMO) INDEX(HME XIE3HISTMOVEMPTMO) INDEX(HME XIE26HISTMOVEMPTMO) INDEX(CON)*/ DISTINCT ' + #13 + //SOL 150004  Kintana 1084065 comentado a indicação de indice
   'SELECT DISTINCT ' + #13 +

   '   CON.IDCONTRATOEMPTMO, '                                                                           + #13 +

   '   DECODE(HME.HMETIPOMOV, 0, ''Concessão'', '                                                        + #13 +
   '                          1, ''Parcela '', '                                                         + #13 +
   '                          2, ''Amortização'', '                                                      + #13 +
   '                          3, ''Quitação'', '                                                         + #13 +
   '                          4, ''Atualização Débito'', '                                               + #13 +
   '                          5, ''Atualização Saldo'' '                                                 + #13 +
   '         ) AS DESC_EVENTO, '                                                                         + #13 +

   '   MUT.NOME, '                                                                                       + #13 +
   '   HME.HMEVLRPREVISTO, '                                                                             + #13 +
   '   HME.HMEDATAPREVISTA '                                                                             + #13 +

   'FROM '                                                                                               + #13 +
   '   PESSOA          MUT, '                                                                            + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                            + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                            + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                            + #13 +
   '   TIPOEMPTMO      TEP '                                                                             + #13 +

   'WHERE '                                                                                              + #13 +
   '       TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                                   + #13 +
   '   AND HME.HMETIPOMOV            = 1 '                                                               + #13 +

   // André Pontes - 17/05/2005 - pendência 19249
   // André Pontes - 15/06/2005
   '   AND ( '                                                                            + #13 +
   '       HME.HMESEQCOBRANCA   = 1 OR '                                                  + #13 +
   '       (HME.HMETIPOMOV      = 0 AND HME.HMEORIGEM = 13) OR '                          + #13 +
   '       HME.HMETIPOMOV       IN (7, 8) '                                               + #13 +
   '       ) '                                                                            + #13 +
   // FIM André Pontes - 15/06/2005

   // André Pontes - 10/12/2004
   '   AND HME.HMEVLRPREVISTO       <> 0 '                                                               + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)               + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'   AND CON.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                                   + #13;
   '   AND TEP.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                                   + #13;
   //FIm Pendência 27205

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                                 + #13;

   sSQL := sSQL +
   '   AND CON.IDPATRO               IN (' + molListaPatro.PegaPatro + ') '                              + #13 +
   '   AND CON.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                              + #13 +

   '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1 ) '                                     + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                               + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)    = 0 '                                                               + #13 +
   '   AND NVL(HME.FLGABONADO, 0)    = 0 '                                                               + #13 +

   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                            + #13 +
   '   AND CON.IDBENEF               = MUT.IDPESSOA '                                                    + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                                           + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                                + #13 +

   'ORDER BY '                                                                                           + #13 +
   '   HMEDATAPREVISTA, IDCONTRATOEMPTMO ';

   try
      with qryContratosAContabilizar do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;

         lblTotContrato.Visible := False;

         if not(isEmpty) then
         begin
            lblTotContrato.Caption := FormatFloat('#,#0', qryContratosAContabilizar.RecordCount) + ' Contratos';
            lblTotContrato.Visible := True;

            Result := True;
         end
         else
         begin
            MsgDlg('Não foram encontrados Contratos com itens a contabilizar no mês selecionado!',
                   'Empréstimo', mtInformation, [mbOK], 0);
            Repaint;
         end;
      end;
   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecContabilizaLotePrestacao.Contabiliza;
var
   iContador      : Integer;
   iPlanilha      : Integer;
   iResult        : Integer;
   sResult        : TStringList;
   sErro          : TStringList;
   sSQLContab     : String;
   sHistorico     : String;
   sDataContab    : String;
   s              : String;
   dDataIni       : TDateTime;
   dDataContab    : TDateTime;
   rLogTotalPrev  : TLogTotalPrev;
begin
   // ----------------------------------------------------------------------------------------------
   // limpa e inicializa o memo de resultado
   memResult.Clear;

   dDataIni := Now;

   memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
   memResult.Lines.Add(' ');
   // ----------------------------------------------------------------------------------------------

   try
      //Pendência 19929 - 26/06/2006 - Alberto Carvalho
      sErro := TStringList.Create;

      for iContador := trunc(edtDataIni.Date) to trunc(edtDataFim.Date) do
      begin
         sDataContab := FormatDateTime('dd/mm/yyyy', iContador);
         dDataContab := StrToDate(sDataContab);

         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------------
         //    Apropriações
         // -------------------------------------------------------------------------------------------

         MostraEspera('Selecionando Itens a contabilizar em ' + sDataContab + '...');

         sSQLContab  := MontaSQLContab(sDataContab);
         sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Prestacoes de Emprestimo referentes a: ' +
                        sDataContab;

         EscondeEspera;

         // ----------------------------------------------------------------------------------------

         // Inicia uma transação - só se não ouver transação iniciada
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         StartTransacao;

         // ----------------------------------------------------------------------------------------

         try
            // ----------------------------------------------------------------------------------------
            // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'N',
                                                          sSQLContab,
                                                          sHistorico,            
                                                          dDataContab,
                                                          sResult,
                                                          sErro,                 
                                                          iPlanilha,
                                                          False,
                                                          IDTIPOMOV,
                                                          molListaPatro.PegaPatro,
                                                          molListaPlano.PegaPlano,
                                                          dDataContab,
                                                          //StrToInt(Trim(qryContratosAContabilizar.FieldByName('IDCONTRATOEMPTMO').AsString)),
                                                          //dtmLookEmptmo.qryLookTipoEmptmo.FieldByName('IDTIPOEMPTMO').AsInteger,
                                                          //dtmLookEmptmo.qryLookTipoContr.FieldByName('IDTIPOCONTREMPTMO').AsInteger
                                                         );

            {iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'N',
                                                          sSQLContab,
                                                          sHistorico,            
                                                          dDataContab,           
                                                          sResult,               
                                                          sErro,                 
                                                          iPlanilha
                                                         );}
             // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
            // ----------------------------------------------------------------------------------------

            s := FormatDateTime('hh:mm:ss', Now) + ' - ';

            case iResult of
               -8 : begin   //edilaine - SIG57627 - inicio
                      memResult.Lines.Add(s + sDataContab + ': ERRO - falta parametrização do Perfil de Investimento');
                      memResult.Lines.Add( sErro.text );
                    end;    //edilaine - SIG57627 - fim
               -6 : memResult.Lines.Add(s + sDataContab + ': ERRO - período contábil');
               -5 : memResult.Lines.Add(s + sDataContab + ': ERRO ao efetuar lançamento contábil');
               -4 : memResult.Lines.Add(s + sDataContab + ': ERRO ao buscar parâmetros para integração');
               -3 : memResult.Lines.Add(s + sDataContab + ': ERRO ao criar tabela para agrupar lançamentos');
               -2 : memResult.Lines.Add(s + sDataContab + ': Não foram encontrados itens a contabilizar');
               -1 : memResult.Lines.Add(s + sDataContab + ': ERRO ao selecionar os itens a contabilizar');
               0  : memResult.Lines.Add(s + sDataContab + ': Apropriação efetuada na planilha ' + IntToStr(iPlanilha));
            end;


            if iResult = 0 then
            begin
               // ----------------------------------------------------------------------------------

               LimpaRegistroLog(rLogTotalPrev);

               rLogTotalPrev.IDModulo   := Sistema.IDModulo;
               rLogTotalPrev.IDContrato := -1;
               rLogTotalPrev.IDHistMov  := -1;
               rLogTotalPrev.Origem     := 42;
               rLogTotalPrev.Operacao   := 'Contabilização de Prestações por Lote';
               rLogTotalPrev.Data       := SysDate;
               rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
               rLogTotalPrev.Versao     := Sistema.Versao;

               GravaLogTotalPrev(rLogTotalPrev);

               // ----------------------------------------------------------------------------------

               CommitTransacao;
            end
            else
            begin
               RollbackTransacao;
            end;

         except
            RollbackTransacao;

            Raise;
            Repaint;
         end;

         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------------
         //    Estornos
         // -------------------------------------------------------------------------------------------

         MostraEspera('Selecionando Itens a contabilizar (estorno) em ' + sDataContab + '...');

         sSQLContab  := MontaSQLEstorno(sDataContab);
         sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Cancelamento de Prestacoes referentes a: ' +
                        sDataContab;

         EscondeEspera;

         // ----------------------------------------------------------------------------------------

         // Inicia uma transação - só se não ouver transação iniciada
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         StartTransacao;

         // ----------------------------------------------------------------------------------------

         try
            // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'E',
                                                          sSQLContab,
                                                          sHistorico,
                                                          dDataContab,
                                                          sResult,
                                                          sErro,
                                                          iPlanilha,
                                                          False,
                                                          IDTIPOMOV,
                                                          molListaPatro.PegaPatro,
                                                          molListaPlano.PegaPlano,
                                                          dDataContab
                                                         );

            {iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'E',
                                                          sSQLContab,
                                                          sHistorico,
                                                          dDataContab,
                                                          sResult,
                                                          sErro,
                                                          iPlanilha
                                                         );}
            // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim

            s := FormatDateTime('hh:mm:ss', Now) + ' - ';

            case iResult of
               -8 : begin   //edilaine - SIG57627 - inicio
                      memResult.Lines.Add(s + sDataContab + ': ERRO - falta parametrização do Perfil de Investimento');
                      memResult.Lines.Add( sErro.text );
                    end;    //edilaine - SIG57627 - fim
               -6 : memResult.Lines.Add(s + sDataContab + ': ERRO (Estorno) - período contábil');
               -5 : memResult.Lines.Add(s + sDataContab + ': ERRO (Estorno) ao efetuar lançamento contábil');
               -4 : memResult.Lines.Add(s + sDataContab + ': ERRO (Estorno) ao buscar parâmetros para integração');
               -3 : memResult.Lines.Add(s + sDataContab + ': ERRO (Estorno) ao criar tabela para agrupar lançamentos');
               -2 : memResult.Lines.Add(s + sDataContab + ': Não foram encontrados itens a estornar');
               -1 : memResult.Lines.Add(s + sDataContab + ': ERRO ao selecionar os itens a estornar');
               0  : memResult.Lines.Add(s + sDataContab + ': Estorno efetuado na planilha ' + IntToStr(iPlanilha));
            end;


            if iResult = 0 then
            begin
               rLogTotalPrev.IDModulo   := Sistema.IDModulo;
               rLogTotalPrev.IDContrato := -1;
               rLogTotalPrev.IDHistMov  := -1;
               rLogTotalPrev.Origem     := 42;
               rLogTotalPrev.Operacao   := 'Contabilização de Prestações por Lote - estorno';
               rLogTotalPrev.Data       := SysDate;
               rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
               rLogTotalPrev.Versao     := Sistema.Versao;

               GravaLogTotalPrev(rLogTotalPrev);

               CommitTransacao;
            end
            else
            begin
               RollbackTransacao;
            end;

         except
            RollbackTransacao;

            Raise;
            Repaint;
         end;






         //Renato Visoni SOL 126578 Kintana 663664
         // -------------------------------------------------------------------------------------------
         //    Abonos
         // -------------------------------------------------------------------------------------------

         MostraEspera('Selecionando Itens a contabilizar (abono) em ' + sDataContab + '...');


         sSQLContab  := MontaSQLAbono(sDataContab);
         sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Abonos referentes a: ' + sDataContab;

         EscondeEspera;

         // ----------------------------------------------------------------------------------------

         // Inicia uma transação - só se não ouver transação iniciada
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         StartTransacao;

         // ----------------------------------------------------------------------------------------

         try
            // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'A',
                                                          sSQLContab,
                                                          sHistorico,
                                                          dDataContab,
                                                          sResult,
                                                          sErro,
                                                          iPlanilha,
                                                          False,
                                                          IDTIPOMOV,
                                                          molListaPatro.PegaPatro,
                                                          molListaPlano.PegaPlano,
                                                          dDataContab
                                                          );

            {iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                          'A',
                                                          sSQLContab,
                                                          sHistorico,
                                                          dDataContab,
                                                          sResult,
                                                          sErro,
                                                          iPlanilha);}

            // Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim

            s := FormatDateTime('hh:mm:ss', Now) + ' - ';

            case iResult of
               -8 : begin   //edilaine - SIG57627 - inicio
                      memResult.Lines.Add(s + sDataContab + ': ERRO - falta parametrização do Perfil de Investimento');
                      memResult.Lines.Add( sErro.text );
                    end;    //edilaine - SIG57627 - fim
               -6 : memResult.Lines.Add(s + sDataContab + ': ERRO (Abono) - período contábil');
               -5 : memResult.Lines.Add(s + sDataContab + ': ERRO (Abono) ao efetuar lançamento contábil');
               -4 : memResult.Lines.Add(s + sDataContab + ': ERRO (Abono) ao buscar parâmetros para integração');
               -3 : memResult.Lines.Add(s + sDataContab + ': ERRO (Abono) ao criar tabela para agrupar lançamentos');
               -2 : memResult.Lines.Add(s + sDataContab + ': Não foram encontrados itens a abonar');
               -1 : memResult.Lines.Add(s + sDataContab + ': ERRO ao selecionar os itens a abonar');
                0 : memResult.Lines.Add(s + sDataContab + ': Abono efetuado na planilha ' + IntToStr(iPlanilha));
            end;


            if iResult = 0 then
            begin
               // ----------------------------------------------------------------------------------

               LimpaRegistroLog(rLogTotalPrev);

               rLogTotalPrev.IDModulo   := Sistema.IDModulo;
               rLogTotalPrev.IDContrato := -1;
               rLogTotalPrev.IDHistMov  := -1;
               rLogTotalPrev.Origem     := 42;
               rLogTotalPrev.Operacao   := 'Contabilização de Prestações por Lote - Abono';
               rLogTotalPrev.Data       := SysDate;
               rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
               rLogTotalPrev.Versao     := Sistema.Versao;

               GravaLogTotalPrev(rLogTotalPrev);

               // ----------------------------------------------------------------------------------

               CommitTransacao;
            end
            else
            begin
               RollbackTransacao;
            end;

         except
            RollbackTransacao;

            Raise;
            Repaint;
         end;

         //Renato Visoni SOL 126578 Kintana 663664



         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------
         // -------------------------------------------------------------------------------------------

      end;  // for

   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

      //Pendência 19929 - 26/06/2006 - Alberto Carvalho
      sErro.Free;
   end;
end;




function TfrmExecContabilizaLotePrestacao.MontaSQLContab(const sData: String): String;
var
   sSQL : String;
begin
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   sSQL :=

   'SELECT '           + #13 +
   '   HME.IDHISTMOVEMPTMO, '                                                                         + #13 +
   '   HME.IDCONTRATOEMPTMO, '                                                                          + #13 +
   '   HME.IDITEMEMPTMO, '                                                                              + #13 +
   '   ITE.ITEDESCRICAO, '                                                                              + #13 +
   '   HME.VLRPREVISTO AS HMEVLRPREVISTO, '                                                             + #13 +
   '   HME.VLREFETIVO AS HMEVLREFETIVO, '                                                               + #13 +
   '   HME.FORMACOBRANCA AS HMEFORMACOBRANCA, '                                                         + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   //edilaine - SIG57627 - inicio
   //'   CON.IDPLANOORIGEM, '                                                                           + #13 +
   '   NVL(CASE  '                                                                          + #13 +
//Hébio - SIG63986 - Inicio
   '         WHEN CON.IDPERFILINVEST IS NOT NULL THEN  '                                    + #13 +
   '           (SELECT PI.IDPLANPREVCONTAB  '                                               + #13 +
   '            FROM PERFILINVEST PI '                                                      + #13 +
   '            WHERE PI.IDPERFILINVEST =  CON.IDPERFILINVEST)'                             + #13 +
//Hébio - SIG63986 - Fim
   '          WHEN ITC.FLGTRANSPERFIL = ''S'' THEN  '                                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)   '                                       + #13 +
   '                FROM TRANSPERFILINVEST T        '                                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN ITC.FLGTRANSPERFIL = ''E'' THEN                 '                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)                   '                       + #13 +
   '                FROM TRANSPERFILINVEST T                        '                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTATU = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN EXISTS (SELECT 1                                '                       + #13 +
   '                          FROM TRANSPERFILINVEST T              '                       + #13 +
   '                         WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                               T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN '        + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB) '                                         + #13 +
   '                FROM CM.TRANSPERFILINVEST T   '                                         + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST '  + #13 +
   '               WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           ELSE  '                                                                      + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)  '                                        + #13 +
   '                FROM PERFILINVXELEG PIE        '                                        + #13 +
   '                     JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST '   + #13 +
   '               WHERE PIE.IDPESSOA = CON.IDPESSOA AND        '                           + #13 +
   '                     PIE.IDPLANOPREV = CON.IDPLANOPREV AND  '                           + #13 +
   '                     PIE.IDPESSJUR = CON.IDPATRO AND        '                           + #13 +
   '                     (TO_DATE(''' + sData + ''',''DD/MM/YYYY'') BETWEEN PIE.DTINICIO AND PIE.DTFIM  '+ #13 +   // Andre Imakawa - SIG 66515
   '                     OR (PIE.DTINICIO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY'') AND '+ #13 +                // Andre Imakawa - SIG 66515
   '                     PIE.DTFIM IS NULL)))                   '                           + #13 +                // Andre Imakawa - SIG 66515
   '         END, -1) AS IDPLANOORIGEM,                         '                           + #13 +
   //edilaine - SIG57627 - fim

   '   CON.IDPLANOPREV, '                                                                               + #13 +
   '   CON.IDPATRO, '                                                                                   + #13 +
   '   ITC.TIPCODIGO, '                                                                                  + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   PIE.PLANO, '                                                                                     + #13 +
   '   PIE.CCDEBFOLHA, '                                                                                + #13 +
   '   PIE.CCCREDFOLHA, '                                                                               + #13 +
   '   PIE.CCUSTDEBFOLHA, '                                                                             + #13 +
   '   PIE.CCUSTCREDFOLHA, '                                                                            + #13 +
   '   PIE.SUBCDEBFOLHA, '                                                                              + #13 +
   '   PIE.SUBCCREDFOLHA, '                                                                             + #13 +
   '   PIE.TIPORECDESFOLHA, '                                                                           + #13 +
   '   PIE.CCDEBFINAN, '                                                                                + #13 +
   '   PIE.CCUSTDEBFINAN, '                                                                             + #13 +
   '   PIE.SUBCDEBFINAN, '                                                                              + #13 +
   '   PIE.CCCREDFINAN, '                                                                               + #13 +
   '   PIE.CCUSTCREDFINAN, '                                                                            + #13 +
   '   PIE.SUBCCREDFINAN, '                                                                             + #13 +
   '   PIE.RECPAGFOLHA, '                                                                               + #13 +
   '   PIE.TIPORECDESFINAN, '                                                                           + #13 +
   '   PIE.RECPAGFINAN, '                                                                               + #13 +
   '   PIE.UNIDNEGOC, '                                                                                 + #13 +
   '   PIE.CODCENTRORESPON '                                                                            + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim

   'FROM '                                                                                              + #13 +
   '   HMEPRESTACAO HME '                                                                               + #13 +
   '   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                         + #13 +
   '   JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   '                           AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                      + #13 +
   '   JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                     + #13 +
   '   JOIN TIPOCONTREMPTMO TCE ON TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                      + #13 +
   '   JOIN TIPOEMPTMO TEP ON TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO '                                     + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   JOIN PARAMINTEGRAEP PIE ON PIE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                       + #13 +
   '                          AND PIE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim

   '   LEFT JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO '             + #13 +

   'WHERE '                                                                                             + #13 +
   '       TEP.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa)                                          + #13 +
   '   AND HME.SEQCOBRANCA = 1 '                                                                        + #13 +
   '   AND HME.VLRPREVISTO <> 0 '                                                                       + #13 +
   '   AND HME.DATAPREVISTA = TO_DATE(''' + sData + ''', ''dd/mm/yyyy'') '                              + #13 +
   '   AND CON.IDPATRO IN (' + molListaPatro.PegaPatro + ') '                                           + #13 +
   '   AND CON.IDPLANOPREV IN (' + molListaPlano.PegaPlano + ') '                                       + #13 +
   '   AND HME.FLGQUITABONOESTORNO < 3 '                                                                + #13 +
   '   AND CONTAB.PLNCODIGO IS NULL '                                                                   + #13 +
   '   AND HME.NATUREZAITEM < 2 '                                                                       + #13 +
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                                               + #13 +
   '   AND (HME.IDTIPOSUSPEMPTMO IS NULL OR 1 = (SELECT TSE.FLGATUALSALDOPARC FROM TIPOSUSPEMPTMO TSE ' + #13 +
   '                                             WHERE TSE.IDTIPOSUSPEMPTMO = HME.IDTIPOSUSPEMPTMO) ) ' + #13 +
   '   AND (NVL(CON.FLGPERDAEFETIVA,0) = 0 OR '                                                        + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND ITC.FLGCONTABILIZAPERDAEFETIVA = 1) OR '                        + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND HME.DATAPREVISTA <= CON.DATAPERDAEFETIVA)) '                    + #13;
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim

   //edilaine - SIG57627 - inicio
   if molContratoEmptmo.IDContrato > 0 then
      sSQL := sSQL +
      '   AND HME.Idcontratoemptmo = ' + FloatToStr(molContratoEmptmo.IDContrato);
   //edilaine - SIG57627 - fim      

   Result := sSQL;
end;



function TfrmExecContabilizaLotePrestacao.MontaSQLEstorno(const sData: String): String;
var
   sSQL : String;
begin
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
   sSQL :=
   'SELECT '                                                                                            + #13 +
   '   HME.IDHISTMOVEMPTMO, '                                                                           + #13 +
   '   HME.IDCONTRATOEMPTMO, '                                                                          + #13 +
   '   HME.IDITEMEMPTMO, '                                                                              + #13 +
   '   ITE.ITEDESCRICAO, '                                                                              + #13 +
   '   HME.VLRPREVISTO AS HMEVLRPREVISTO, '                                                             + #13 +
   '   HME.VLREFETIVO AS HMEVLREFETIVO, '                                                               + #13 +
   '   HME.FORMACOBRANCA AS HMEFORMACOBRANCA, '                                                         + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   //edilaine - SIG57627 - inicio
   //'   CON.IDPLANOORIGEM, '                                                                           + #13 +
   '   NVL(CASE  '                                                                          + #13 +
     //Hébio - SIG63986 - Inicio
   '         WHEN CON.IDPERFILINVEST IS NOT NULL THEN  '                                    + #13 +
   '           (SELECT PI.IDPLANPREVCONTAB  '                                               + #13 +
   '            FROM PERFILINVEST PI '                                                      + #13 +
   '            WHERE PI.IDPERFILINVEST =  CON.IDPERFILINVEST)'                             + #13 +
     //Hébio - SIG63986 - Fim
   '          WHEN ITC.FLGTRANSPERFIL = ''S'' THEN  '                                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)   '                                       + #13 +
   '                FROM TRANSPERFILINVEST T        '                                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN ITC.FLGTRANSPERFIL = ''E'' THEN                 '                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)                   '                       + #13 +
   '                FROM TRANSPERFILINVEST T                        '                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTATU = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN EXISTS (SELECT 1                                '                       + #13 +
   '                          FROM TRANSPERFILINVEST T              '                       + #13 +
   '                         WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                               T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN '        + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB) '                                         + #13 +
   '                FROM CM.TRANSPERFILINVEST T   '                                         + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST '  + #13 +
   '               WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           ELSE  '                                                                      + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)  '                                        + #13 +
   '                FROM PERFILINVXELEG PIE        '                                        + #13 +
   '                     JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST '   + #13 +
   '               WHERE PIE.IDPESSOA = CON.IDPESSOA AND        '                           + #13 +
   '                     PIE.IDPLANOPREV = CON.IDPLANOPREV AND  '                           + #13 +
   '                     PIE.IDPESSJUR = CON.IDPATRO AND        '                           + #13 +
   '                     (TO_DATE(''' + sData + ''',''DD/MM/YYYY'') BETWEEN PIE.DTINICIO AND PIE.DTFIM  '+ #13 +   // Andre Imakawa - SIG 66515
   '                     OR (PIE.DTINICIO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY'') AND '+ #13 +                // Andre Imakawa - SIG 66515
   '                     PIE.DTFIM IS NULL)))                   '                           + #13 +                // Andre Imakawa - SIG 66515
   '         END, -1) AS IDPLANOORIGEM,                         '                           + #13 +
   //edilaine - SIG57627 - fim
   '   CON.IDPLANOPREV, '                                                                               + #13 +
   '   CON.IDPATRO, '                                                                                   + #13 +
   '   ITC.TIPCODIGO, '                                                                                  + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   PIE.PLANO, '                                                                                     + #13 +
   '   PIE.CCDEBFOLHA, '                                                                                + #13 +
   '   PIE.CCCREDFOLHA, '                                                                               + #13 +
   '   PIE.CCUSTDEBFOLHA, '                                                                             + #13 +
   '   PIE.CCUSTCREDFOLHA, '                                                                            + #13 +
   '   PIE.SUBCDEBFOLHA, '                                                                              + #13 +
   '   PIE.SUBCCREDFOLHA, '                                                                             + #13 +
   '   PIE.TIPORECDESFOLHA, '                                                                           + #13 +
   '   PIE.CCDEBFINAN, '                                                                                + #13 +
   '   PIE.CCUSTDEBFINAN, '                                                                             + #13 +
   '   PIE.SUBCDEBFINAN, '                                                                              + #13 +
   '   PIE.CCCREDFINAN, '                                                                               + #13 +
   '   PIE.CCUSTCREDFINAN, '                                                                            + #13 +
   '   PIE.SUBCCREDFINAN, '                                                                             + #13 +
   '   PIE.RECPAGFOLHA, '                                                                               + #13 +
   '   PIE.TIPORECDESFINAN, '                                                                           + #13 +
   '   PIE.RECPAGFINAN, '                                                                               + #13 +
   '   PIE.UNIDNEGOC, '                                                                                 + #13 +
   '   PIE.CODCENTRORESPON '                                                                            + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim
   
   'FROM '                                                                                              + #13 +
   '   HMEPRESTACAO HME '                                                                               + #13 +
   '   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                         + #13 +
   '   JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   '                           AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                      + #13 +
   '   JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                     + #13 +
   '   JOIN TIPOCONTREMPTMO TCE ON TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                      + #13 +
   '   JOIN TIPOEMPTMO TEP ON TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO '                                     + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   JOIN PARAMINTEGRAEP PIE ON PIE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                       + #13 +
   '                          AND PIE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim

   '   JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO '                  + #13 +

   'WHERE '                                                                                             + #13 +
   '       TEP.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa)                                          + #13 +
   '   AND HME.SEQCOBRANCA = 1 '                                                                        + #13 +
   '   AND HME.VLRPREVISTO <> 0 '                                                                       + #13 +
   '   AND HME.DATAQUITABONOESTORNO = TO_DATE(''' + sData + ''', ''dd/mm/yyyy'') '                      + #13 +
   '   AND HME.FLGQUITABONOESTORNO = 3 '                                                                + #13 +
   '   AND CON.IDPATRO IN (' + molListaPatro.PegaPatro + ') '                                           + #13 +
   '   AND CON.IDPLANOPREV IN (' + molListaPlano.PegaPlano + ') '                                       + #13 +
   '   AND CONTAB.PLNCODIGO IS NOT NULL '                                                               + #13 +
   '   AND CONTAB.PLNCODIGOESTORNO IS NULL '                                                            + #13 +
   '   AND HME.NATUREZAITEM < 2 '                                                                       + #13 +
   '   AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '                                                              + #13 +
   '   AND (NVL(CON.FLGPERDAEFETIVA,0) = 0 OR '                                                        + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND ITC.FLGCONTABILIZAPERDAEFETIVA = 1) OR '                        + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND HME.FLGQUITABONOESTORNO = 3 AND HME.DATAQUITABONOESTORNO  <= CON.DATAPERDAEFETIVA)) ' + #13;
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim

   //edilaine - SIG57627 - inicio
   if molContratoEmptmo.IDContrato > 0 then
      sSQL := sSQL +
      '   AND HME.Idcontratoemptmo = ' + FloatToStr(molContratoEmptmo.IDContrato);
   //edilaine - SIG57627 - fim      
   
   Result := sSQL;
end;



procedure TfrmExecContabilizaLotePrestacao.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecContabilizaLotePrestacao.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecContabilizaLotePrestacao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

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



procedure TfrmExecContabilizaLotePrestacao.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecContabilizaLotePrestacao.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecContabilizaLotePrestacao.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecContabilizaLotePrestacao.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecContabilizaLotePrestacao.btnContinuarClick(Sender: TObject);
begin

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;



   case pgcControle.ActivePageIndex of

      0:
      if VerificaPreenchimento then
      begin
         if chkExibeContratos.Checked then
         begin
            Contabiliza;
            pgcControle.ActivePageIndex := 2;
            pgcControle.OnChange(self);
         end
         else
         begin
            if AbreContratosAContabilizar then inherited;
         end;
      end;

      1:
      begin
         Contabiliza;
         inherited;
      end;

   end;
end;



procedure TfrmExecContabilizaLotePrestacao.bbtnConfirmarClick(Sender: TObject);
begin
   qryContratosAContabilizar.Close;

   inherited;
end;



procedure TfrmExecContabilizaLotePrestacao.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecContabilizaLotePrestacao.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecContabilizaLotePrestacao.FormCreate(Sender: TObject);
begin
   inherited;

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



procedure TfrmExecContabilizaLotePrestacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;



function TfrmExecContabilizaLotePrestacao.MontaSQLAbono(
  const sData: String): String;
   var sSQL : String;
begin
   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Inicio
   sSQL :=

   'SELECT '                                                                                            + #13 +
   '   HME.IDHISTMOVEMPTMO, '                                                                           + #13 +
   '   HME.IDCONTRATOEMPTMO, '                                                                          + #13 +
   '   HME.IDITEMEMPTMO, '                                                                              + #13 +
   '   ITE.ITEDESCRICAO, '                                                                              + #13 +
   '   HME.VLRPREVISTO AS HMEVLRPREVISTO, '                                                             + #13 +
   '   HME.VLREFETIVO AS HMEVLREFETIVO, '                                                               + #13 +
   '   HME.FORMACOBRANCA AS HMEFORMACOBRANCA, '                                                         + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                                         + #13 +
   //edilaine - SIG57627 - inicio
   //'   CON.IDPLANOORIGEM, '                                                                           + #13 +
   '   NVL(CASE  '                                                                          + #13 +
     //Hébio - SIG63986 - Inicio
   '         WHEN CON.IDPERFILINVEST IS NOT NULL THEN  '                                    + #13 +
   '           (SELECT PI.IDPLANPREVCONTAB  '                                               + #13 +
   '            FROM PERFILINVEST PI '                                                      + #13 +
   '            WHERE PI.IDPERFILINVEST =  CON.IDPERFILINVEST)'                             + #13 +
     //Hébio - SIG63986 - Fim
   '          WHEN ITC.FLGTRANSPERFIL = ''S'' THEN  '                                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)   '                                       + #13 +
   '                FROM TRANSPERFILINVEST T        '                                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN ITC.FLGTRANSPERFIL = ''E'' THEN                 '                       + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)                   '                       + #13 +
   '                FROM TRANSPERFILINVEST T                        '                       + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTATU = PI.IDPERFILINVEST  ' + #13 +
   '               WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND ' + #13 +
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           WHEN EXISTS (SELECT 1                                '                       + #13 +
   '                          FROM TRANSPERFILINVEST T              '                       + #13 +
   '                         WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                               T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN '        + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB) '                                         + #13 +
   '                FROM CM.TRANSPERFILINVEST T   '                                         + #13 +
   '                     JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST '  + #13 +
   '               WHERE T.MESANOCOMPET >= TO_CHAR(TO_DATE(''' + sData + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '  + #13 + // Andre Imakawa - SIG 66515
   '                     T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) '                       + #13 +
   '           ELSE  '                                                                      + #13 +
   '             (SELECT MAX(PI.IDPLANPREVCONTAB)  '                                        + #13 +
   '                FROM PERFILINVXELEG PIE        '                                        + #13 +
   '                     JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST '   + #13 +
   '               WHERE PIE.IDPESSOA = CON.IDPESSOA AND        '                           + #13 +
   '                     PIE.IDPLANOPREV = CON.IDPLANOPREV AND  '                           + #13 +
   '                     PIE.IDPESSJUR = CON.IDPATRO AND        '                           + #13 +
   '                     (TO_DATE(''' + sData + ''',''DD/MM/YYYY'') BETWEEN PIE.DTINICIO AND PIE.DTFIM  '+ #13 +   // Andre Imakawa - SIG 66515
   '                     OR (PIE.DTINICIO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY'') AND '+ #13 +                // Andre Imakawa - SIG 66515
   '                     PIE.DTFIM IS NULL)))                   '                           + #13 +                // Andre Imakawa - SIG 66515
   '         END, -1) AS IDPLANOORIGEM,                         '                           + #13 +
   //edilaine - SIG57627 - fim
   '   CON.IDPLANOPREV, '                                                                               + #13 +
   '   CON.IDPATRO, '                                                                                   + #13 +
   '   ITC.TIPCODIGO, '                                                                                  + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   PIE.PLANO, '                                                                                     + #13 +
   '   PIE.CCDEBFOLHA, '                                                                                + #13 +
   '   PIE.CCCREDFOLHA, '                                                                               + #13 +
   '   PIE.CCUSTDEBFOLHA, '                                                                             + #13 +
   '   PIE.CCUSTCREDFOLHA, '                                                                            + #13 +
   '   PIE.SUBCDEBFOLHA, '                                                                              + #13 +
   '   PIE.SUBCCREDFOLHA, '                                                                             + #13 +
   '   PIE.TIPORECDESFOLHA, '                                                                           + #13 +
   '   PIE.CCDEBFINAN, '                                                                                + #13 +
   '   PIE.CCUSTDEBFINAN, '                                                                             + #13 +
   '   PIE.SUBCDEBFINAN, '                                                                              + #13 +
   '   PIE.CCCREDFINAN, '                                                                               + #13 +
   '   PIE.CCUSTCREDFINAN, '                                                                            + #13 +
   '   PIE.SUBCCREDFINAN, '                                                                             + #13 +
   '   PIE.RECPAGFOLHA, '                                                                               + #13 +
   '   PIE.TIPORECDESFINAN, '                                                                           + #13 +
   '   PIE.RECPAGFINAN, '                                                                               + #13 +
   '   PIE.UNIDNEGOC, '                                                                                 + #13 +
   '   PIE.CODCENTRORESPON '                                                                            + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim

   'FROM '                                                                                              + #13 +
   '   HMEPRESTACAO HME '                                                                               + #13 +
   '   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                         + #13 +
   '   JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   '                              AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                   + #13 +
   '   JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                     + #13 +
   '   JOIN TIPOCONTREMPTMO TCE ON TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                      + #13 +
   '   JOIN TIPOEMPTMO TEP ON TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO '                                     + #13 +

   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Início
   '   JOIN PARAMINTEGRAEP PIE ON PIE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '                       + #13 +
   '                          AND PIE.IDITEMEMPTMO = HME.IDITEMEMPTMO '                                 + #13 +
   //Foram adicionados esses campos para alimentar a query na classe UContratoEmptmo.pas - Fim

   '   LEFT JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO '             + #13 +

   'WHERE '                                                                                             + #13 +
   '       TEP.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa)                                          + #13 +
   '   AND HME.SEQCOBRANCA = 1 '                                                                        + #13 +
   '   AND HME.VLRPREVISTO <> 0 '                                                                       + #13 +
   '   AND HME.DATAQUITABONOESTORNO = TO_DATE(''' + sData + ''', ''dd/mm/yyyy'') '                      + #13 +
   '   AND HME.FLGQUITABONOESTORNO = 2 '                                                                + #13 +
   '   AND CON.IDPATRO IN (' + molListaPatro.PegaPatro + ') '                                           + #13 +
   '   AND CON.IDPLANOPREV IN (' + molListaPlano.PegaPlano + ') '                                       + #13 +
   '   AND CONTAB.PLNCODIGOESTORNO IS NULL '                                                            + #13 +
   '   AND HME.NATUREZAITEM = 1 '                                                                       + #13 +
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                                               + #13 +
   '   AND (NVL(CON.FLGPERDAEFETIVA,0) = 0 OR '                                                         + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND ITC.FLGCONTABILIZAPERDAEFETIVA = 1) OR '                        + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND HME.FLGQUITABONOESTORNO = 2 AND HME.DATAQUITABONOESTORNO  <= CON.DATAPERDAEFETIVA)) ' + #13;

   //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim

   //edilaine - SIG57627 - inicio
   if molContratoEmptmo.IDContrato > 0 then
      sSQL := sSQL +
      '   AND HME.Idcontratoemptmo = ' + FloatToStr(molContratoEmptmo.IDContrato);
   //edilaine - SIG57627 - fim      
                                           
   Result := sSQL;
end;

procedure TfrmExecContabilizaLotePrestacao.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);

end;

end.
