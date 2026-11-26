unit FLancContasReceber;
//******************************************************************************
// Data       : 07/10/2019
// SIG        : 92533
// Autor      : Ewerton Beltramini
// Descrição  : Ajuste na consulta de recuperação do valor a ser lançado no documento.
//******************************************************************************
// Data       : 20/08/2019
// SIG        : 90208
// Autor      : edilaine
// Descrição  : Data de lançamento incorreta ao gerar documento a receber via Folha
//******************************************************************************
// Data       : 22/02/2018
// SIG        : SIG TIBERO
// Autor      : Everson Luiz Pereira da Cunha
// Descrição  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//******************************************************************************
// Data       : 27/11/2017
// SIG        : 56702
// Autor      : Peterson Victor
// Descrição  : Alterações para tratar perfil de investimento
//******************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, uCtrlDocumento, uCtrlLancamento, usistema,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, IvDictio, IvMulti,
  uIntegraBack, uDatabase, uObjFolha, uFuncoesFolha, uMensErro, IvEMulti, UFolhaBenef,
  DBTables, Wwquery, Wwdatsrc, uCtrlParamIntegra, uCtrlPadroes;

type
  TfrmLancContasReceber = class(TfrmOkCancelar)
    lblEmissao: TLabel;
    dbeDataEmi: TCMDateTimePicker;
    lblVencimento: TLabel;
    dbeDataVenc: TCMDateTimePicker;
    LblDIspFinanc: TLabel;
    dbeDataDisponib: TCMDateTimePicker;
    CmbPrograma: TCMDBLookupCombo;
    Label13: TLabel;
    Label1: TLabel;
    cmdbFormaPagamento: TCMDBLookupCombo;
    Label3: TLabel;
    mmObservacao: TMemo;
    Label5: TLabel;
    CdsFormaPag: TCMClientDataSet;
    SqlFormaPag: TCMSqlParams;
    SQLProgramaPrev: TCMSqlParams;
    CdsProgramaPrev: TCMClientDataSet;
    dblcTipoRD: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    SQLTipoRD: TCMSqlParams;
    CdsTipoRD: TCMClientDataSet;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    CdsUnidNegoc: TCMClientDataSet;
    SqlUnidNegoc: TCMSqlParams;
    SqlPortForma: TCMSqlParams;
    CdsPortForma: TCMClientDataSet;
    QryParamFolha: TwwQuery;
    DsTipoRD: TwwDataSource;
    DsPortForma: TwwDataSource;
    dsUnidNegoc: TwwDataSource;
    DsFormaPag: TwwDataSource;
    DSProgramaPrev: TwwDataSource;
    qryAux: TwwQuery;
    dblcPortadorForma: TwwDBLookupCombo;
    qryAux1: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    ctrlDocumento: tctrlDocumento;
    ctrlLancamento: tctrlLancamento;

    Function VerificaPreenchimento: boolean;
    Function InsereDocumento( ): Boolean;
    Procedure LimpaPreenchimento;

  public
    { Public declarations }

  end;

var
  frmLancContasReceber: TfrmLancContasReceber;

implementation

uses UConciliacaoCredito, dBaseDados;

{$R *.DFM}

procedure TfrmLancContasReceber.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (VerificaPreenchimento) then
   begin
      //with frmConciliacaoCredito do
      if not(InsereDocumento()) then
      begin
         MsgDlg('Documento cadastrado com sucesso.','Informação',mtInformation,[mbOk],0);
         close;
      end;
   end;

end;

procedure TfrmLancContasReceber.FormShow(Sender: TObject);
begin
   inherited;
   frmConciliacaoCredito.bControlaTela := true;
   sqlTipoRD.Prepare;
   sqlTipoRD.ParamByName('PIDPESSOA').AsFloat := Sistema.IDEmpresa;
   sqlTipoRD.ParamByName('RECPAG').Asstring   := 'R';
   sqlTipoRD.Open;

   SqlFormaPag.Prepare;
   SqlFormaPag.ParamByName('RECPAG').AsString    := 'R';
   SqlFormaPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   SqlFormaPag.OPen;

   SqlProgramaPrev.Prepare;
   SQLProgramaPrev.Open;

   SqlUnidNegoc.Prepare;
   SqlUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
   SqlUnidNegoc.Open;

   SqlPortForma.Prepare;
   SqlPortForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   SqlPortForma.ParamByName('RECPAG').AsString := 'R';
   SqlPortForma.Open;

   //SelecionaTipoDesembolso;
