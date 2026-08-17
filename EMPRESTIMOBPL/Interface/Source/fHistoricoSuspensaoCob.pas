{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SIG100227
Responsável : Edilaine
Data        : 04/06/2020
Descrição   : no cadastro de suspensão ocorre erro ao alterar campo observação (Blob)
--------------------------------------------------------------------------------
Pendência   : SOL 260816 PPM 1051407
Responsável : William Moreira da Silva
Data        : 01/09/2015
Descrição   : Alteração para melhora de performace por segregação da HISTMOVEMPTMO (.DFM)
--------------------------------------------------------------------------------
Pendência   : SOL 231116 PPM 374592
Responsável : Felipe A. Santos
Data        : 08/05/2014
Descrição   : Alteração somente no dfm, qryContrato incluído o filtro FLGINTERNO
              <> CA.
------------------------------------------------------------------------------
Pendência   : SOL 225770 KINTANA 2061037
Responsável : William Moreira da Silva
Data        : 24/02/2014
Descrição   : Erra gerado um erro ao abrir a tela de suspensão de contrato.
------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
------------------------------------------------------------------------------
Pendência   : SOL 220388 KINTANA 2052534
Responsável : William Moreira da Silva
Data        : 11/11/2013
Descrição   : Erra gerado um erro ao abrir a tela de suspensão de contrato, pois o campo
              observação no banco de dados foi alterado para varChar(500).
------------------------------------------------------------------------------
Pendência   : SOL 216519 KINTANA 2046963
Responsável : William Moreira da Silva
Data        : 25/09/2013
Descrição   : A Funcionalidade não retornava nenhum tipo de suspensão,
              quando o mutuario estivesse desativado.(.DFM)
------------------------------------------------------------------------------
Pendência   : SOL 195397 KINTANA 1866686
Responsável : FERNANDO XAVIER
Data        : 22/11/2012
Descrição   : Mensagem de inconsistência ao inserir suspensão temporária
--------------------------------------------------------------------------------
Pendência   : SOL 155626 Kintana 1210042
Responsável : André Oliveira
Data        : 03/09/2012
Descrição   : Ajustes na funcionalidade de suspensão de cobrança.
------------------------------------------------------------------------------
Pendência   : SOL 184563 Kintana 1737992
Responsável : BRUNO AZEVEDO
Data        : 19/07/2012
Descrição   : Ajustes na funcionalidade de suspensão de cobrança.
--------------------------------------------------------------------------------
Pendência   : SOL 181899 KINTANA 1688596
Data        : 05/06/2012
Autor       : Otacilio Aquino
Descrição   : Alterado o valor das variaveis para o retorno da função
              ValidaMargemConsAtual e ValidaPrestacaoProjetada.
--------------------------------------------------------------------------------
Pendência   : SOL 144458 KINTANA 1208325
Responsável : Eraldo Luis da Silva
Data        : 22/02/2012
Descrição   : Criar campos "Prestação Atual", "Prestação Projetada" e "Margem"
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Pendência   : SOL174268/8141 Kintana 1573410
Responsável : Fanuel Junior
Data        : 15/02/2012
Descrição   : Adicionar o campo DATAFIMANT à query de entrada da regra de validação de suspensão
--------------------------------------------------------------------------------
Pendência   : SOL 161455 KINTANA 1407576
Responsável : Otacilio Aquino
Data        : 05/09/2011
Descrição   : Quando houver um erro os dados da tela não devem ser limpos.
--------------------------------------------------------------------------------
Pendência   : SOL 161447 KINTANA 1407564
Responsável : BRUNO AZEVEDO
Data        : 08/09/2011
Descrição   : Não permitir encerrar suspensão caso não utilizou em parcela nenhuma.
--------------------------------------------------------------------------------
Pendência   : SOL 161201 KINTANA 1357157
Responsável : Fanuel Junior
Data        : 12/07/2011
Descrição   : Corrigido erro no cancelamento/encerramento do contrato
--------------------------------------------------------------------------------
Pendência   : SOL 155309 KINTANA 1202585
Responsável : Andre Rocha
Data        : 25/03/2011
Descrição   : Gravar Histórico de Suspenão no Contrato
--------------------------------------------------------------------------------
Pendência   : SOL 149740 Kintana 1081509
Responsável : BRUNO AZEVEDO
Data        : 23/03/2011
Descrição   : Ajustes na funcionalidade de suspensão de cobrança.
--------------------------------------------------------------------------------
Pendência   : SOL 154541 KINTANA 1186758
Responsável : Fanuel Junior
Data        : 16/03/2010
Descrição   : Foi retirado da SQL da queryUltimaSuspensaoEncerrada o filtro
              ( HSC.IDTIPOSUSPEMPTMO = 2 )
--------------------------------------------------------------------------------
Pendência   : SOL 149705 KINTANA 1081508
Responsável : FERNANDO XAVIER
Data        : 09/03/2011
Descrição   : Incluir campo de observação nos registros de suspensão.
--------------------------------------------------------------------------------
Pendência   : SOL 151384 KINTANA 1107432
Responsável : BRUNO AZEVEDO
Data        : 27/01/2010
Descrição   : Ao verificar as suspensões anteriores, não considerar as canceladas.
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
endência   : SOL 142594 KTN 912858
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não exibir suspensão que não seja apenas de concessão na tela de
              Inscrição / Concessão / Renovação
--------------------------------------------------------------------------------
Pendência   : SOL 140650 KINTANA 882342
Responsável : Ádler Souza
Data        : 29/07/2010
Descrição   : Verificar ao confirmar, se existe data preenchida. Comitar no
              final do processo.
--------------------------------------------------------------------------------
Pendência   : SOL 137610 KTN 839866
Responsável : Ádler Souza
Data        : 19/02/2010
Descrição   : Na validação de itens em aberto, verificar tambem o FLGCOBRJUDICIAL
como exceção da regra.
--------------------------------------------------------------------------------
Pendência   : 130911
Responsável : Jéssica Lana
Data        : 19/02/2010
Descrição   : Acerto na sqlAux com a inclusão de TO_DATE no campo datavencto
--------------------------------------------------------------------------------
Pendência   : 118776
Responsável : Jéssica Lana
Data        : 05/06/2009
Descrição   : Alteração na query de entrada, função: TestaSuspensão, o sistema
              não deixava inserir uma outra suspensão quando o mesmo tinha
              suspensão com status cancelada.
--------------------------------------------------------------------------------
Pendência   : SOL 108324  Kintana 512291
Responsável : Renato Visoni
Data        : 20/03/2009
Descrição   : Não deixar conceder suspensão quando houver itens em aberto para
              o participante,Criamos a Função "TemItensAbertoPorMatricula".
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : qryUltimaSuspensaoEncerrada
Data      : 13/08/2007
Autor     : Alberto
Pendencia : 26075
Descrição : Alterada query para buscar data incial da última suspensão do mesmo
            tipo de suspensão e mesmo tipo de contrato.
--------------------------------------------------------------------------------
Rotina    : Varias
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    : dbcboSuspensaoCloseUp
Data      : 27/10/2006
Autor     : Marchetti
Pendência : 23568
Descrição : Quando ocorrer a mensagem de que não é permitida a suspensão, o
            sistema cancelar a Inclusão evitando gravar dados inconsistentes.
--------------------------------------------------------------------------------
Rotina    : - (qryLookTipoSusp
Data      : 28/09/2005
Autor     : André Pontes
Pendência : 21345
Descrição : Se o sistema não for Empréstimo (ie, CentralAP), só mostra na combo
            de tipo de suspensão as tipo "Férias" (flgFerias)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 28/09/2005
Autor     : André Pontes
Pendência : 20308
Descrição : A pedido de Luciana, gravação da DataFimSusp com a data de liberação
            informada.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fHistoricoSuspensaoCob;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, DBCtrls, DBCGrids, wwdbdatetimepicker, CMDateTimePicker,
   Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, UDataBase,
   mContratoEmptmo, UAutorizacao, uCmTypes, DBLookup, ComCtrls, FMostraDados;   //edilaine - 100227

type
   TfrmHistoricoSuspensaoCob = class(TfrmCadastroGridCSImob)
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      Label2: TLabel;
      dbcboSuspensao: TwwDBLookupCombo;
      rdgStatus: TDBRadioGroup;
      chkFerias: TDBCheckBox;
      DBcboMes: TwwDBComboBox;
      Label6: TLabel;
      DBspnAno: TwwDBSpinEdit;
      DBspnMeses: TwwDBSpinEdit;
      Label1: TLabel;
      Label15: TLabel;
      edtDataInicio: TCMDateTimePicker;
      edtDataFinal: TCMDateTimePicker;
      Label3: TLabel;
      edtDataLibSusp: TCMDateTimePicker;
      Label5: TLabel;
      qryContrato: TwwQuery;
      GroupBox1: TGroupBox;
      Label11: TLabel;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      DBEdit9: TDBEdit;
      DBEdit10: TDBEdit;
      Label13: TLabel;
      qryIDHISTSUSPCOBEP: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryFLGSTATUS: TStringField;
      qryFLGFERIAS: TFloatField;
      qryHSCINICIOSUSP: TDateTimeField;
      qryHSCFINALSUSP: TDateTimeField;
      qryHSCMESES: TFloatField;
      qryHSCUSUATEND: TStringField;
      qryHSCDATAATEND: TDateTimeField;
      qryHSCDATALIBER: TDateTimeField;
      qryHSCUSULIBER: TStringField;
      qryHSCDATAATU: TDateTimeField;
      qryHSCANOCOBRANCA: TFloatField;
      qryHSCMESCOBRANCA: TFloatField;
      qryTSEDESCRICAO: TStringField;
      qryIDPESSOA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      Ms_Historico: TMontaSelect;
      qryMATRICULA: TStringField;
      qryNOME_MUTUARIO: TStringField;
      qrySTATUS: TStringField;
      qryFERIAS: TStringField;
      qryFLGINTERNO: TStringField;
      qryParcelasEmAberto: TwwQuery;
      qryParcelasEmAbertoTOTAL: TFloatField;
      qryParcelasPagas: TwwQuery;
      qryParcelasPagasTOTAL: TFloatField;
      qryExistePrestacao: TwwQuery;
      qryExistePrestacaoHMEDATAPREVISTA: TDateTimeField;
      qryExistePrestacaoHMEVLRPREVISTO: TFloatField;
      chkExcepcional: TCheckBox;
      edtPrazoRestante: TEdit;
      Label7: TLabel;
      qryParcelasRestantes: TwwQuery;
      qryParcelasRestantesPARCELAS_RESTANTES: TFloatField;
    MmObservacao: TDBMemo;
    lblObservacao: TLabel;
    QryTipoSusp: TwwQuery;
    qryUltimaSuspensaoEncerrada: TwwQuery;
    qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField;
    qryCheca: TwwQuery;
    qryUltimaSuspensaoEncerradaHSCFINALSUSP: TDateTimeField;

    Label8: TLabel;//SOL 144458 KINTANA 1208325 - Eraldo
    Label9: TLabel;//SOL 144458 KINTANA 1208325 - Eraldo
    Label10: TLabel;//SOL 144458 KINTANA 1208325 - Eraldo
    edtPretAtual: TEdit;//SOL 144458 KINTANA 1208325 - Eraldo
    edtPretProj: TEdit;//SOL 144458 KINTANA 1208325 - Eraldo
    edtMargCons: TEdit;
    dbGridHstAlteracao: TwwDBGrid;
    dsAux: TwwDataSource;
    qryAuxAlteracao: TwwQuery;
    qryOBSERVACAO: TMemoField;
    qryContratoIDPESSOA: TFloatField;
    qryContratoIDBENEF: TFloatField;
    qryContratoIDPATRO: TFloatField;
    qryContratoFLGINTERNO: TStringField;
    qryContratoIDTIPOCONTREMPTMO: TFloatField;
    qryContratoIDPESSJURCEDIDO: TFloatField;
    btnObserva: TBitBtn;//William Moreira da Silva - SOL 220388 KTN 2052534

      procedure dbcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbtnProcurarClick(Sender: TObject);
      procedure dbcboSuspensaoEnter(Sender: TObject);
      procedure edtDataInicioExit(Sender: TObject);
      procedure qryAfterScroll(DataSet: TDataSet);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure DBspnMesesExit(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure DBspnMesesEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbGrdCellChanged(Sender: TObject);
    function MontaQueryTipoSusp(FLGSUSAPENASCONC: Boolean): String;
    procedure FormCreate(Sender: TObject);    //André Oliveira SOL 155626 Kintana 1210042;
    procedure FormDestroy(Sender: TObject);
    procedure btnObservaClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);//André Oliveira SOL 155626 Kintana 1210042;

   private  // Private declarations
   //incio - André Oliveira SOL 155626 Kintana 1210042;
      pgHistorico  : TPageControl;
      tsHistoricoSuspencao,
      tsHistoricoAlteracao  : TTabSheet;
      temAlteracao : Boolean;
   //fim - André Oliveira SOL 155626 Kintana 1210042;


      sOldStatus: String;
      sOldObs   : String;     //edilaine  SIG100227

      dDataFimSusp   : TDateTime;

      iMesesIni      : Integer;
      iMesesFim      : Integer;
      bErro          : Boolean;
      sMsg           : TStringList;

      function  VerificaPreenchimento    : Boolean;
      function  ExistenciaSuspensaoAtiva : Boolean;
      function  ExistenciaContratoAtivo : Boolean;
      procedure HabilitaControles(bDesabilita: Boolean);

      function  TestaSuspensao : Boolean;
      function  VerificaHtsAlteracao : Boolean;


      function  DataInicioSuspensao: TDateTime;


   public   // Public declarations
      // Marchetti - Pendencia 22042
      iContrato  : Extended;
      sMatricula : String;
      sNome      : String;
      sContrato  : String;
      // Fim Marchetti - Pendencia 22042
   end;



var
  frmHistoricoSuspensaoCob: TfrmHistoricoSuspensaoCob;



implementation
{$R *.DFM}
uses
   DBaseDados, USistema, DLookEmptmo, UCalcEmptmo, uMensErro, UFuncoesEmptmo,
   uDiasUteis, uVerificaPreenchimento, FExecSelecionaContrato, uIntegraModulo,
   UTypesEmptmo;



function TfrmHistoricoSuspensaoCob.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
      if qryIDCONTRATOEMPTMO.IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContratoEmptmo.btnBuscaContrato);

      if dbcboSuspensao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Suspensão!', dbcboSuspensao);

      if (qryFLGFERIAS.AsInteger = 1) and (qryHSCINICIOSUSP.IsNull) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Início da Suspensão!', edtDataInicio);

      if DBcboMes.ItemIndex >= 0 then
         if edtDataLibSusp.Text = '' then
            raise EValidacao.CreateVal('É necessário indicar a Data de Liberação!', edtDataLibSusp);

      if length(trim(edtDataLibSusp.Text)) = 0 then
         if dbSpnMeses.Value > dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger then
            raise EValidacao.CreateVal('O nº de meses de suspensão não pode ultrapassar ' +
                                       dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsString + '!', dbSpnMeses);

      if length(trim(edtDataLibSusp.Text)) = 0 then
         if (DiasUteis.MesesEntre(edtDataInicio.Date, edtDataFinal.Date) + 1) > trunc(dbSpnMeses.Value) then
            raise EValidacao.CreateVal('A Data Final de Suspensão não pode definir um período maior que ' +
                                       FormatFloat('#0', dbSpnMeses.Value) + ' meses!', edtDataFinal);

      if edtDataFinal.Text = '' then
        raise EValidacao.CreateVal('A Data Final de Suspensão deve ser preenchida!', edtDataFinal);

      if edtDataInicio.Text = '' then
        raise EValidacao.CreateVal('A Data Início de Suspensão deve ser preenchida!', edtDataInicio);



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



function  TfrmHistoricoSuspensaoCob.TestaSuspensao : Boolean;
var
   iNumParcAberto : Integer;
   iNumParcPagas  : Integer;
   iFerias        : Integer;
   iExcepcional   : Integer;
   dDataInicioAnt : TDateTime;
   dDataFimAnt    : TDateTime;//Fanuel Junior SOL174268/8141 Kintana1573410

   // SOL 181899 KTN 1688596 Otacilio Aquino ** INICIO **
   iValidaPrestacaoProjetada: Double;//SOL 144458 KINTANA 1208325 - Eraldo
   iValidaMargemConsAtual: Double;//SOL 144458 KINTANA 1208325 - Eraldo
   // SOL 181899 KTN 1688596 Otacilio Aquino ** FIM **
   QryAux : TwwQuery;//SOL 144458 KINTANA 1208325 - Eraldo
   sSQL : String;//SOL 144458 KINTANA 1208325 - Eraldo
begin
   Result         := False;

   iNumParcAberto := 0;
   iNumParcPagas  := 0;
   dDataInicioAnt := -1;

   // ----------------------------------------------------------------------------------------------

   with qryParcelasEmAberto do
   begin
      LimpaParametros(qryParcelasEmAberto);
      qryParcelasEmAberto.ParamByName('PIDCONTRATOEMPTMO').AsFloat      := iContrato;
      qryParcelasEmAberto.ParamByName('PHMEDATAPREVISTA').AsDateTime    := Date;
      qryParcelasEmAberto.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := DiasUteis.ExtraiAno(Date);
      qryParcelasEmAberto.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := DiasUteis.ExtraiMes(Date);
      qryParcelasEmAberto.Open;

      iNumParcAberto := qryParcelasEmAbertoTOTAL.AsInteger;

      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   if qryFLGFERIAS.AsInteger = 1 then
   begin
      LimpaParametros(qryParcelasPagas);
      qryParcelasPagas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
      qryParcelasPagas.Open;

      iNumParcPagas := qryParcelasPagasTOTAL.AsInteger;

      qryParcelasPagas.Close;
   end;

   // ----------------------------------------------------------------------------------------------

   with qryUltimaSuspensaoEncerrada do
   begin
      LimpaParametros(qryUltimaSuspensaoEncerrada);
      qryUltimaSuspensaoEncerrada.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
      //Pendência 26075 - 13/08/2007 - Alberto
      //qryUltimaSuspensaoEncerrada.ParamByName('PIDTIPOSUSPEMPTMO').AsFloat := StrToInt(dbcboSuspensao.LookupValue);  Fanuel Junior SOL 154541 KINTANA 1186758
      //Fim Pendência 26075

      qryUltimaSuspensaoEncerrada.Open;

      dDataInicioAnt := qryUltimaSuspensaoEncerradaHSCINICIOSUSP.AsDateTime;
      dDataFimAnt    := qryUltimaSuspensaoEncerrada.FieldByName('HSCFINALSUSP').AsDateTime;//Fanuel Junior SOL174268/8141 Kintana1573410
      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   iExcepcional := 0;
   iFerias      := 0;

   if chkExcepcional.Checked  then iExcepcional := 1;
   if chkFerias.Checked       then iFerias      := 1;

   // ----------------------------------------------------------------------------------------------

   dDataFimSusp := CalcEmptmo.ValidaSuspensao(dtmLookEmptmo.qryLookTipoSuspIDREGRAVALIDSUSP.AsInteger,
                                              iContrato,
                                              qryContratoIDPESSOA.AsInteger,
                                              qryContratoIDBENEF.AsInteger,
                                              qryContratoIDPATRO.AsInteger,
                                              qryContratoFLGINTERNO.AsString,
                                              StrToInt(dbcboSuspensao.LookupValue),
                                              trunc(dbSpnMeses.Value),
                                              qryHSCINICIOSUSP.AsDateTime,
                                              qryHSCFINALSUSP.AsDateTime,
                                              iFerias,
                                              iNumParcAberto,
                                              iNumParcPagas,
                                              dDataInicioAnt,
                                              dDataFimAnt,//Fanuel Junior SOL174268/8141 Kintana
                                              qryHSCDATAATU.AsDateTime,
                                              //Pendência 26075 - 13/08/2007 - Alberto
                                              dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                              //Fim Pendência 26075
                                              iExcepcional,
                                              qryContratoIDPESSJURCEDIDO.AsInteger,
                                              0,
                                              qryFLGSTATUS.AsString
                                             );

   // ----------------------------------------------------------------------------------------------

   // ELS SOL 144458 Kintana 1208325 INICIO
   iValidaPrestacaoProjetada := CalcEmptmo.ValidaPrestacaoProjetada(dtmLookEmptmo.qryLookTipoSuspTSEIDREGRACALCPRESTPROJETADA.AsInteger,
                                                      iContrato,
                                                      qryContratoIDPESSOA.AsInteger,
                                                      qryContratoIDBENEF.AsInteger,
                                                      qryContratoIDPATRO.AsInteger,
                                                      qryContratoFLGINTERNO.AsString,
                                                      StrToInt(dbcboSuspensao.LookupValue),
                                                      trunc(dbSpnMeses.Value),
                                                      qryHSCINICIOSUSP.AsDateTime,
                                                      qryHSCFINALSUSP.AsDateTime,
                                                      iFerias,
                                                      iNumParcAberto,
                                                      iNumParcPagas,
                                                      dDataInicioAnt,
                                                      qryHSCDATAATU.AsDateTime,
                                                      dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                                      iExcepcional,
                                                      qryContratoIDPESSJURCEDIDO.AsInteger,
                                                      0,
                                                      qryFLGSTATUS.AsString
                                                      );
   edtPretProj.Text := FloatToStr(iValidaPrestacaoProjetada); // SOL 181899 KTN 1688596 Otacilio Aquino

   // ELS SOL 144458 Kintana 1208325 Fim
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // ELS SOL 144458 Kintana 1208325 INICIO

   iValidaMargemConsAtual := CalcEmptmo.ValidaMargemConsAtual(dtmLookEmptmo.qryLookTipoSuspTSEIDREGRACALCULOMARGELATUAL.AsInteger,
                                                   iContrato,
                                                   qryContratoIDPESSOA.AsInteger,
                                                   qryContratoIDBENEF.AsInteger,
                                                   qryContratoIDPATRO.AsInteger,
                                                   qryContratoFLGINTERNO.AsString,
                                                   StrToInt(dbcboSuspensao.LookupValue),
                                                   trunc(dbSpnMeses.Value),
                                                   qryHSCINICIOSUSP.AsDateTime,
                                                   qryHSCFINALSUSP.AsDateTime,
                                                   iFerias,
                                                   iNumParcAberto,
                                                   iNumParcPagas,
                                                   dDataInicioAnt,
                                                   qryHSCDATAATU.AsDateTime,
                                                   dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                                   iExcepcional,
                                                   qryContratoIDPESSJURCEDIDO.AsInteger,
                                                   0,
                                                   qryFLGSTATUS.AsString
                                                   );
    edtMargCons.Text :=  FloattoStr(iValidaMargemConsAtual); // SOL 181899 KTN 1688596 Otacilio Aquino
   // ELS SOL 144458 Kintana 1208325 Fim
   // ----------------------------------------------------------------------------------------------

   // ELS Sol 144458 Kintana 1208325 Inicio
   try
      QryAux                := TwwQuery.Create(nil);
      QryAux.DatabaseName   := 'BaseDados';
      sSQL := 'SELECT HMEVLRPREVISTO ' + #13 +
              'FROM HISTMOVEMPTMO' + #13 +
              ' WHERE IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
              '   AND HMETIPOMOV = 1' + #13 +
              '   AND HMECENTRALIZA = 1'+ #13 +
              '   AND HMEDATAPREVISTA = (SELECT MAX(HMEDATAPREVISTA)'+ #13 +
              '   FROM HISTMOVEMPTMO'+ #13 +
              ' where idcontratoemptmo = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
              '   AND HMETIPOMOV = 1'+ #13 +
              '   AND HMECENTRALIZA = 1)';

      QryAux.SQL.Text := sSQL;
      QryAux.Open;
      edtPretAtual.Text := QryAux.FieldByName('HMEVLRPREVISTO').AsString;
   finally
      FreeAndNil(QryAux);
   end;
   // ELS Sol 144458 Kintana 1208325 Inicio
   // ----------------------------------------------------------------------------------------------

   if dDataFimSusp > Date then
   begin
      //Pendência 24985 - 04/04/2007 - Alberto
      if qry.State in dsEditModes then //qryHSCFINALSUSP.AsDateTime := dDataFimSusp;
      begin
         if (dDataFimSusp = StrToDate('31/12/1899')) or (dDataFimSusp = 0) then
            qryHSCFINALSUSP.Clear
         else
            qryHSCFINALSUSP.AsDateTime := dDataFimSusp;
      end;
      //Fim Pendência 24985
      Result := True;
   end;
end;



function  TfrmHistoricoSuspensaoCob.DataInicioSuspensao: TDateTime;
begin
   with qryExistePrestacao do
   begin
      LimpaParametros(qryExistePrestacao);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := iContrato;
      ParamByName('HMEDATAPREVISTA').AsDateTime := Date;

      Open;

      if not(isEmpty) then
      begin
         Result := qryExistePrestacaoHMEDATAPREVISTA.AsDateTime + 1;
      end
      else
      begin
         Result := Date;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.dbcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   bErro := False;
   bbtnConfirmar.Enabled := not bErro;
   if qry.State in dsEditModes then
   begin
      if dbcboSuspensao.LookupValue <> '' then
      begin
         dbSpnMeses.MaxValue  := dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger;
         if dbSpnMeses.Text   = '' then
         begin
          // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
          qryHSCMESES.Value := dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger;
          dbSpnMeses.Value  := dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger;
         end;
         if not(TestaSuspensao) then
         begin

            MsgDlg('Não é permitida a suspensão', 'Empréstimo', mtWarning, [mbOK], 0);
            bErro := True;
            Repaint;
            // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
            // Marchetti - Pendencia 23568
            //bbtnCancelarClick(self);
            // Fim Marchetti - Pendencia 23568
            bbtnConfirmar.Enabled := not bErro;
            // SOL 161455 Kintana 1407576 Otacilio Aquino - Fim
            Exit;
         end
         else if ((CalcEmptmo.TemItensAbertoPorMatricula(molContratoEmptmo.edtMatricula.Text)) and (dtmLookEmptmo.qryLookTipoSusp.Fieldbyname('FLGCOBRJUDICIAL').AsInteger <> 1))then begin //Ádler Souza - SOL 137610 KTN 839866
           MsgDlg('Suspensão não permitida, existem itens em aberto.', 'Empréstimo', mtWarning, [mbOK], 0);
           bErro := True;
           Repaint;
           // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
           //bbtnCancelarClick(self);
           bbtnConfirmar.Enabled := not bErro;
           // SOL 161455 Kintana 1407576 Otacilio Aquino - Fim
           Exit;
         end    
         else
         begin
            if qry.State in dsEditModes then
            begin
               //Pendência 24985 - 04/04/2007 - Alberto
               if (dDataFimSusp = StrToDate('31/12/1899')) or (dDataFimSusp = 0) then
                  qryHSCFINALSUSP.Clear
               else
               qryHSCFINALSUSP.AsDateTime    := dDataFimSusp;
               //Fim Pendência 24985

               qryHSCMESES.AsInteger         := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);

               qryFLGFERIAS.AsInteger        := dtmLookEmptmo.qryLookTipoSuspFLGFERIAS.AsInteger;
               qryIDCONTRATOEMPTMO.AsFloat   := iContrato;
               qryHSCUSUATEND.AsString       := Sistema.NomeUsuario;
               qryHSCDATAATEND.AsDateTime    := SysDate;
               qryFLGSTATUS.AsString         := 'A';
               qryIDPESSOA.AsInteger         := qryContratoIDPESSOA.AsInteger;
               qryIDBENEF.AsInteger          := qryContratoIDBENEF.AsInteger;
               qryIDPATRO.AsInteger          := qryContratoIDPATRO.AsInteger;
               qryFLGINTERNO.AsString        := qryContratoFLGINTERNO.AsString;
            end;
         end;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iAno, iMes, iDia  : word;
   sMesAno           : String;
begin
   // Faz as verificações necessárias
   if UFuncoesEmptmo.bBuscaMutuario then
    begin
       MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                         'O usuário é o próprio mutuário do '+
                         'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
       Abort;
    end;

   Accept := VerificaPreenchimento;

   if not(Accept) then Exit;

   if bErro then Exit;

   if ExistenciaSuspensaoAtiva then
   begin
      Accept := False;
      Repaint;
      Exit;
   end;

   if qry.State = dsInsert then begin
     qryIDHISTSUSPCOBEP.AsInteger := LeUltRegistro(nil, 'HISTSUSPCOBEP');
     qryHSCUSUATEND.AsString      := Sistema.NomeUsuario;
     qryHSCDATAATEND.AsDateTime   := SysDate;
   end;

   if qry.State = dsEdit then
   begin
      qryHSCUSULIBER.AsString          := Sistema.NomeUsuario;
      qryHSCDATAATU.AsDateTime         := SysDate;
      //Pendência 24985 - 04/04/2007 - Alberto

      if (qryHSCFINALSUSP.AsDateTime = 0) then begin
        if (dDataFimSusp > 0) then begin
          qryHSCFINALSUSP.AsDateTime       := dDataFimSusp;
        end;
      end;
      {if (dDataFimSusp = StrToDate('31/12/1899')) or (dDataFimSusp = 0) then
         qryHSCFINALSUSP.Clear
      else
      qryHSCFINALSUSP.AsDateTime       := dDataFimSusp;}
      //Fim Pendência 24985

      if edtDataLibSusp.Text <> '' then
      begin
         //qryFLGSTATUS.AsString         := 'C';                         //edilaine  SIG100227
         //qrySTATUS.AsString            := 'Cancelada';                 //edilaine  SIG100227

         DecodeDate(edtDataLibSusp.Date, iAno, iMes, iDia);

         qryHSCFINALSUSP.AsDateTime    := edtDataLibSusp.Date;

         qryHSCMESCOBRANCA.AsInteger   := iMes;
         qryHSCANOCOBRANCA.AsInteger   := iAno;
      end;

   end;
      temAlteracao := VerificaHtsAlteracao;    //Andre Olvivera SOL 155626 Kintana 1210042
   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.FormShow(Sender: TObject);