end;

function TfrmLancContasReceber.VerificaPreenchimento: boolean;
begin
   Result := false;
//- Na interface de lançamento de documentos no módulo Contas a Pagar caso a data de emissão não seja informada, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (dbeDataEmi.Date <= 0) then
   begin
      MsgDlg('É necessário informar a data de emissão.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

//- Na interface de lançamento de documentos no módulo Contas a Pagar caso a data de vencimento não seja informada, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (dbeDataVenc.Date <= 0) then
   begin
      MsgDlg('É necessário informar a data de vencimento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

//- Na interface de lançamento de documentos no módulo Contas a Pagar caso a data de disponibilidade não seja informada, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (dbeDataDisponib.Date <= 0) then
   begin
      MsgDlg('É necessário informar a data de disponibilidade.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

//- Na interface de lançamento de documentos no módulo Contas a Pagar caso o tipo de recebimento não seja informado, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (trim(dblcTipoRD.Text) = '') then
   begin
      MsgDlg('É necessário informar o tipo de recebimento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;


//- Na interface de lançamento de documentos no módulo Contas a Pagar caso o contas x caixa x forma de pagamento não seja informado, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (trim(dblcPortadorForma.Text) = '') then
   begin
      MsgDlg('É necessário informar o contas x caixa x forma de pagamento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;


//- Na interface de lançamento de documentos no módulo Contas a Pagar caso a atividade / projeto não seja informada, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (trim(dblcUnidNegoc.Text) = '') then
   begin
      MsgDlg('É necessário informar a atividade / projeto.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

//- Na interface de lançamento de documentos no módulo Contas a Pagar caso o programa não seja informado, ao selecionar o botão OK o sistema apresenta a mensagem:
   if (trim(CmbPrograma.Text) = '') then
   begin
      MsgDlg('É necessário informar o programa.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (trim(cmdbFormaPagamento.Text) = '') then
   begin
      MsgDlg('É necessário informar a forma de recebimento.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   if (trim(mmObservacao.Text) = '') then
   begin
      MsgDlg('É necessário preencher o campo observação.','Informação',mtInformation,[mbOk],0);
      exit;
   end;

   Result := true;

end;


function TfrmLancContasReceber.InsereDocumento(): Boolean;
var
 sCodTipRecDes    : string;
 sDebCre          : string;
 sRecPag          : string;

 iCodAlterador    : Integer;
 iCodTipDoc       : Integer;
 iIdPrograma      : Integer;
 iIdPatro         : Integer;
 iIdPlanoPrev     : Integer;
 iPlnCodigo       : Integer;
 iIdForCli        : Integer;
 iCodDocumento    : Integer;
 iFormaPgto       : Integer;
 lCodportforma    : Integer;
 iUnidNegoc       : Integer;
 eNoDocumento     : Extended;
 rValorDocumento  : real;

 sReferencia      : string;
 sCodCentroResPon : string;
 sCodCentroCusto  : string;
 sComplementoDoc  : string;
 sObs             : string;

 sPlaconta  : string;               //edilaine - SIG90208

 dValorLancamentoRateio : Extended;

 dtVencimento     : TDate;
 dtEmissao        : TDate;
begin
   Result := False;
   if Not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

   ctrlDocumento := tctrlDocumento.create;
   ctrlDocumento.InitializeAs(Padroes);

   ctrlLancamento := tctrlLancamento.create;
   ctrlLancamento.InitializeAs(Padroes);

   CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
   CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
   CtrlDocumento.IdUsuario := Sistema.IdUsuario;

   iFormaPgto      := -1;

   { RECEBER }
   sDebCre          := 'D';
   sRecPag          := 'R';
   sReferencia      := '';
   eNoDocumento     := 0;
   dtVencimento     := StrToDate(dbeDataVenc.Text);
   dtEmissao        := StrToDate(dbeDataEmi.Text);
   sObs             := mmObservacao.Text;

   sComplementoDoc  := '';
   iFormaPgto       := CdsFormaPag.FieldbyName('CODFORMA').AsInteger;
   sCodTipRecDes    := CdsTipoRD.FieldbyName('CODTIPRECDES').AsString;
   sCodCentroCusto  := '';
   lCodportforma    := CdsPortForma.FieldbyName('CODPORTFORMA').AsInteger;
   iCodTipDoc       := 109;// default 109 relatorios a area faz assim hoje
   iUnidNegoc       := CdsUnidNegoc.FieldbyName('UNIDNEGOC').AsInteger;
            //DadosDocumentos[0].DataProgramada   := dbeDataDisponib.Text;
            //DadosDocumentos[0].UnidNegoc        :=

   { Duvidas }
   iIdPrograma   := CdsProgramaPrev.FieldbyName('IDPROGRAMA').AsInteger;
   // André Pontes - pendência 23230 - 04/09/2006
 //  iIdPatro      := ParamIntegra.PatroGlobal;

   // FIM André Pontes - pendência - 04/09/2006
   iPlnCodigo    := 0;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( ' SELECT C.CODCENTROCUSTO, C.CODCENTRORESPON, C.TIPODOCUMENTOREC' + #13#10 +
                   '  FROM HSTREGULARIZACAOFOLHA H' + #13#10 +
                   ' INNER JOIN ARQUIVODERETORNOCAIXA A' + #13#10 +
                   '    ON (H.IDARQUIVORETORNOCAIXA = A.IDARQUIVORETORNOCAIXA)' + #13#10 +
                   ' INNER JOIN CADASTROEVENTOSDEREGULARIZACAO C' + #13#10 +
                   '    ON (C.IDCADEVENTOSDEREGULARIZACAO = H.IDCADEVENTOSDEREGULARIZACAO)' + #13#10 +
                   ' WHERE A.IDHSTFOLHABENEF =  '+ IntToStr(frmConciliacaoCredito.IdHstFolha) + #13#10 +
                   ' AND   H.IDHSTREGULARIZACAOFOLHA = '+IntToStr(frmConciliacaoCredito.IdHstFolhaIndiv));
   qryAux.Open;

   sCodCentroCusto  := qryAux.FieldByName('CODCENTROCUSTO').AsString;
   sCodCentroResPon := qryAux.FieldByName('CODCENTRORESPON').AsString;
   iCodTipDoc       := qryAux.FieldByName('TIPODOCUMENTOREC').AsInteger;

   qryAux.Close;
   qryAux.Sql.Clear;
   //edilaine - SIG56702 - inicio
   //qryAux.Sql.Add('SELECT H.IDRESPONSAVEL, H.Idplanocontabil, H.IDPATRO,  sum(ValorRecebido) AS VALOR' + #13#10 +
//   qryAux.Sql.Add('SELECT H.IDRESPONSAVEL, PI.IDPLANPREVCONTAB AS Idplanocontabil, H.IDPATRO, sum(ValorRecebido) AS VALOR ' + #13#10 + //Everson TIBERO
 //  qryAux.Sql.Add('SELECT H.IDRESPONSAVEL, PI.IDPLANPREVCONTAB AS Idplanocontabil, H.IDPATRO, sum(H.ValorRecebido) AS VALOR ' + #13#10 + //Everson TIBERO   //Ewerton Beltramini SIG92533
   //edilaine - SIG56702 - fim

        qryAux.Sql.Add('SELECT H.IDRESPONSAVEL,PI.IDPLANPREVCONTAB AS Idplanocontabil,H.IDPATRO, sum(DECODE(PV.FLGDESCONTO,0,H.ValorRecebido,-H.VALORPROVENTO)) AS VALOR' + #13#10 +   //Ewerton Beltramini SIG92533
                  '  FROM HISTRUBSAL H' + #13#10 +
                  '  JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = H.IDPERFILINVEST ' + #13#10 +   //edilaine - SIG56702
                  '  JOIN PROVDESC PV ON PV.IDPROVENTO = H.IDRUBRICA '  + #13#10 +     //Ewerton Beltramini SIG92533
                  ' WHERE H.IDPESSOA        = ' +IntToStr(frmConciliacaoCredito.IdPessoa)+ #13#10 +
                  '   AND H.CODPORTFORMA    = ' +IntToStr(frmConciliacaoCredito.CodConvenio)+ #13#10 +
                  '   AND H.IDHSTFOLHABENEF = '+IntToStr(frmConciliacaoCredito.IdHstFolha)+ #13#10 +
                  '   AND PV.FLGDESCONTO <> 2 ' + #13#10 +  //Ewerton Beltramini SIG92533
                  //' group by H.IDRESPONSAVEL, H.IDPATRO, H.Idplanocontabil ');           //edilaine - SIG56702
                  ' group by H.IDRESPONSAVEL, H.IDPATRO, PI.IDPLANPREVCONTAB ');           //edilaine - SIG56702
   qryAux.Open;
   iIdForCli :=  qryAux.FieldByName('IDRESPONSAVEL').AsInteger;

   qryAux1.Close;
   qryAux1.Sql.Clear;
   qryAux1.Sql.Add(' select 1 from EMPRESACLIENTE e where e.IDFORCLI = '+IntTostr(iIdForCli) );
   qryAux1.Open;

   if (qryAux1.IsEmpty) then
   begin
      MsgDlg('Para fazer o lançamento do Contas a Receber é necessário cadastrar o cliente no módulo Contas a Receber.','Informação',mtInformation,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
      Result := true;
      exit;
   end;
   qryAux1.close;


   //edilaine - SIG90208 - inicio
   sPlaconta  := '';

   qryAux1.Close;
   qryAux1.Sql.Clear;
   qryAux1.Sql.Add('SELECT PLACONTA, PLACONTAPASS  ' + #13#10 +
                   '  FROM TIPORDXCCXCONTA         ' + #13#10 +
                   ' WHERE RECPAG    = ''R''        ' + #13#10 +
                   '   AND IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)  + #13#10 +
                   '   AND IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)  + #13#10 +
                   '   AND RTRIM(CODTIPRECDES)   = '+Quotedstr(sCodTipRecDes)    + #13#10 +
                   '   AND RTRIM(CODCENTROCUSTO) = '+Quotedstr(sCodCentroCusto)  + #13#10 +
                   '   AND IDPLANOPREV           = '+qryAux.FieldByName('IDPLANOCONTABIL').AsString  + #13#10 +
                   '   AND IDPROGRAMA            = '+IntToStr(iIdPrograma)       + #13#10 +
                   ' ORDER BY SUBSTR(PLACONTA, 4, 1) ');
   qryAux1.Open;
   if qryAux1.isEmpty then
   begin
     qryAux1.close;
     qryAux1.Sql.Clear;
     qryAux1.Sql.Add('SELECT PLACONTA, PLACONTAPASS  ' + #13#10 +
                     '  FROM TIPORDXCCXCONTA         ' + #13#10 +
                     ' WHERE RECPAG    = ''R''        ' + #13#10 +
                     '   AND IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)  + #13#10 +
                     '   AND IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)  + #13#10 +
                     '   AND RTRIM(CODTIPRECDES)   = '+Quotedstr(sCodTipRecDes)    + #13#10 +
                     '   AND RTRIM(CODCENTROCUSTO) = '+Quotedstr(sCodCentroCusto)  + #13#10 +
                     '   AND IDPROGRAMA            = '+IntToStr(iIdPrograma)       + #13#10 +
                     '   AND IDPLANOPREV IS NULL ' + #13#10 +
                     ' ORDER BY SUBSTR(PLACONTA, 4, 1) ');
     qryAux1.Open;
     if qryAux1.isEmpty then
     begin
       qryAux1.close;
       qryAux1.Sql.Clear;
       qryAux1.Sql.Add('SELECT PLACONTA, PLACONTACREDITO AS PLACONTAPASS,     ' + #13#10 +
                       '       CODSUBCONTA, CODSUBCONTACRE AS CODSUBCONTAPASS ' + #13#10 +
                       '  FROM TIPORECEBDESEMB                                ' + #13#10 +
                       ' WHERE RECPAG    = ''R''  ' + #13#10 +
                       '   AND IDPESSOA  = '+IntToStr(Sistema.IdEmpresa)  + #13#10 +
                       '   AND RTRIM(CODTIPRECDES) = '+Quotedstr(sCodTipRecDes) );
       qryAux1.Open;
     end;
   end;
   if not qryAux1.isEmpty then
      sPlaconta := qryAux1.Fields[0].AsString;

   qryAux1.Close;
   //edilaine - SIG90208 - fim


   iCodDocumento := CtrlDocumento.GetSequenceDocumento;
   eNoDocumento  := iCodDocumento;
   try
     { DOCUMENTO }
     CtrlDocumento.SetValues(iCodDocumento,               // CODDOCUMENTO
                             eNoDocumento,                // NODOCUMENTO
                             sComplementoDoc,             // COMPLDOCUMENTO
                             '0',                         // STATUS
                             sRecPag,                     // RECPAG
                             '2',                         // SOPERACAO
                             '',                          // SNUMSLIP
                             '',                          // SNUMLEITCODBARRAS
                             sPlaconta {''},              // PLACONTA                 //edilaine SIG90208
                             sCodCentroCusto,             // CODCENTROCUSTO
                             '',                          // NOSSONUMERO
                             '',                          // NUMDIGCODBARRAS
                             '',                          // GRUPODOC
                             '',                          // SFLGEMITELANCBAIX
                             'N',                         // SFLGCONFIRMARECPAG
                             'N',                         // EMISBLOQ
                             sReferencia,                 // REFERENCIA
                             sObs,                        // OBS
                             dtVencimento,                // DATAVENCTO
                             dtEmissao,                   // DATAEMISSAO
                             dtVencimento,                // DATAPROGRAMADA
                             0,                           // DATAREMESSA
                             0,                           // DATALIMITE
                             0,                           // DATACORRECAO
                             0,                           // RVLRMULTA
                             0,                           // RVALORJUROS
                             0,                           // RVALORDESCONTO
                             0,                           // RPERCJUROSSIMPLES
                             0,                           // RPERCJUROSATUARIAL
                             iCodTipDoc,                  // CODTIPDOC
                             Sistema.IdEmpresa,           // IDPESSOA
                             Sistema.IdModulo,            // IDMODULO
                             iIdForCli,                   // LDFORCLI
                             -1,                          // NUMFATURA
                             -1,                          // IDCBANCARIA
                             iUnidNegoc,                  // UNIDNEGOC    // Gleyber - 05/09/2006 - Pendência 23243
                             ParamIntegra.Plano,          // PLANO
                             -1,                          // NUMCPBAIXA
                             -1,                          // NUMAPGR
                              0,                          // MOECODIGO
                             -1,                          // LOTETRANSMISSAO
                             -1,                          // INDICECORRECAO
                             Sistema.IdUsuario,           // IDUSUARIOINCLUSAO
                             Sistema.IdEmpresa,           // IDEMPRESA
                             1,                           // FLGNAOCONCILIADO
                             -1,                          // CONTROLEREMESS,
                             -1,                          // CODSUBCONTA
                             lCodportforma,               // CODPORTFORMA
                             -1,                          // CODGRUPOCNAB
                             -1,                          // CODGERADORINSS
                             iFormaPgto,                  // CODFORMA
                             -1                           // IIDSEGREGACRITER
                           );

   except
     MsgDlg(CtrlDocumento.MessageInfo,'Informação',mtInformation,[mbOk],0);
     Result := true;
     Repaint;
     Abort;
     Exit;
   end;



   { RATEIODOCUM }
   qryAux.First;

   while not(qryAux.eof) do
   begin
     // sCodCentroResPon := qryAux.FieldByName('CODCENTRORESPON').AsString;
      Try
        CtrlDocumento.RateioDocum.SetValues (
          frmConciliacaoCredito.rValor ,       // VALOR
          0,                                         // VALOROM
          0,                                         // VLRRESORCAMEN
          0,                                         // IDRATEIODOCUM
          Sistema.IdEmpresa,                         // IDPESSOA
          iCodDocumento,                             // CODDOCUMENTO
          iUnidNegoc,                                // UNIDNEGOC      // Gleyber - 05/09/2006 - Pendência 23243
          0,                                         // MOECODIGO
          Sistema.IdUsuario,                         // IDUSUARIOINCLUSAO
          0,                                         // IDRESERVAORCAMEN
          ParamIntegra.Plano,                        // PLANO
          qryAux.FieldByName('IDPLANOCONTABIL').AsInteger, // IDPLANOPREV
          qryAux.FieldByName('IDPATRO').AsInteger,   // IDPATRO
          iIdPrograma,                               // IDPROGRAMA
          0,                                         // IDPROCESSO
          Sistema.IdEmpresa,                         // IDEMPRESA
          sCodTipRecDes,                             // CODTIPRECDES
          sRecPag,                                   // RECPAG
          sCodCentroResPon,                          // CODCENTRORESPON
          sCodCentroCusto,                           // CODCENTROCUSTO
          ''                                         // NUMIMOVEL
        );
      Except
        MsgDlg(CtrlDocumento.MessageInfo,'Informação',mtInformation,[mbOk],0);
        Result := true;
        Abort;
        Exit;
      end;
      rValorDocumento := rValorDocumento + qryAux.FieldByName('VALOR').AsFloat;
      qryAux.Next;

   end;
   //rValorDocumento := 0;//CdsDadosRetornoCaixa.FieldByName('VALORPAGAMENTO').AsFloat;

   { LANCTODOCUM }
   Try
     CtrlDocumento.LanctoDocum.SetValues(
       dtVencimento,  {Date,}       // DATALANCTO             //edilaine - SIG90208
       iCodDocumento,               // CODDOCUMENTO
       0,                           // NUMLANCTO
       rValorDocumento,             // VLRLIQUIDO
       0,                           // VALOROM
       rValorDocumento,             // VALOR
       iUnidNegoc,                  // UNIDNEGOC   // Gleyber - 05/09/2006 - Pendência 23243
       iPlnCodigo,                  // LIPLNCODIGO
       -1,                          // NUMLOTEMANUAL
       Sistema.IdUsuario,           // IDUSUARIOINCLusao
       Sistema.IdEmpresa,           // IDPESSOA
       -1,                          // IDNFLIVRO,
       -1,                          // ESTORNO
       iCodTipDoc,                  // CODTIPDOC
       -1,                          // CODDOCINSS
       -1,                          // CODALTERADOR
       '2',                         // OPERACAO
       '',                          // NUMRECIBO
       '',                          // NUMNF
       '',                          // NUMFATURA
       '',                          // HISTORICOCOMPL
       '',                          // FLGTIPOFATURA
       'N',                         // FLGRECEBEUNF
       '',                          // FLGFATEMITIDA
       sDebCre,                     // DEBCRE
       Sistema.IdModulo,            // IDMODULO
       ParamIntegra.Plano,          // PLANOCONTA
       True,                        // USAPLANOPATRO
       True,                        // CONTABILIZA
       lCodportforma,               // ICODPORTFORMA
       0,                           // DIASFLOAT
       '',                          // CONTABAIXA
       0                            // SUBCONTABAIXA
     );

   Except
     MsgDlg(CtrlDocumento.MessageInfo,'Informação',mtInformation,[mbOk],0);
     Result := true;
     Abort;
     Exit;
   end;

   { Inserir Documento }
   if not CtrlDocumento.Insert  then begin
     Result := true;
     MsgDlg(CtrlDocumento.MessageInfo,'Informação',mtInformation,[mbOk],0);
     Exit;
   end;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( ' UPDATE HSTREGULARIZACAOFOLHA A SET CODDOCUMENTOCAR = '+IntToStr(iCodDocumento)+', NODOCUMENTOCAR = '+IntToStr(iCodDocumento)+' WHERE A.CODDOCUMENTOCAR IS NULL AND A.IDARQUIVORETORNOCAIXA = '+IntToStr(frmConciliacaoCredito.IdArquivoRetornoCaixa));
   try
      qryAux.ExecSQL;
   except
      result := true;
   end;

   if (dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.Commit;


   FreeAndNil(ctrlDocumento);
   FreeAndNil(ctrlLancamento);

end;



procedure TfrmLancContasReceber.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaPreenchimento();
end;

procedure TfrmLancContasReceber.LimpaPreenchimento;
begin
   dbeDataEmi.Text := '';
   dblcTipoRD.Text := '';
   CmbPrograma.Text := '';
   dbeDataVenc.Text := '';
   dblcPortadorForma.Text := '';
   cmdbFormaPagamento.Text := '';
   dbeDataDisponib.Text := '';
   dblcUnidNegoc.Text := '';
   mmObservacao.Text := '';
end;

procedure TfrmLancContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmConciliacaoCredito.bControlaTela := false;
end;

end.