begin
   inherited;

   chkExcepcional.Visible := Sistema.IDModulo = 15;
   sMsg := TStringList.Create;
   // ----------------------------------------------------------------------------------------------

   LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);

   // Marchetti - Pendencia 26947
   // A pedido da FUNCEF, não deve ter mais esse filtro para a CentralAP,
   // desfazendo assim o que foi pedido na pendencia 21345
   // André Pontes - 25/01/2006 - pendência 21345
//   if Sistema.IDModulo <> 15 then
//      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PFLGFERIAS').AsInteger       := 1;
   // FIM André Pontes - 25/01/2006 - pendência 21345
   // Fim Marchetti - Pendencia 26947
   dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
   dtmLookEmptmo.qryLookTipoSusp.Open;

   // ----------------------------------------------------------------------------------------------

   qry.Open;
   //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
   qryAuxAlteracao.Close;
   qryAuxAlteracao.ParamByName('IDHISTSUSPCOBEP').AsString := qry.FieldByName('IDHISTSUSPCOBEP').AsString;
   qryAuxAlteracao.Open;
   //Fim - Andre Olvivera SOL 155626 Kintana 1210042
   molContratoEmptmo.edtIDContrato.Clear;
   molContratoEmptmo.edtMatricula.Clear;
   molContratoEmptmo.edtNome.Clear;

   Autorizacao.AutorizarForm(self, afNormal);

   HabilitaControles(True);

   // Marchetti - Pendencia 22042
   if sistema.IdModulo = 19 then
   begin
      sbtnProcurar.Visible := False;
      molContratoEmptmo.btnBuscaContrato.Visible := False;
      molContratoEmptmo.btnLimpaContrato.Visible := False;
      sbtnProcurarClick(Self);
   end;
   // Fim Marchetti - Pendencia 22042
end;



procedure TfrmHistoricoSuspensaoCob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookEmptmo.qryLookTipoSusp.Close;
   qry.Close;
   UFuncoesEmptmo.bBuscaMutuario := false;
   sMsg.Destroy;
   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.sbtnProcurarClick(Sender: TObject);
var
  iIdBenef: integer;
  iNumParcAberto : Integer;//SOL 144458 KINTANA 1208325 - Eraldo
  iNumParcPagas  : Integer;//SOL 144458 KINTANA 1208325 - Eraldo
  iFerias        : Integer;//SOL 144458 KINTANA 1208325 - Eraldo
  iExcepcional   : Integer;//SOL 144458 KINTANA 1208325 - Eraldo
  dDataInicioAnt : TDateTime;//SOL 144458 KINTANA 1208325 - Eraldo
  // SOL 181899 KTN 1688596 Otacilio Aquino ** INICIO **
  iValidaPrestacaoProjetada :Double;//SOL 144458 KINTANA 1208325 - Eraldo
  iValidaMargemConsAtual :Double;//SOL 144458 KINTANA 1208325 - Eraldo
  // SOL 181899 KTN 1688596 Otacilio Aquino ** INICIO **
  sSQL : String;//SOL 144458 KINTANA 1208325 - Eraldo
  QryAux : TwwQuery;//SOL 144458 KINTANA 1208325 - Eraldo
begin
   // Marchetti - Pendencia 22042
   if Sistema.idModulo = 15 then
   begin
      MontaSelect.Executar;
      Repaint;

      if MontaSelect.RetornouValor then
      begin

         iContrato := StrToFloat(MontaSelect.ValoresChave[0]);

         iIdBenef  := StrToInt(MontaSelect.ValoresChave[1]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         LimpaParametros(qry);
         qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
         qry.Open;
         //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
         qryAuxAlteracao.Close;
         qryAuxAlteracao.ParamByName('IDHISTSUSPCOBEP').AsString := qry.FieldByName('IDHISTSUSPCOBEP').AsString;
         qryAuxAlteracao.Open;
         //fim - Andre Olvivera SOL 155626 Kintana 1210042

         dtmLookEmptmo.qryLookTipoSusp.Close;
         dtmLookEmptmo.qryLookTipoSusp.Sql.Clear;
         dtmLookEmptmo.qryLookTipoSusp.SQl.Add(MontaQueryTipoSusp(False));
         LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
         dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsFloat  := qryIDTIPOCONTREMPTMO.Value;
         dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0;
         dtmLookEmptmo.qryLookTipoSusp.Open;

   {   // ELS SOL 144458 Kintana 1208325 INICIO
   iValidaPrestacaoProjetada := CalcEmptmo.ValidaPrestacaoProjetada(dtmLookEmptmo.qryLookTipoSuspTSEIDREGRACALCPRESTPROJETADA.AsInteger,
                                                      iContrato,
                                                      qryContratoIDPESSOA.AsInteger,
                                                      qryContratoIDBENEF.AsInteger,
                                                      qryContratoIDPATRO.AsInteger,
                                                      qryContratoFLGINTERNO.AsString,
                                                      StrToInt(dbcboSuspensao.LookupValue),
                                                      trunc(dbSpnMeses.Value),
                                                      qryHSCINICIOSUSP.AsDateTime,
                                                      qryHSCFINALSUSP.AsDateTime,
                                                      iFerias,
                                                      iNumParcAberto,
                                                      iNumParcPagas,
                                                      dDataInicioAnt,
                                                      qryHSCDATAATU.AsDateTime,
                                                      dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                                      iExcepcional,
                                                      qryContratoIDPESSJURCEDIDO.AsInteger,
                                                      0,
                                                      qryFLGSTATUS.AsString
                                                      );

   edtPretProj.Text := InttoStr(iValidaPrestacaoProjetada);

   // ELS SOL 144458 Kintana 1208325 Fim
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // ELS SOL 144458 Kintana 1208325 INICIO

   iValidaMargemConsAtual := CalcEmptmo.ValidaMargemConsAtual(dtmLookEmptmo.qryLookTipoSuspTSEIDREGRACALCULOMARGELATUAL.AsInteger,
                                                   iContrato,
                                                   qryContratoIDPESSOA.AsInteger,
                                                   qryContratoIDBENEF.AsInteger,
                                                   qryContratoIDPATRO.AsInteger,
                                                   qryContratoFLGINTERNO.AsString,
                                                   StrToInt(dbcboSuspensao.LookupValue),
                                                   trunc(dbSpnMeses.Value),
                                                   qryHSCINICIOSUSP.AsDateTime,
                                                   qryHSCFINALSUSP.AsDateTime,
                                                   iFerias,
                                                   iNumParcAberto,
                                                   iNumParcPagas,
                                                   dDataInicioAnt,
                                                   qryHSCDATAATU.AsDateTime,
                                                   dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                                   iExcepcional,
                                                   qryContratoIDPESSJURCEDIDO.AsInteger,
                                                   0,
                                                   qryFLGSTATUS.AsString
                                                   );
    edtMargCons.Text :=  InttoStr(iValidaMargemConsAtual);
   // ELS SOL 144458 Kintana 1208325 Fim
   // ----------------------------------------------------------------------------------------------

   // ELS Sol 144458 Kintana 1208325 Inicio
   try
      QryAux                := TwwQuery.Create(nil);
      QryAux.DatabaseName   := 'BaseDados';
      sSQL := 'SELECT HMEVLRPREVISTO ' + #13 +
              'FROM HISTMOVEMPTMO' + #13 +
              ' WHERE IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
              '   AND HMETIPOMOV = 1' + #13 +
              '   AND HMECENTRALIZA = 1'+ #13 +
              '   AND HMEDATAPREVISTA = (SELECT MAX(HMEDATAPREVISTA)'+ #13 +
              '   FROM HISTMOVEMPTMO'+ #13 +
              ' where idcontratoemptmo = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
              '   AND HMETIPOMOV = 1'+ #13 +
              '   AND HMECENTRALIZA = 1)';

      QryAux.SQL.Text := sSQL;
      QryAux.Open;
      edtPretAtual.Text := QryAux.FieldByName('HMEVLRPREVISTO').AsString;
   finally
      FreeAndNil(QryAux);
   end;
   // ELS Sol 144458 Kintana 1208325 Inicio
   // ----------------------------------------------------------------------------------------------}

         //BRUNO AZEVEDO SOL KINTANA
         dbcboSuspensao.Text := qry.FieldByName('tsedescricao').AsString;
         sOldStatus := rdgStatus.Value;

         sOldObs := qry.FieldByName('OBSERVACAO').Value;     //edilaine  SIG100227
         btnObserva.enabled := true;                         //edilaine  SIG100227

         sbtnAlterar.Enabled := True;
      end;

      sbtnProcurar.Down := False;
   end
   else
   begin
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         iContrato := StrToFloat(frmExecSelecionaContrato.ValoresChave[0]);

         LimpaParametros(qry);
         qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
         qry.Open;
         //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
         qryAuxAlteracao.Close;
         qryAuxAlteracao.ParamByName('IDHISTSUSPCOBEP').AsString := qry.FieldByName('IDHISTSUSPCOBEP').AsString;
         qryAuxAlteracao.Open;
         //fim - Andre Olvivera SOL 155626 Kintana 1210042
         // -------------------------------------------------------------------------------------------

         LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
         dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryIDTIPOCONTREMPTMO.AsInteger;
          dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
         // Marchetti - Pendencia 26947
         // A pedido da FUNCEF, não deve ter mais esse filtro para a CentralAP,
         // desfazendo assim o que foi pedido na pendencia 21345

         // André Pontes - 25/01/2006 - pendência 21345
//         if Sistema.IDModulo <> 15 then
//            dtmLookEmptmo.qryLookTipoSusp.ParamByName('PFLGFERIAS').AsInteger       := 1;
         // FIM André Pontes - 25/01/2006 - pendência 21345

         // Fim Marchetti - Pendencia 26947
         dtmLookEmptmo.qryLookTipoSusp.Open;

         sContrato := frmExecSelecionaContrato.ValoresChave[0];
         sNome     := frmExecSelecionaContrato.ValoresChave[2];
         iIdBenef  := StrToInt(frmExecSelecionaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         // -------------------------------------------------------------------------------------------
         sbtnAlterar.Enabled := True;
      end;

      sOldObs := qry.FieldByName('OBSERVACAO').Value;     //edilaine  SIG100227
      btnObserva.enabled := true;                         //edilaine  SIG100227

      molContratoEmptmo.edtIdContrato.Text := sContrato;
      molContratoEmptmo.edtMatricula.Text  := sMatricula;
      molContratoEmptmo.edtNome.Text       := sNome;

      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



procedure TfrmHistoricoSuspensaoCob.dbcboSuspensaoEnter(Sender: TObject);
begin
   inherited;

   LimpaParametros(qryContrato);
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
   qryContrato.Open;

   // --------------------------                        --------------------------------------------------------------------

   dtmLookEmptmo.qryLookTipoSusp.Close;
   dtmLookEmptmo.qryLookTipoSusp.Sql.Clear;
   dtmLookEmptmo.qryLookTipoSusp.SQl.Add(MontaQueryTipoSusp(True));
   LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
   dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryContratoIDTIPOCONTREMPTMO.AsInteger;
   dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
   // Marchetti - Pendencia 26947
   // A pedido da FUNCEF, não deve ter mais esse filtro para a CentralAP,
   // desfazendo assim o que foi pedido na pendencia 21345

   // André Pontes - 25/01/2006 - pendência 21345
//   if Sistema.IDModulo <> 15 then
//      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PFLGFERIAS').AsInteger       := 1;
   // FIM André Pontes - 25/01/2006 - pendência 21345

   // Fim Marchetti - Pendencia 26947
   dtmLookEmptmo.qryLookTipoSusp.Open;

   // ----------------------------------------------------------------------------------------------

   if qry.State = dsInsert then
   begin
      qryTSEDESCRICAO.AsString := dtmLookEmptmo.qryLookTipoSusp.FieldByName('TSEDESCRICAO').AsString;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.edtDataInicioExit(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then
   begin
      if not(dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.IsNull) then
      begin
         qryHSCFINALSUSP.AsDateTime := dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.AsDateTime;
      end
      else
      if not dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.IsNull then
      begin
         qryHSCFINALSUSP.AsDateTime :=  DiasUteis.SomaMeses(dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.AsDateTime, qryHSCMESES.AsInteger);
      end;

      if (dbSpnMeses.Value > 0) and (edtDataInicio.Text <> '') then
      begin
         qryHSCFINALSUSP.AsDateTime := DiasUteis.SomaMeses(edtDataInicio.Date, qryHSCMESES.AsInteger);
         edtDataFinal.Date          := qryHSCFINALSUSP.AsDateTime;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.qryAfterScroll(DataSet: TDataSet);
 var sSQL : String;//SOL 144458 KINTANA 1208325 - Eraldo
     Qry  : TwwQuery;//SOL 144458 KINTANA 1208325 - Eraldo
begin
   inherited;

   molContratoEmptmo.edtIdContrato.Text := qryIDCONTRATOEMPTMO.AsString;
   molContratoEmptmo.edtMatricula.Text  := qryMATRICULA.AsString;
   molContratoEmptmo.edtNome.Text       := qryNOME_MUTUARIO.AsString;
end;



function TfrmHistoricoSuspensaoCob.ExistenciaSuspensaoAtiva : Boolean;
var
   query : TwwQuery;
   sSQL  : String;
begin
   Result := False;

   if (qry.State = dsInsert) or ((qry.State = dsEdit) and (rdgStatus.Value = 'A') and (sOldStatus <> 'A')) then
   begin
      query  := TwwQuery.Create(nil);
      query.DatabaseName := 'BaseDados';
      try
         sSQL := 'SELECT COUNT(*) FROM HISTSUSPCOBEP ' + #13 +
                 'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
                 'AND    FLGSTATUS        = ' + QuotedStr('A') + #13;
         query.SQL.Text := sSQL;
         query.Open;

         Result := (query.Fields[0].AsInteger > 0);

         if Result then
         begin
            MsgDlg('Existe uma suspensão ativa para este contrato.','Empréstimo',mtWarning,[mbOk],0);
            Repaint;
         end;

         query.Close;

      finally
         query.Close;
         query.Free;
      end;
   end;
end;



function TfrmHistoricoSuspensaoCob.ExistenciaContratoAtivo : Boolean;
var
   query : TwwQuery;
   sSQL  : String;
begin
      Result := False;

      query  := TwwQuery.Create(nil);
      query.DatabaseName := 'BaseDados';
      try

         sSQL := 'SELECT COUNT(*) FROM CONTRATOEMPTMO ' + #13 +
                 //Fanuel Junior SOL 161201 Kintana 1357157
                 'WHERE  IDCONTRATOEMPTMO = ' +  qryIDCONTRATOEMPTMO.AsString  + #13 +
                 ' AND   IDPESSOA        = ' + qryIDPESSOA.AsString +
                 ' AND   FLGSITUACAO        = ' + QuotedStr('A') + #13;
                 ;
         query.SQL.Text := sSQL;
         query.Open;

         IF query.Fields[0].AsInteger > 1 THEN  Result := True; //Fanuel Junior SOL 161201 Kintana 1357157
         //IF query.Fields[0].AsInteger > 0 THEN  Result := True;
         query.Close;

      finally
         query.Close;
         query.Free;
      end;
end;




procedure TfrmHistoricoSuspensaoCob.sbtnAlterarClick(Sender: TObject);
begin
   if qry.IsEmpty then Exit;

   HabilitaControles(False);
   inherited;
end;

procedure TfrmHistoricoSuspensaoCob.CmeCadastroConfirma(Sender: TObject);
var
   query             : TwwQuery;
   sSQL              : String;
   iAno, iMes, iDia  : Word;
   sAno, sMes        : String;
begin

   if bErro then
   begin
     // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
     // bbtnCancelarClick(self);
      exit;
   end;

   query                := TwwQuery.Create(nil);
   query.DatabaseName   := 'BaseDados';

   DecodeDate(qryHSCINICIOSUSP.AsDateTime, iAno, iMes, iDia);

   try
      StartTransacao;

      if qry.State = dsInsert then
      begin
         sSQL :=
         'UPDATE CONTRATOEMPTMO '                                                                                 + #13 +
         'SET IDTIPOSUSPEMPTMO    = ' + qryIDTIPOSUSPEMPTMO.AsString                                       + ', ' + #13 +
         'DATAINICIOSUSP          = TO_DATE(' + QuotedStr(qryHSCINICIOSUSP.AsString) + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'DATAFIMSUSP             = TO_DATE(' + QuotedStr(qryHSCFINALSUSP.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'USUARIOLIBSUSP          = ' + QuotedStr(qryHSCUSULIBER.AsString)                                 + ', ' + #13 +
         'DATALIBSUSP             = TO_DATE(' + QuotedStr(qryHSCDATALIBER.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'ANOSUSPENSAO            = ' + IntToStr(iAno)                                                     + ', ' + #13 +
         'MESSUSPENSAO            = ' + IntToStr(iMes)                                                            + #13 +
         'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                                              + #13;

         query.SQL.Text := sSQL;
         query.ExecSQL;
      end
      else
       if rdgStatus.ItemIndex <> 0 then
       begin
             If (sOldStatus='A') Then
             Begin
                  If ExistenciaContratoAtivo = false then
                  Begin
                  sSQL :=
                  'UPDATE CONTRATOEMPTMO '                                                           + #13 +
                  'SET IDTIPOSUSPEMPTMO    = NULL '                                           + ', ' + #13 +
                  'DATAINICIOSUSP          = NULL '                                           + ', ' + #13 +
                  'DATAFIMSUSP             = NULL '                                           + ', ' + #13 +
                  'USUARIOLIBSUSP          = NULL '                                           + ', ' + #13 +
                  'ANOSUSPENSAO            = NULL '                                           + ', ' + #13 +
                  'MESSUSPENSAO            = NULL '                                           + ', ' + #13 +
                  'DATALIBSUSP             = NULL '                                                  + #13 +
                  'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                        + #13;

                  query.SQL.Text := sSQL;
                  query.ExecSQL;
                  end;
            end;
       end
       else
       Begin

        If (sOldStatus='A') Then
        Begin

         sSQL :=
         'UPDATE CONTRATOEMPTMO '                                                                                 + #13 +
         'SET DATAINICIOSUSP      = TO_DATE(' + QuotedStr(qryHSCINICIOSUSP.AsString) + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'DATAFIMSUSP             = TO_DATE(' + QuotedStr(qryHSCFINALSUSP.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'USUARIOLIBSUSP          = ' + QuotedStr(qryHSCUSULIBER.AsString)                                 + ', ' + #13 +
         'DATALIBSUSP             = TO_DATE(' + QuotedStr(qryHSCDATALIBER.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'ANOSUSPENSAO            = ' + IntToStr(iAno)                                                     + ', ' + #13 +
         'MESSUSPENSAO            = ' + IntToStr(iMes)                                                            + #13 +
         'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                                              + #13;

         query.SQL.Text := sSQL;
         query.ExecSQL;
        end
        else
        Begin
         sSQL :=
         'UPDATE CONTRATOEMPTMO '                                                                                 + #13 +
         'SET IDTIPOSUSPEMPTMO    = ' + qryIDTIPOSUSPEMPTMO.AsString                                       + ', ' + #13 +
         'DATAINICIOSUSP          = TO_DATE(' + QuotedStr(qryHSCINICIOSUSP.AsString) + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'DATAFIMSUSP             = TO_DATE(' + QuotedStr(qryHSCFINALSUSP.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'USUARIOLIBSUSP          = ' + QuotedStr(qryHSCUSULIBER.AsString)                                 + ', ' + #13 +
         'DATALIBSUSP             = TO_DATE(' + QuotedStr(qryHSCDATALIBER.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
         'ANOSUSPENSAO            = ' + IntToStr(iAno)                                                     + ', ' + #13 +
         'MESSUSPENSAO            = ' + IntToStr(iMes)                                                            + #13 +
         'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                                              + #13;

         query.SQL.Text := sSQL;
         query.ExecSQL;
        end;
         //**********************************************************
       end;

      CommitTransacao;
   finally
      query.Free;
   end;

   qry.ApplyUpdates;
   qry.Close;
   //Fanuel Junior SOL 161201 Kintana 1357157
   qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
   qry.Open;
   //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
   qryAuxAlteracao.Close;
   qryAuxAlteracao.ParamByName('IDHISTSUSPCOBEP').AsString := qry.FieldByName('IDHISTSUSPCOBEP').AsString;
   qryAuxAlteracao.Open;
   //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
   HabilitaControles(True);
end;

procedure TfrmHistoricoSuspensaoCob.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnBuscaContratoClick(Sender);

   iContrato := molContratoEmptmo.IDContrato;

   LimpaParametros(qryContrato);
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
   qryContrato.Open;

   // Parcelas Restantes-------------------------------------------------------------------------
   with qryParcelasRestantes do
   begin
      LimpaParametros(qryParcelasRestantes);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat   := iContrato;
      Open;

      if not(IsEmpty) then edtPrazoRestante.Text := FormatFloat('#0', qryParcelasRestantesPARCELAS_RESTANTES.AsInteger);
   end;
   // Fim Parcelas Restantes --------------------------------------------------------------------


   if qry.State in dsEditModes then
   begin
      qryIDCONTRATOEMPTMO.AsFloat := iContrato;
      qryHSCINICIOSUSP.AsDateTime := DataInicioSuspensao;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.DBspnMesesExit(Sender: TObject);
begin
   inherited;
   // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
   bErro := False;
   bbtnConfirmar.Enabled := not bErro;
   // SOL 161455 Kintana 1407576 Otacilio Aquino - Fim
   if dbcboSuspensao.LookupValue = '' then
   begin
      MsgDlg('Favor selecionar o tipo de suspensão', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      bErro := True;
      bbtnConfirmar.Enabled := not bErro;
      if dbcboSuspensao.CanFocus then dbcboSuspensao.SetFocus;
      Exit;
   end;

   iMesesFim := trunc(DBspnMeses.Value);

   if qry.State in dsEditModes then
   begin
      if iMesesIni <> iMesesFim then
      begin
         if dbSpnMeses.Value > dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger then
         begin
            MsgDlg('Não é permitida a suspensão.', 'Empréstimo', mtWarning, [mbOK], 0);
           
            Repaint;
           // dbSpnMeses.SetFocus;

            // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
            bErro := True;
            bbtnConfirmar.Enabled := not bErro;
            // SOL 161455 Kintana 1407576 Otacilio Aquino - Fim
            Exit;
         end;
      end;

      if not(TestaSuspensao) then
      begin
        MsgDlg('Não é permitida a suspensão.', 'Empréstimo', mtWarning, [mbOK], 0);
        //MsgDlg('Nº de meses não pode ser superior a ' + dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsString + '.',
        //       'Empréstimo', mtWarning, [mbOk], 0);
        Repaint;
        //dbSpnMeses.SetFocus;

        // SOL 161455 Kintana 1407576 Otacilio Aquino - Inicio
        bErro := True;
        bbtnConfirmar.Enabled := not bErro;
        Exit;
        // SOL 161455 Kintana 1407576 Otacilio Aquino - Fim
      end;
   end;

   if (edtDataInicio.Text <> '') and (edtDataFinal.Text <> '') then
   begin
      if qry.State in dsEditModes then
      begin
         qryHSCMESES.AsInteger := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);
      end
      else
      begin
         dbSpnMeses.Value      := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);
      end;
   end;
     // end;
  // end;
end;



procedure TfrmHistoricoSuspensaoCob.HabilitaControles(bDesabilita : Boolean);
begin
   dbcboSuspensao.ReadOnly := bDesabilita;
   dbSpnMeses.ReadOnly     := bDesabilita;
   edtDataInicio.ReadOnly  := bDesabilita;
   edtDataFinal.ReadOnly   := bDesabilita;
   chkFerias.ReadOnly      := bDesabilita;
   rdgStatus.ReadOnly      := bDesabilita;
   edtDataLibSusp.ReadOnly := bDesabilita;
   DBcboMes.ReadOnly       := bDesabilita;
   DBspnAno.ReadOnly       := bDesabilita;
   MmObservacao.ReadOnly   := bDesabilita; // SOL 149705 KINTANA 1081508
   edtPretAtual.ReadOnly   := bDesabilita;//SOL 144458 KINTANA 1208325 - Eraldo

   dbcboSuspensao.Enabled  := not(dbcboSuspensao.ReadOnly);
   dbSpnMeses.Enabled      := not(dbSpnMeses.ReadOnly);
   edtDataInicio.Enabled   := not(edtDataInicio.ReadOnly);
   edtDataFinal.Enabled    := not(edtDataFinal.ReadOnly);
   chkFerias.Enabled       := not(chkFerias.ReadOnly);
   rdgStatus.Enabled       := not(rdgStatus.ReadOnly);
   edtDataLibSusp.Enabled  := not(edtDataLibSusp.ReadOnly);
   DBcboMes.Enabled        := not(DBcboMes.ReadOnly);
   DBspnAno.Enabled        := not(DBspnAno.ReadOnly);
   MmObservacao.Enabled    := not(MmObservacao.ReadOnly); // SOL 149705 KINTANA 1081508
   edtPretAtual.ReadOnly   := not(edtPretAtual.ReadOnly);//SOL 144458 KINTANA 1208325 - Eraldo
end;



procedure TfrmHistoricoSuspensaoCob.sbtnInserirClick(Sender: TObject);
begin
   if qry.State in dsEditModes then bbtnCancelarClick(self);
   edtPretAtual.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   edtPretProj.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   edtMargCons.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   HabilitaControles(False);
   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   edtPretAtual.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   edtPretProj.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   edtMargCons.Text := '';//SOL 144458 KINTANA 1208325 - Eraldo
   HabilitaControles(True);
end;



procedure TfrmHistoricoSuspensaoCob.CmeCadastroInsert(Sender: TObject);
var
iIdBenef : integer;
begin
   inherited;
   dbcboSuspensao.Enabled := True;
   CmeCadastro.RepetirInsert := False;

   qryHSCINICIOSUSP.AsDateTime := Date;

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 15 then
   begin
      molContratoEmptmobtnBuscaContratoClick(self);

      iContrato                   := molContratoEmptmo.IDContrato;
      qryIDCONTRATOEMPTMO.AsFloat := iContrato;
      dtmLookEmptmo.qryLookTipoSusp.Close;
      dtmLookEmptmo.qryLookTipoSusp.Sql.Clear;
      dtmLookEmptmo.qryLookTipoSusp.SQl.Add(MontaQueryTipoSusp(True));
      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryContratoIDTIPOCONTREMPTMO.AsInteger;
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
      dtmLookEmptmo.qryLookTipoSusp.Open;
   end
   else
   begin
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         iContrato                     := StrToFloat(frmExecSelecionaContrato.ValoresChave[0]);
         IntegraModulo.iEvento         := 8;
         IntegraModulo.iContratoEmptmo := StrToFloat(frmExecSelecionaContrato.ValoresChave[0]);

         iIdBenef  := StrToInt(frmExecSelecionaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         sContrato := frmExecSelecionaContrato.ValoresChave[0];
         sNome     := frmExecSelecionaContrato.ValoresChave[2];
      end;
      frmExecSelecionaContrato.Free;

      qryIDCONTRATOEMPTMO.AsFloat          := iContrato;
      molContratoEmptmo.edtIdContrato.Text := sContrato;
      molContratoEmptmo.edtMatricula.Text  := sMatricula;
      molContratoEmptmo.edtNome.Text       := sNome;

      LimpaParametros(qryContrato);
      qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
      qryContrato.Open;

      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryContratoIDTIPOCONTREMPTMO.AsInteger;
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PCONC').AsInteger := 0; // Ádler Souza - SOL 142594 KTN 912858
      dtmLookEmptmo.qryLookTipoSusp.Open;

      // Parcelas Restantes-------------------------------------------------------------------------
      with qryParcelasRestantes do
      begin
         LimpaParametros(qryParcelasRestantes);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat   := iContrato;
         Open;

         if not(IsEmpty) then edtPrazoRestante.Text := FormatFloat('#0', qryParcelasRestantesPARCELAS_RESTANTES.AsInteger);
      end;
      // Fim Parcelas Restantes --------------------------------------------------------------------

      if qry.State in dsEditModes then
      begin
         qryHSCINICIOSUSP.AsDateTime := DataInicioSuspensao;
      end;
   end;
   // Fim Marchetti - Pendencia 22042
end;

procedure TfrmHistoricoSuspensaoCob.DBspnMesesEnter(Sender: TObject);
begin
   inherited;

   iMesesIni := trunc(DBspnMeses.Value);
end;

procedure TfrmHistoricoSuspensaoCob.bbtnConfirmarClick(Sender: TObject);
var 
rLogTotalPrev     : TLogTotalPrev;
I : Integer;
sDescricao : string;
begin

   //BRUNO AZEVEDO SOL 161447 KINTANA 1407564
   if (cmeCadastro.Operacao = opAlterar) then begin
     qryCheca.Close;
     qryCheca.Sql.Clear();
     qryCheca.Sql.Add('select COUNT(1) AS QTD from histmovemptmo');
     qryCheca.Sql.Add(' where idcontratoemptmo = :IDCONTRATOEMPTMO');
     qryCheca.Sql.Add('   and iditememptmo = 13');
     qryCheca.Sql.Add('   and ((hmedataprevista >= :DATAINI) and (hmedataprevista <= :DATAFIM))');
     qryCheca.ParamByName('IDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
     qryCheca.ParamByName('DATAINI').AsDateTime := edtDataInicio.Date;
     qryCheca.ParamByName('DATAFIM').AsDateTime := edtDataFinal.Date;
     qryCheca.Open;

     if (qryCheca.FieldByName('QTD').AsInteger = 0) and (qry.FieldByName('flgstatus').AsString = 'E') then begin
       MessageBox(handle,'Suspensão não utilizada. Para este caso deverá ser selecionado o status "Cancelada".','Atenção',MB_ICONINFORMATION + MB_OK);
       Abort;
     end;    
   end;
   //BRUNO AZEVEDO SOL 161447 KINTANA 1407564

   IntegraModulo.iEvento         := 8;
   IntegraModulo.iContratoEmptmo := qryIDCONTRATOEMPTMO.AsFloat;

   QryTipoSusp.close;
   QryTipoSusp.ParamByName('IDTIPOSUSPEMPTMO').AsFloat := qryIDTIPOSUSPEMPTMO.AsFloat;
   QryTipoSusp.open;

   if QryTipoSusp.FieldByName('QTDE').AsFloat  > 0 then
   begin
      if trim(MmObservacao.Text) = ''  then
      begin
         MessageBox(handle,'É obrigatório o preenchimento do campo observação.','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;
   end;

   inherited;
    //Inicio - Andre Olvivera SOL 155626 Kintana 1210042
   if (temAlteracao) and not(qry.State in [dsedit]) then
   begin
      for  i := 0 to sMsg.Count - 1do
      begin
           if(sDescricao <> '')then
           begin
                sDescricao :=  sDescricao+', ' + sMsg.Strings[I];
           end
           else
           begin
                sDescricao :=  sMsg.Strings[I];
           end
      end;

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := qry.FieldByName('IDHISTSUSPCOBEP').AsFloat;
      rLogTotalPrev.IDHistMov  := 0;
      rLogTotalPrev.CodPlanDoc := 0;
      rLogTotalPrev.Origem     := 16;
      rLogTotalPrev.Operacao   := sDescricao;
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;
      GravaLogTotalPrev(rLogTotalPrev);

     qryAuxAlteracao.Close;
     qryAuxAlteracao.ParamByName('IDHISTSUSPCOBEP').AsString := qry.FieldByName('IDHISTSUSPCOBEP').AsString;
     qryAuxAlteracao.Open;
   end;
   //fim - Andre Olvivera SOL 155626 Kintana 1210042
end;

procedure TfrmHistoricoSuspensaoCob.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbcboSuspensao.Enabled := False;
end;

procedure TfrmHistoricoSuspensaoCob.dbGrdCellChanged(Sender: TObject);
begin
  inherited;
  sOldStatus := qryFlgStatus.Value;
end;

function TfrmHistoricoSuspensaoCob.MontaQueryTipoSusp(FLGSUSAPENASCONC: Boolean): String;
var
  vSql: String;
begin
  vSql :=
    'SELECT ' +
    ' TSE.IDTIPOSUSPEMPTMO, ' +
    ' TSE.IDREGRAENVIOPARC, ' +
    ' TSE.IDREGRARECALCIOF, ' +
    ' TSE.IDREGRARECALCSEG, ' +
    ' TSE.IDREGRAVALIDSUSP, ' +
    ' TSE.TSEDESCRICAO, ' +
    ' TSE.TSEMESES, ' +
    ' TSE.TSEINICIOSUSP, ' +
    ' TSE.TSEFINALSUSP, ' +
    ' TSE.IDRUBRICAADFERIAS, ' +
    ' TSE.FLGGERAPARCELAS, ' +
    ' TSE.FLGATUALSALDOPARC, ' +
    ' TSE.FLGSUSPCONCESSAO, ' +
    ' TSE.FLGCOBRAENCARGOS, ' +
    ' TSE.FLGDEDUZPARCREST, ' +
    ' TSE.FLGATUALSALDOENV, ' +
    ' TSE.FLGFERIAS, ' +
    ' TSE.FLGCOBRJUDICIAL, ' +
    ' TSE.PERCENTUAL, ' +
    ' TSE.FLGSUSAPENASCONC, ' +//SOL 144458 KINTANA 1208325 - Eraldo
    ' TSE.TSEIDREGRACALCPRESTPROJETADA, ' +//SOL 144458 KINTANA 1208325 - Eraldo
    ' TSE.TSEIDREGRACALCULOMARGELATUAL ' +//SOL 144458 KINTANA 1208325 - Eraldo
    'FROM ' +
    '   TIPOSUSPEMPTMO TSE, ' +
    '   TIPOCONTRXSUSP TCS ' +
    'WHERE ' +
    '       (:PIDTIPOCONTREMPTMO   IS NULL  OR TCS.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO) ' +
    '   AND TSE.IDTIPOSUSPEMPTMO   = TCS.IDTIPOSUSPEMPTMO ';
    //'   AND (:PFLGFERIAS           IS NULL  OR NVL(TSE.FLGFERIAS, 0) = 1) ' ;
    if (FLGSUSAPENASCONC) then begin
      vSql := vSql + '   AND (TSE.FLGSUSAPENASCONC = nvl(:PCONC,0) )';
    end else begin
      vSql := vSql + '   AND (:PCONC = :PCONC)';
    end;
    Result := vSql;
end;

//Inicio - Andre Olvivera SOL 155626 Kintana 1210042
function TfrmHistoricoSuspensaoCob.VerificaHtsAlteracao: Boolean;
begin
     result :=  false;
     sMsg.Clear;
     if qry.state <> dsinsert then   // SOL 195397 KINTANA 1866686
     begin
         if (qry.FieldByName('HSCINICIOSUSP').OldValue <> qry.FieldByName('HSCINICIOSUSP').Value)then
         begin
           if (qry.FieldByName('HSCINICIOSUSP').OldValue <> null)then
               sMsg.ADD('Início Suspensão: ('+String(qry.FieldByName('HSCINICIOSUSP').OldValue)+')')
           else
               sMsg.ADD('Início Suspensão: ( )');
         end;

         if (qry.FieldByName('HSCFINALSUSP').OldValue <> qry.FieldByName('HSCFINALSUSP').Value)then
         begin
            if (qry.FieldByName('HSCFINALSUSP').OldValue <> null)then
                sMsg.ADD('Final de Suspensão: ('+String(qry.FieldByName('HSCFINALSUSP').OldValue)+')')
            else
                sMsg.ADD('Final de Suspensão: ( )');
         end;

         if (qry.FieldByName('HSCMESES').OldValue <> qry.FieldByName('HSCMESES').Value)then
         begin
             if (qry.FieldByName('HSCMESES').OldValue <> null)then
                 sMsg.ADD('Número de Meses: ('+String(qry.FieldByName('HSCMESES').OldValue)+')')
             else
                 sMsg.ADD('Número de Meses: ( )');
         end;

         if (qry.FieldByName('HSCDATALIBER').OldValue <> qry.FieldByName('HSCDATALIBER').Value)then
         begin
            if (qry.FieldByName('HSCDATALIBER').OldValue <> null)then
                sMsg.ADD(('Data Liberação: ('+String(qry.FieldByName('HSCDATALIBER').OldValue)+')'))
            else
                sMsg.ADD(('Data Liberação: ( )'));
         end;

         if (qry.FieldByName('HSCMESCOBRANCA').OldValue <> qry.FieldByName('HSCMESCOBRANCA').Value) then
         begin
            if (qry.FieldByName('HSCMESCOBRANCA').OldValue <> null) then
                 sMsg.ADD('Início de cobrança Mês: ('+String(qry.FieldByName('HSCMESCOBRANCA').OldValue)+')')
            else
                sMsg.ADD('Início de cobrança Mês: ( )');
         end;

         if(qry.FieldByName('HSCANOCOBRANCA').OldValue <> qry.FieldByName('HSCANOCOBRANCA').Value) then
         begin
              if (qry.FieldByName('HSCMESCOBRANCA').OldValue <> null)and (qry.FieldByName('HSCANOCOBRANCA').OldValue <> null) then
                  sMsg.ADD('Início de cobrança Ano: ( '+String(qry.FieldByName('HSCANOCOBRANCA').OldValue)+')')
              else
                 sMsg.ADD('Início de cobrança Ano: (  )');

         end;
         if(qry.FieldByName('FLGSTATUS').OldValue <> qry.FieldByName('FLGSTATUS').Value) then
         begin
              if (qry.FieldByName('FLGSTATUS').OldValue <> null)and (qry.FieldByName('FLGSTATUS').OldValue <> null) then
                  sMsg.ADD('Status: ( '+String(qry.FieldByName('FLGSTATUS').OldValue)+')')
              else
                 sMsg.ADD('Status: (  )');

         end;

         //edilaine  SIG100227 : inicio
         //if (qry.FieldByName('OBSERVACAO').OldValue <> qry.FieldByName('OBSERVACAO').Value)then
         if sOldObs  <> MmObservacao.Lines.text  then
         begin
            if (sOldObs <> '') {(qry.FieldByName('OBSERVACAO').OldValue <> null)} then
                sMsg.ADD(('Observação('+sOldObs {String(qry.FieldByName('OBSERVACAO').OldValue)} +')'))
            else
                sMsg.ADD(('Observação( )'));
         end;
         //edilaine  SIG100227 : fim

        if (qry.State in [dsedit]) and (sMsg.Count <> 0) then
             Result := True;
     end;  // SOL 195397 KINTANA 1866686
end;


procedure TfrmHistoricoSuspensaoCob.FormCreate(Sender: TObject);
begin
  inherited;

  pgHistorico := TPageControl.Create(Self);

  pgHistorico.Parent := Self;
  pgHistorico.Align  := alBottom;
  pgHistorico.Height := 120;

  //pnlFundo.Parent := Teste;

  tsHistoricoSuspencao             := TTabSheet.Create(pgHistorico);
  tsHistoricoSuspencao.Caption     := 'Histórico de Suspensão';
  tsHistoricoSuspencao.PageControl := pgHistorico;

  tsHistoricoSuspencao.Align := alClient;


  pnlFundo.Parent := tsHistoricoSuspencao;

  tsHistoricoAlteracao             := TTabSheet.Create(pgHistorico);
  tsHistoricoAlteracao.Caption     := 'Histórico de Alterações';
  tsHistoricoAlteracao.PageControl := pgHistorico;

  //dbGridHstAlteracao := TwwDBGrid.Create(TabS02);
  dbGridHstAlteracao.Parent := tsHistoricoAlteracao;
  pnlFundo.Align := alClient;
  dbGridHstAlteracao.Align := alClient;
end;

procedure TfrmHistoricoSuspensaoCob.FormDestroy(Sender: TObject);
begin
  inherited;
   //FreeAndNil(dbGridHstAlteracao);
   FreeAndNil(tsHistoricoSuspencao);
   FreeAndNil(tsHistoricoAlteracao);
   FreeAndNil(pgHistorico);
end;
//fim - André Olvivera SOL 155626 Kintana 1210042


//edilaine - SIG100227 : inicio
procedure TfrmHistoricoSuspensaoCob.btnObservaClick(Sender: TObject);
begin
  inherited;
  MostraDados(self.caption, 'Observação', TStringList(MmObservacao.lines));
end;

procedure TfrmHistoricoSuspensaoCob.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  btnObserva.enabled := (cmecadastro.operacao in [opIdle, opVazio]) and (not qry.isEmpty);    //edilaine SIG100227
end;
//edilaine - SIG100227 : fim

end.
