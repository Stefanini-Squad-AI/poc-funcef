{
Nº SOL......: 217428
Nº KINTANA..: 2047290
Data........: 27/09/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290
Descrição...: MovimentaValor
--------------------------------------------------------------------------------------------------
Nº SOL......: 210712
Nº KINTANA..: 2029487
Data........: 05/07/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
Descrição...: MovimentaValor
--------------------------------------------------------------------------------------------------
Nº SOL......: 206429
Nº KINTANA..: 1999836
Data........: 10/05/2013
Responsável.: Marcio Sanches Spinosa SOL 206429 KTN 1999836
Descrição...: MovimentaValor
--------------------------------------------------------------------------------------------------
Nº SOL......: 198384
Nº KINTANA..: 1910061
Data........: 21/02/2013
Responsável.: Edilaine Ferraresi
Descrição...: AtualizaSaldo
{--------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Integração Orçamento - Inclusão das rotinas
{--------------------------------------------------------------------------------------------------
Rotina......: varias
Nº SOL......: 192391
Nº KINTANA..: 1833220
Data........: 30/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: incluindo parâmetro iddespesaorc
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaSaldo, InsereSaldo, varias (comentado GravaLogPLANEORC)
Nº SOL......: 185723
Nº KINTANA..: 1742408
Data........: 26/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: melhor performance da rotina de importação
{ --------------------------------------------------------------------------------------------------
Rotina......: InsereSaldo
Nº SOL......: 185145
Nº KINTANA..: 1736433
Data........: 16/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: salvar parametro referente ao IDDESPESAORC com -1 em vez de nulo
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaSaldo, InsereSaldo
Nº SOL......: 172383-7763
Nº KINTANA..: 1557030
Data........: 12/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão de novo parâmetro: Fornecedor/Sub-Despesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: TCtrlSaldoOrcado.AtualizaSaldo
Nº SOL......: 151878
Nº KINTANA..: 1121523
Data........: 09/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Caso nã informar o campo iIdCriterioRateio, deverá atualizar este campo
              para "null"  no banco de dados para casaso de sobreposição e que não
              seja informado o valor de rateio.    
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150137
Nº KINTANA..: 1087555
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção da Entrada de Dados para o período anual e alteração da busca para
              trazer os resultados agrupado por Grupo/Periodo/Exercício.
---------------------------------------------------------------------------------------------------}
{
Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}
// Alterações:
//  andré tavares - pendência 20107 - 20/10/2005
//implementação importação do orçamento de uma planilha excel

{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSaldoConfirmaClick
Data      : 19/09/2003
Autor     : André Pontes
Pendencia : 15033
Descrição : Pendência ainda incompleta

      - nova:

     function AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                       const pedtCodigoContaText : String;
                                       const iExercicio          : Integer;
                                       const iPeriodoIni         : Integer;
                                       const iPeriodoFim         : Integer
                                      ) : Boolean;

      - antiga:

     function AcertaSaldoConfirmaClick(pIdEmpresa          : Integer;
                                       pedtCodigoContaText,
                                       edtCodigoContaText  : String) : Boolean;

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSaldoConfirmaClick
Data      : 08/12/2004
Autor     : Rodolpho da Silva
Pendencia : 18243
Descrição : Corrigir a qry para acertar valores no saldo

---------------------------------------------------------------------------------------------------}


unit uCtrlSaldoOrcado;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider, StdCtrls,
   ComCtrls, uDbSaldoorcado, uCMTypes, uString, uFuncoesOrcamento, uDtmBuscaContabil,
   uCtrlSaldoorcadoant, uCtrlParamorcamento, uCtrlValorescenario, Classes, udtmAcertaSaldo,
   Controls, uSistema, comObj;

type
   TCtrlSaldoOrcado = class(TCmControlObject)

   protected
     procedure DoChangeDataBase; override;
     procedure OnCreateAppServer;override;
     procedure AfterInitialize;override;

   private
     CtrlValorescenario: TCtrlValoresCenario;
     CtrlSaldoorcadoant: TCtrlSaldoorcadoant;
     CtrlParamorcamento: TCtrlParamorcamento;
     DtmBuscaContabil  : TDtmBuscaContabil;
     DtmAcertaSaldo    : TDtmAcertaSaldo;

     FedtLegenda    : TEdit;
     FedtPosicao    : TEdit;
     FpbAguarde     : TProgressBar;
     FIdEmpresa     : Integer;
     FPlanoOrc      : Integer;

     _dbSaldoorcado    : TdbSaldoorcado;
     FCdsSaldoOrcado   : TClientDataSet;
     FCdsCenario       : TClientDataSet;
     FCdsSaldos        : TClientDataSet;
     FCdsContasOrcamen : TClientDataSet;
     FCdsComposicao    : TClientDataSet;
     FCdsPeriodo       : TClientDataSet;
     FCdsContabilidade : TClientDataSet;
     FCdsAux           : TClientDataSet;
    FbCancelaImportacao: boolean;

     procedure SetCdsSaldoorcado  (const Value: TClientDataSet);
     procedure SetCdsCenario      (const Value: TClientDataSet);
     procedure SetCdsSaldos       (const Value: TClientDataSet);
     procedure SetCdsContasOrcamen(const Value: TClientDataSet);
     procedure SetCdsComposicao   (const Value: TClientDataSet);
     procedure SetCdsPeriodo      (const Value: TClientDataSet);
     procedure SetCdsContabilidade(const Value: TClientDataSet);
     procedure SetCdsAux          (const Value: TClientDataSet);
    procedure SetbCancelaImportacao(const Value: boolean);

   public
     Constructor Create; override;
     Destructor  Destroy;override;

     function AplicaOperacaoSaldoOrcado : Boolean;

     function Procurar(IDPessoa        : Double;
                       IDPlanoorcamen  : Double;
                       IDContaorcamen  : String;
                       DataReferencia  : TDateTime
                       ): OleVariant;

     function AbreCenario : OleVariant;

     function AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                       const pedtCodigoContaText : String;
                                       const iExercicio          : Integer;
                                       const iPeriodoIni         : Integer;
                                       const iPeriodoFim         : Integer
                                       ) : Boolean;

     function  EfetivaClick(pedtCodigoContaText,
                            PedtCodigoContaDeText,
                            pedtCodigoContaParaText,
                            PdblcPeriodoIniText,
                            pEdConteudo1Text,
                            pEdConteudo2Text,
                            pEdConteudo3Text,
                            pEdConteudo4Text : String;
                            psePosIni1Value,
                            psePosIni2Value,
                            psePosIni3Value,
                            psePosIni4Value,
                            psePosFim1Value,
                            psePosFim2Value,
                            psePosFim3Value,
                            psePosFim4Value,
                            pspnedExercicioValue: Double;
                            pdblcPeriodoIniLookupValue,
                            pdblcPeriodoFimLookupValue : String;
                            pcbCenariosChecked,
                            pcbBuscaSaldoAnteriorChecked : Boolean;
                            pdblcPeriodoLimiteText,
                            pdblcPeriodoLimiteLookUpValue : String) : Boolean;

     function IncluirOrcamentoRH(IdEmpresa           : Integer;
                                 IdPlanoOrcamentario : Double;
                                 ContaOrcamentaria   : String;
                                 DataRef             : TDate;
                                 Valor               : Double;
                                 const iIdDespesaOrc : integer = -1 ) : Boolean;  // Edilaine - SOL 192391 / KTN 1833220

     procedure StartTransactionOrc;
     procedure CommitOrc;
     procedure RollBackOrc;

     procedure AtualizaSaldo(idplanoorcamen, idpessoa: integer; idcontaorcamen,
       datareferencia: string; valor: double; bSobescreveSaldo: Boolean = False;
       iIdCriterioRateio: integer = -1;
       const iIdSubDespesa : integer = -1;    // Edilaine - SOL 172383-7763 / KTN 1557030
       const bAtuIdDespesa : boolean = false;  // Edilaine - SOL 172383-7763 / KTN 1557030
       const lstBloco : Tstringlist = nil);     // Edilaine - SOL 185723 / KTN 1742408

     procedure InsereSaldo(exercicio, periodo : Integer; idplanoorcamen,
       idpessoa : Double; idcontaorcamen, datareferencia: string; vlrorcado,
       vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum,
       vlrrealacum: double;
       iIdCriterioRateio: integer = -1;
       const iIdSubDespesa : integer = -1; // Edilaine - SOL 172383-7763 / KTN 1557030
       const lstBloco : Tstringlist = nil);     // Edilaine - SOL 185723 / KTN 1742408

     procedure TrocaSaldoReservadopCompromissado(pValorRes,
       pValorCom: double; idpessoa, idplanoorcamen: integer; datareferencia,
       idcontaorcamen: string);

     procedure RetiraValor(valorreserva: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen,
       flgvalor: string);

     procedure AltSaldos(valor, valorreserva: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen, sfield,
       flgrescomp: string);

     procedure EstornaSaldo(idpessoa, idplanoorcamen: integer; datareferencia,
       idcontaorcamen, sfield: string; valor: double); 

     procedure AltSaldos2(valorrealizado, valororcado: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen: string); 

     procedure InsereEspecial(idcriterioratorc, idplanoorcamen, exercicio,
       periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
       vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
       percutilrateio: double;
       const iIdDespesaOrc : integer = -1);  // Edilaine - SOL 192391 / KTN 1833220

     procedure AltEspecial(idcriterioratorc, idplanoorcamen, idpessoa: integer;
       idcontaorcamen, datareferencia: string; vlrorcado, vlrrateioori,
       vlrorcacum, percutilrateio: double);

     procedure ZeraSaldo(idpessoa: integer; idcontaorcamen: string);

     procedure AcertaValor(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia, campo: string; valor: double);

     procedure InsereValor(idpessoa, idplanoorcamen, exercicio,
       periodo: integer; idcontaorcamen,datareferencia, campo: string;
       valor: double;
       const iIdDespesaOrc : integer = -1);  // Edilaine - SOL 192391 / KTN 1833220

     procedure AltSaldos3(idpessoa, exercicio, periodoini, periodofim: integer;
       vlrorcado, vlrorcacum: double);

     procedure AltSaldos4(idpessoa, idplanoorcamen: Double; idcontaorcamen,
       datareferencia: string; vlrorcado, vlrorcacum: double); 

     procedure AltVlrorcado(idpessoa, exercicio, periodoini,
       periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
       vlrorcado: double);

     function  AltSaldos5(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia: string; vlrorcado, vlrorcacum: double) : Boolean;  

     procedure AltValoresGD(idplanoorcamen, exercicio, idpessoa: integer;
       dataini, datafim, conteudo1: string; vlrorcado, vlrorcacum: double);

     procedure AltValoresRealGD(idplanoorcamen, exercicio, idpessoa: integer;
       dataini, datafim, conteudo1: string; vlrrealizado, vlrrealacum: double);

     procedure AtualizaVlrReservado(idplanoorcamen, idpessoa: integer;
       idcontaorcamen, datareferencia: string; valor: double);

     procedure AltSaldos6(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia: string; vlrrealizado, vlrrealacum: double);

     procedure GravaOrc  (rValor                  : Double;
                          dDataCorrente           : TDateTime;
                          iPeriodo,
                          iExercicio              : Integer;
                          bGeraResult             : Boolean;
                          pcbCenariosChecked      : Boolean;
                          pedtCodigoContaDeText,
                          pedtCodigoContaParaText,
                          pedtCodigoContaText     : String);

     procedure CmeCadastroDelete(var pMensagem            : String;
                                     pdbeContaOrigemtext,
                                     pdbeContaDestinoText,
                                     psDataOri,
                                     psDataRef            : String;
                                     prValorTransf        : Real);

     Function ImportaPlanilha(const sNomeArquivo   : String;
                              const ilinhaIni      : integer;
                              const sColCodContaOrc: string;
                              const sColPeriodo1    : string;
                              const sColPeriodo2    : string;
                              const sColPeriodo3    : string;
                              const sColPeriodo4    : string;
                              const sColPeriodo5    : string;
                              const sColPeriodo6    : string;
                              const sColPeriodo7    : string;
                              const sColPeriodo8    : string;
                              const sColPeriodo9    : string;
                              const sColPeriodo10   : string;
                              const sColPeriodo11   : string;
                              const sColPeriodo12   : string;
                              const iExercicio      : integer;
                              const iIdpessoa       : integer;
                              const iIdplanoOrcamen : integer;
                              const idUsuario       : integer): oleVariant;

      function Exclui(const sidcontaOrcamen : string;
                      const iPeriodo         : integer;
                      const iExercicio      : integer;
                      const iIdpessoa       : integer;
                      const iIdplanoOrcamen : integer
                     ): Boolean;

      //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      Procedure SetValueField(AFIELD          : String;
                              AVALOR          : Double;
                              //Abaixo a PK
                              AIDPESSOA       : Double;
                              AIDPLANOORCAMEN : Double;
                              AIDCONTAORCAMEN : String;
                              ADATAREFERENCIA : TDateTime;
                              ACHAVEAUX       : Double;
                              AIncValue       : Boolean = False;
                              ADecValue       : Boolean = False
                             );
      Procedure MovimentaValor(AFieldOrigem    : String;
                               AFieldDestino   : String;
                               AVALOR          : Double;
                               //Abaixo a PK
                               AIDPESSOA       : Double;
                               AIDPLANOORCAMEN : Double;
                               AIDCONTAORCAMEN : String;
                               ADATAREFERENCIA : TDateTime;
                               ACHAVEAUX       : Double;
                               IDDESPESAORC    : INTEGER = 0;
                               PFLAGCOMPROMISSO: string = 'E' //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290
                               );
      //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

      property edtLegenda        : TEdit           read FedtLegenda        write FedtLegenda;
      property edtPosicao        : TEdit           read FedtPosicao        write FedtPosicao;
      property pbAguarde         : TProgressBar    read FpbAguarde         write FpbAguarde;
      property IdEmpresa         : Integer         read FIdEmpresa         write FIdEmpresa;
      property PlanoOrc          : Integer         read FPlanoOrc          write FPlanoOrc;

      property CdsSaldoorcado    : TClientDataSet  read FCdsSaldoorcado    write SetCdsSaldoorcado;
      property CdsCenario        : TClientDataSet  read FCdsCenario        write SetCdsCenario;
      property CdsSaldos         : TClientDataSet  read FCdsSaldos         write SetCdsSaldos;
      property CdsContasOrcamen  : TClientDataSet  read FCdsContasOrcamen  write SetCdsContasOrcamen;
      property CdsComposicao     : TClientDataSet  read FCdsComposicao     write SetCdsComposicao;
      property CdsPeriodo        : TClientDataSet  read FCdsPeriodo        write SetCdsPeriodo;
      property CdsContabilidade  : TClientDataSet  read FCdsContabilidade  write SetCdsContabilidade;
      property CdsAux            : TClientDataSet  read FCdsAux            write SetCdsAux;

      property bCancelaImportacao : boolean read FbCancelaImportacao write SetbCancelaImportacao;
   end;

implementation

procedure TCtrlSaldoOrcado.DoChangeDataBase;
begin
   inherited;
   _dbSaldoorcado.DatabaseName := DataBaseName;
end;



procedure TCtrlSaldoOrcado.OnCreateAppServer;
begin
  inherited;

  edtLegenda        := TEdit.Create(nil);
  edtPosicao        := TEdit.Create(nil);
  pbAguarde         := TProgressBar.Create(nil);

  FCdsCenario       := TClientDataSet.Create(nil);
  FCdsSaldos        := TClientDataSet.Create(nil);
  FCdsContasOrcamen := TClientDataSet.Create(nil);
  FCdsComposicao    := TClientDataSet.Create(nil);
  FCdsPeriodo       := TClientDataSet.Create(nil);
  FCdsContabilidade := TClientDataSet.Create(nil);
  FCdsAux           := TClientDataSet.Create(nil);
end;

Constructor TCtrlSaldoOrcado.Create;
begin
  inherited;

  DtmBuscaContabil   := TDtmBuscaContabil.Create(nil);
  DtmAcertaSaldo     := TDtmAcertaSaldo.Create(nil);

  CtrlValorescenario := TCtrlValorescenario.Create;
  CtrlSaldoorcadoant := TCtrlSaldoorcadoant.Create;
  CtrlParamOrcamento := TCtrlParamOrcamento.Create;

  FCdsSaldoorcado   := TClientDataSet.Create(nil);
  _dbSaldoorcado    := TdbSaldoorcado.Create(Self);

end;

Destructor TCtrlSaldoOrcado.Destroy;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( _dbSaldoorcado );
  FreeAndNil( DtmBuscaContabil );
  FreeAndNil( DtmAcertaSaldo );
  FreeAndNil( CtrlValorescenario );
  FreeAndNil( CtrlSaldoorcadoant );
  FreeAndNil( CtrlParamOrcamento );
  FreeAndNil( FCdsSaldoorcado );

  if isAppServer then
  begin

    edtLegenda.Free;
    edtPosicao.Free;
    pbAguarde.Free;

    FreeCds([FCdsSaldoorcado, FCdsCenario, FCdsSaldos, FCdsContasOrcamen,
      FCdsComposicao, FCdsPeriodo, FCdsContabilidade, FCdsAux]);
  end;

  inherited;
end;



procedure TCtrlSaldoOrcado.AfterInitialize;
begin
   inherited;

   CtrlValorescenario.InitializeAs(Self);
   CtrlSaldoorcadoant.InitializeAs(Self);
   CtrlParamOrcamento.InitializeAs(Self);
end;



function TCtrlSaldoOrcado.AplicaOperacaoSaldoOrcado: Boolean;
begin
   if ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoSaldoorcado(FCdsSaldoorcado.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsSaldoorcado,_DbSaldoorcado,[],[]);

         if not Result then
           begin
             MessageInfo := _DbSaldoorcado.MessageInfo;
             Abort;
           end
         else
           begin
             Commit;

             // Edilaine - SOL 185723 / KTN 1742408
             {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
             // Marcio Motta - 19095 - 09/05/2005
             GravaLogPLANEORC('uCtrlSaldoOrcado.AplicaOperacaoSaldoOrcado' ,
                              Sistema.IdModulo,
                              Sistema.IdUsuario);
             // Fim..............................
             } // Edilaine - SOL 185723 / KTN 1742408
             
           end;
      except
         On E:exception do begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         end;
      end;
   end;
end;



function TCtrlSaldoOrcado.Procurar(IDPessoa        : Double;
                                   IDPlanoorcamen  : Double;
                                   IDContaorcamen  : String;
                                   DataReferencia  : TDateTime
                                  ): OleVariant;
begin
   _DbSaldoorcado.Idpessoa.AsFloat          := idpessoa;
   _DbSaldoorcado.Idplanoorcamen.AsFloat    := idplanoorcamen;
   _DbSaldoorcado.Idcontaorcamen.AsString   := idcontaorcamen;
   _DbSaldoorcado.Datareferencia.AsDateTime := datareferencia;

   Result := GetDataPacket(_DbSaldoorcado.SSqlSelect);
end;


procedure TCtrlSaldoOrcado.AtualizaSaldo(idplanoorcamen, idpessoa: integer;
  idcontaorcamen, datareferencia: string; valor: double; bSobescreveSaldo: Boolean;
  iIdCriterioRateio: integer;
  const iIdSubDespesa : integer; const bAtuIdDespesa : boolean;    // Edilaine - SOL 172383-7763 / KTN 1557030
  const lstBloco : Tstringlist);   // Edilaine - SOL 185723 / KTN 1742408
var
  sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ';

   if bSobescreveSaldo then
     sSql := sSql + '   VLRORCADO = ' + TrocaVPP(FloatToStr(valor))
   else
     sSql := sSql + '   VLRORCADO = NVL(VLRORCADO,0) + ' + TrocaVPP(FloatToStr(valor));

   //Ricardo SOL 151878 KINTANA 1121523 - COMENTADO
   {if iIdCriterioRateio <> -1 then
     sSql := sSql + ' , IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio) + ' ';}

   //Ricardo SOL 151878 KINTANA 1121523
   if iIdCriterioRateio > 0 then
     sSql := sSql + ' , IDCRITERIORATORC = ' + IntToStr(iIdCriterioRateio) + ' '
   else
     sSql := sSql + ' , IDCRITERIORATORC = ' + 'null' + ' ';
   //Ricardo SOL 151878 KINTANA 1121523 - FIM

   // Edilaine - SOL 172383-7763 / KTN 1557030
   if (bAtuIdDespesa) then
     sSql := sSql + ' , IDDESPESAORC = ' + IntToStr(iIdSubDespesa) + ' '
   else
     sSql := sSql + ' , IDDESPESAORC = IDDESPESAORC ';
   // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

   sSql := sSql +
           ' WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';

   // Edilaine - SOL 198384 / KTN 1910061 - comentado
   // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
   {if (bAtuIdDespesa) and (iIdSubDespesa > 0) then
      sSql := sSql + '   AND (IDDESPESAORC = -1)'
   else if (not bAtuIdDespesa) then
      sSql := sSql + '   AND IDDESPESAORC = ' + IntToStr(iIdSubDespesa);
   } // Edilaine - SOL 198384 / KTN 1910061 - fim

   // Edilaine - SOL 198384 / KTN 1910061
   sSql := sSql + '   AND IDDESPESAORC = DECODE(IDDESPESAORC, '+IntToStr(iIdSubDespesa)+', '+IntToStr(iIdSubDespesa)+', -1)';


   if lstBloco <> nil then    // Edilaine - SOL 185723 / KTN 1742408
      lstBloco.Add(sSql+';')      // Edilaine - SOL 185723 / KTN 1742408
   else
      ExecSQL(sSql);

   // Edilaine - SOL 185723 / KTN 1742408
   {comentar o código abaixo pq o log foi tratado via trigger  TUSALDOORCADO
   GravaLogPLANEORC('uCtrlSaldoOrcado.AtualizaSaldo: Conta nº ' + IdContaOrcamen,
                     Sistema.IdModulo,
                     Sistema.IdUsuario);
   } // Edilaine - SOL 185723 / KTN 1742408 - FIM

end;

procedure TCtrlSaldoOrcado.InsereSaldo(exercicio, periodo : Integer; idplanoorcamen,
  idpessoa: Double; idcontaorcamen, datareferencia: string; vlrorcado,
  vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum, vlrrealacum: double;
  iIdCriterioRateio: integer = -1;
  const iIdSubDespesa : integer = -1; // Edilaine - SOL 172383-7763 / KTN 1557030
  const lstBloco : TStringList = nil);  // Edilaine - SOL 185723 / KTN 1742408
var sSQl : String;
begin
   sSql := 'INSERT INTO ' +
           '   SALDOORCADO ' +
           '   (IDCONTAORCAMEN, IDPESSOA, IDPLANOORCAMEN, DATAREFERENCIA,' +
           '    EXERCICIO, PERIODO, VLRREALIZADO, VLRORCADO, VLRRESERVADO,' +
           '    VLRCOMPROMETIDO, VLRORCACUM, VLRREALACUM, IDCRITERIORATORC, ' +
           '    IDDESPESAORC) ' +  // Edilaine - SOL 172383-7763 / KTN 1557030
           'VALUES ' +
           '   (' + QuotedStr(idcontaorcamen) + ', ' + FloatToStr(idpessoa) + ', ' +
           FloatToStr(idplanoorcamen) + ', TO_DATE(''' + datareferencia + ''', ''DD/MM/YYYY''), ' +
           IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
           TrocaVPP(FloatToStr(vlrrealizado)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
           TrocaVPP(FloatToStr(vlrreservado)) + ', ' +
           TrocaVPP(FloatToStr(vlrcomprometido)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
           TrocaVPP(FloatToStr(vlrrealacum));

           if iIdCriterioRateio <> -1 then
              sSQl := sSQl + ',' + IntToStr(iIdCriterioRateio)
           else
              sSQl := sSQl + ',null';

           // Edilaine - SOL 172383-7763 / KTN 1557030
           if iIdSubDespesa <> -1 then
              sSQl := sSQl + ',' + IntToStr(iIdSubDespesa)
           else
              sSQl := sSQl + ',-1'; // Edilaine - SOL 185145 / KTN 1736433
           // Edilaine - SOL 172383-7763 / KTN 1557030 - fim

           sSQl := sSQl + ')';

   if lstBloco <> nil then    // Edilaine - SOL 185723 / KTN 1742408
      lstBloco.Add(sSql+'; ')      // Edilaine - SOL 185723 / KTN 1742408
   else
      ExecSQL(sSql);

   // Edilaine - SOL 185723 / KTN 1742408
   {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
   // Marcio Motta - 19095 - 09/05/2005
   GravaLogPLANEORC('uCtrlSaldoOrcado.InsereSaldo: Conta nº ' + IdContaOrcamen + ' - ' +
                    'VlrOrcado = '       + FloatToStr(vlrorcado) + ' - ' +
                    'VlrRealizado = '    + FloatToStr(vlrrealizado) + ' - ' +
                    'VlrReservado = '    + FloatToStr(vlrreservado) + ' - ' +
                    'VlrComprometido = ' + FloatToStr(vlrcomprometido) + ' - ' +
                    'VlrOrcAcum = '      + FloatToStr(vlrorcacum) + ' - ' +
                    'VlrRealAcum = '     + FloatToStr(vlrrealacum),
                     Sistema.IdModulo,
                     Sistema.IdUsuario);
   // Fim..............................
   } // Edilaine - SOL 185723 / KTN 1742408 - FIM

end;

procedure TCtrlSaldoOrcado.TrocaSaldoReservadopCompromissado(pValorRes,
  pValorCom: double; idpessoa, idplanoorcamen: integer; datareferencia,
  idcontaorcamen: string);
var sSQl : String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' +
          '  VLRRESERVADO    = (NVL(VLRRESERVADO,0) - ' +    TrocaVPP(FloatToStr(pValorRes)) + '), ' +
          '  VLRCOMPROMETIDO = (NVL(VLRCOMPROMETIDO,0) + ' + TrocaVPP(FloatToStr(pValorCom)) + ') ' +
          'WHERE  ' +
          '  (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND ' +
          '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.TrocaSaldoReservadopCompromissado: Conta nº ' + IdContaOrcamen + ' - ' +
                   'VlrReservado = '       + FloatToStr(pValorRes) + ' - ' +
                   'VlrCompromissado = '    + FloatToStr(pValorCom),
                    Sistema.IdModulo,
                    Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim
end;

procedure TCtrlSaldoOrcado.RetiraValor(valorreserva: double; idpessoa,
  idplanoorcamen: integer; datareferencia, idcontaorcamen, flgvalor: string);
var sSQl : string;
begin

  Case flgvalor[1] of
    'C' :  begin
           sSql := 'UPDATE SALDOORCADO SET VLRCOMPROMETIDO = (NVL(VLRCOMPROMETIDO,0) - ' +
                  TrocaVPP(FloatToStr(valorreserva)) + ') ' +
                  ') WHERE ' +
                  '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
                  '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
                  ''',''DD/MM/YYYY'')) AND ' +
                  '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
                  '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
           end;

    'R' : sSql := 'UPDATE SALDOORCADO SET VLRRESERVADO = NVL(VLRRESERVADO,0) - ' +
                  TrocaVPP(FloatToStr(valorreserva)) + ') WHERE ' +
                  '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
                  '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
                  ''',''DD/MM/YYYY'')) AND ' +
                  '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
                  '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';

  end;
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.RetiraValor: Conta nº ' + IdContaOrcamen + ' - ' +
                   'FlgResComp = ' + flgvalor + ' - ' +
                   'Valor = '      + FloatToStr(valorreserva),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.EstornaSaldo(idpessoa,
                                         idplanoorcamen : Integer;
                                         datareferencia,
                                         idcontaorcamen,
                                         sfield         : String;
                                         valor          : Double);
var
  sSQl : String;
begin
  sSql := 'UPDATE'                                                                       + #13 + #10 +
          '  SALDOORCADO'                                                                + #13 + #10 +
          'SET'                                                                          + #13 + #10 +
          '  ' + sfield + ' = ' + '(NVL(' + sfield + ',0) - ' + TrocaVPP(FloatToStr(valor)) + ')' + #13 + #10 +
          'WHERE'                                                                        + #13 + #10 +
          '  (IDPESSOA       = ' + IntToStr(idpessoa) + ') AND '                         + #13 + #10 +
          '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND ' + #13 + #10 +
          '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND '                   + #13 + #10 +
          '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.EstornaSaldo: Conta nº ' + IdContaOrcamen + ' - ' +
                   'Valor = ' + FloatToStr(valor) + ' - ' +
                   'Field = ' + sfield,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltSaldos(valor,
                                      valorreserva    : Double;
                                      idpessoa,
                                      idplanoorcamen  : Integer;
                                      datareferencia,
                                      idcontaorcamen,
                                      sfield,
                                      flgrescomp      : String);
var sSQl: String;
begin
  sSql := 'UPDATE'                + #13 + #10 +
          '  SALDOORCADO'         + #13 + #10 +
          'SET '+ #13 + #10 +
          '  ' +  sfield + ' = ' + '(NVL(' + sfield + ',0) - '  + TrocaVPP(FloatToStr(valor)) + ') '+ #13 + #10;

  if flgrescomp = 'C' then begin
    sSql := sSql + ', VLRRESERVADO = (NVL(VLRRESERVADO,0) + ' + TrocaVPP(FloatToStr(valorreserva)) + ') '+ #13 + #10;
  end;

  sSql := sSql + 'WHERE'           + #13 + #10 +
                 '  (IDPESSOA       = ' + IntToStr(idpessoa) + ') AND'+ #13 + #10 +
                 '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND '+ #13 + #10 +
                 '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND '+ #13 + #10 +
                 '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos: Conta nº ' + IdContaOrcamen + ' - ' +
                   'DataReferencia = ' + DataReferencia + ' - ' +
                   'Valor = ' + FloatToStr(valor) + ' - ' +
                   'Valor Reserva = ' + FloatToStr(valorreserva) + ' - ' +
                   'Field = ' + sfield + ' - ' +
                   'FlgResComp = ' + flgrescomp ,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltSaldos2(valorrealizado,
                                      valororcado     : Double;
                                      idpessoa,
                                      idplanoorcamen  : Integer;
                                      datareferencia,
                                      idcontaorcamen  : String);
var
  sSQl : String;

begin
  sSql := 'UPDATE'        + #13 + #10 +
          '  SALDOORCADO' + #13 + #10 +
          'SET'           + #13 + #10 +
          '  VLRREALIZADO = ' + TrocaVPP(FloatToStr(valorrealizado)) + ','+ #13 + #10 +
          '  VLRORCADO    = ' + TrocaVPP(FloatToStr(valororcado))    + #13 + #10 +
          'WHERE'         + #13 + #10 +
          '  (IDCONTAORCAMEN  = ' + QuotedStr(idcontaorcamen) + ') AND' + #13 + #10 +
          '  (IDPESSOA        = ' + IntToStr(idpessoa)          + ') AND' + #13 + #10 +
          '  (IDPLANOORCAMEN  = ' + IntToStr(idplanoorcamen)    + ') AND' + #13 + #10 +
          '  (DATAREFERENCIA  = TO_DATE(' + QuotedStr(datareferencia) + ',''DD/MM/YYYY''))';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos2: Conta nº ' + IdContaOrcamen + ' - ' +
                   'DataReferencia = ' + DataReferencia + ' - ' +
                   'ValorOrcado = ' + FloatToStr(valororcado) + ' - ' +
                   'ValorRealizado = ' + FloatToStr(valorrealizado),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltSaldos3(idpessoa, exercicio, periodoini,
  periodofim: integer; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos3: ' + ' - ' +
                   'ValorOrcado = '  + FloatToStr(vlrorcado) + ' - ' +
                   'ValorOrcAcum = ' + FloatToStr(vlrorcacum),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltSaldos4(idpessoa, idplanoorcamen: Double;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = NVL(VLRORCADO,0) + ' +
          TrocaVPP(FloatToStr(vlrorcado)) +
          ', VLRORCACUM = NVL(VLRORCACUM,0) + ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos4: Conta nº ' + IdContaOrcamen + ' - ' +
                   'DataReferencia = ' + DataReferencia + ' - ' +
                   'ValorOrcado = '  + FloatToStr(vlrorcado) + ' - ' +
                   'ValorOrcAcum = ' + FloatToStr(vlrorcacum),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

function TCtrlSaldoOrcado.AltSaldos5(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double) : Boolean;
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  Result := ExecSQL(sSql, True);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos5: Conta nº ' + IdContaOrcamen + ' - ' +
                   'DataReferencia = ' + DataReferencia + ' - ' +
                   'ValorOrcado = '  + FloatToStr(vlrorcado) + ' - ' +
                   'ValorOrcAcum = ' + FloatToStr(vlrorcacum),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltSaldos6(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrrealizado, vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ', VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltSaldos3: Conta nº ' + IdContaOrcamen + ' - ' +
                   'DataReferencia = ' + DataReferencia + ' - ' +
                   'ValorRealizado = '  + FloatToStr(vlrrealizado) + ' - ' +
                   'ValorRealAcum = ' + FloatToStr(vlrrealacum),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.InsereEspecial(idcriterioratorc, idplanoorcamen,
  exercicio, periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
  vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
  percutilrateio: double;
  const iIdDespesaOrc : integer);  // Edilaine - SOL 192391 / KTN 1833220

var
  sSQl,
  pCriterioLocal : String;
begin

  if (idcriterioratorc = 0) then begin

    pCriterioLocal := ' NULL ';
  end else begin

    pCriterioLocal := FloatToStr(idcriterioratorc);
  end;

  sSql := 'INSERT INTO SALDOORCADO (IDCRITERIORATORC, IDCONTAORCAMEN, ' +
          'IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDPESSOA, ' +
          'VLRREALIZADO, VLRORCADO, VLRRATEIOORI, VLRREALACUM, VLRORCACUM, ' +
          'PERCUTILRATEIO, IDDESPESAORC) VALUES (' + pCriterioLocal + ', ''' +    // Edilaine - SOL 192391 / KTN 1833220
          Trim(idcontaorcamen) + ''', ' + FloatToStr(idplanoorcamen) +
          ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
          IntToStr(idpessoa) + ', ' + TrocaVPP(FloatToStr(vlrrealizado)) +
          ', ' + TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ', ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ', ' +
          IntToStr(iIdDespesaOrc) + ')';                                          // Edilaine - SOL 192391 / KTN 1833220
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.InsereEspecial: Conta nº ' + IdContaOrcamen,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltEspecial(idcriterioratorc, idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; vlrorcado,
  vlrrateioori, vlrorcacum, percutilrateio: double);
var
  sSQl,
  pCriterioLocal : String;
begin

  if (idcriterioratorc = 0) then begin

    pCriterioLocal := ' NULL ';
  end else begin

    pCriterioLocal := FloatToStr(idcriterioratorc);
  end;

  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRRATEIOORI = ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', PERCUTILRATEIO = ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ', IDCRITERIORATORC = ' +
          pCriterioLocal + ' WHERE (IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          Trim(idcontaorcamen) + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          Trim(datareferencia) + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltEspecial: Conta nº ' + IdContaOrcamen,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.ZeraSaldo(idpessoa: integer; idcontaorcamen: string);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRRESERVADO = 0, VLRCOMPROMETIDO = 0 ' +
          'WHERE (IDPESSOA = ' + IntToStr(idpessoa) + idcontaorcamen;
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AcertaValor(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia, campo: string; valor: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' + campo + ' = NVL(' + campo + ',0) + ' +
          TrocaVPP(FloatToStr(valor)) + ' WHERE (IDPESSOA = ' +
          IntToStr(idpessoa) +  ') AND (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY''))'; 
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.InsereValor(idpessoa, idplanoorcamen, exercicio,
  periodo: integer; idcontaorcamen, datareferencia, campo: string;
  valor: double;
  const iIdDespesaOrc : integer);  // Edilaine - SOL 192391 / KTN 1833220
var sSQl: String;
begin
  // 1) Se o Campo recebido como parâmetro for VLRRESERVADO
  //    insere valor zero no campo VLRCOMPROMETIDO;
  //
  // 2) Se o Campo recebido como parâmetro for VLRCOMPROMETIDO
  //    insere valor zero no campo VLRRESERVADO;
  //
  // 3) Senão, grava somente o valor no campo passado como parâmetro

  if Campo = 'VLRRESERVADO' then
    sSql := 'INSERT INTO SALDOORCADO(' + campo + ', VLRCOMPROMETIDO, IDPESSOA, IDPLANOORCAMEN, ' +
            'IDCONTAORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDDESPESAORC) VALUES(' +   // Edilaine - SOL 192391 / KTN 1833220
            TrocaVPP(FloatToStr(valor)) + ', 0,' + IntToStr(idpessoa) +
            ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
            ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
            IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' + IntToStr(iIdDespesaOrc) + ')' // Edilaine - SOL 192391 / KTN 1833220
  else
    if Campo = 'VLRCOMPROMETIDO' then
      sSql := 'INSERT INTO SALDOORCADO(' + campo + ', VLRRESERVADO, IDPESSOA, IDPLANOORCAMEN, ' +
              'IDCONTAORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDDESPESAORC) VALUES(' +   // Edilaine - SOL 192391 / KTN 1833220
              TrocaVPP(FloatToStr(valor)) + ', 0,' + IntToStr(idpessoa) +
              ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
              ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
              IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' + IntToStr(iIdDespesaOrc) + ')' // Edilaine - SOL 192391 / KTN 1833220
    else
      sSql := 'INSERT INTO SALDOORCADO(' + campo + ', IDPESSOA, IDPLANOORCAMEN, ' +
              'IDCONTAORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDDESPESAORC) VALUES(' +   // Edilaine - SOL 192391 / KTN 1833220
              TrocaVPP(FloatToStr(valor)) + ', ' + IntToStr(idpessoa) +
              ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
              ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
              IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' + IntToStr(iIdDespesaOrc) + ')'; // Edilaine - SOL 192391 / KTN 1833220

  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.InsereValor: Conta nº ' + IdContaOrcamen + ' - ' +
                   'Campo: ' + Campo + ' - ' +
                   'Valor = ' + FloatToStr(Valor),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltVlrorcado(idpessoa, exercicio, periodoini,
  periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
  vlrorcado: double);
var sSql: string;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ')' + conteudo1 + conteudo2 + conteudo3 +
          conteudo4 + ' AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltVlrorcado',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltValoresGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrorcado,
  vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + '0, VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltValoresGD',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AltValoresRealGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrrealizado,
  vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ' , VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
  GravaLogPLANEORC('uCtrlSaldoOrcado.AltValoresRealGD',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.AtualizaVlrReservado(idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; valor: double);
var sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ' +
           '   VLRRESERVADO = NVL(VLRRESERVADO,0) + ' +
           TrocaVPP(FloatToStr(valor)) + ' ' +
           'WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';
   ExecSQL(sSql);

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
   GravaLogPLANEORC('uCtrlSaldoOrcado.AtualizaVlrReservado: ' + ' - ' +
                    'Conta = ' + idcontaorcamen + ' - ' +
                    'DataReferencia = ' + datareferencia + ' - ' +
                    'Valor = ' + FloatToStr(valor),
                    Sistema.IdModulo,
                    Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

end;

procedure TCtrlSaldoOrcado.GravaOrc(rValor                  : Double;
                                     dDataCorrente           : TDateTime;
                                     iPeriodo,
                                     iExercicio              : Integer;
                                     bGeraResult             : Boolean;
                                     pcbCenariosChecked      : Boolean;
                                     pedtCodigoContaDeText,
                                     pedtCodigoContaParaText,
                                     pedtCodigoContaText     : String);
var
  rValResult   : Double;
  sContaResult,
  Condicoes    : String;

begin
  if pcbCenariosChecked then begin

    cdsCenario.First;

    while (not cdsCenario.EOF) And
          (edtLegenda.Tag <> -1)     do begin

      rValResult := 0;
      cdsSaldos.Close;
      condicoes := '  (IDPLANOORCAMEN = '   + IntToStr(PlanoOrc) + ') AND '                                      + #13 + #10 +
                   '  (IDCONTAORCAMEN = ''' + cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString + ''') AND '       + #13 + #10 +
                   '  (IDCENARIOORCAMEN = ' + IntToStr(cdsCenario.FieldByName ('IDCENARIOORCAMEN').AsInteger) + ') AND ' + #13 + #10;

      if iPeriodo = 0 then begin
        condicoes := condicoes + '  (PERIODO IS NULL) AND ' + #13 + #10;
      end else begin
        condicoes := condicoes + '  (PERIODO = ' + IntToStr(iPeriodo) + ') AND ' + #13 + #10;
      end;
      condicoes := condicoes + '  (EXERCICIO = ' + IntToStr(iExercicio) + ') AND' + #13 + #10 +
                               '  (IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + #13 + #10;

      CdsSaldos.Close;
      CtrlValorescenario.CdsValorescenario.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString    := 'IDVALORESCENARIO, IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ' +
                                             'PERIODO,          IDPESSOA,       VLRORCCENARIO,  IDCENARIOORCAMEN';
        ParamByName('TABELAS').AsString   := 'VALORESCENARIO';
        ParamByName('CONDICOES').Asstring := condicoes;
        CtrlValorescenario.CdsValorescenario.Data := Data;
      end;

      with CtrlValorescenario.CdsValorescenario do begin

        if (IsEmpty) then begin
          //Se não existir insere o novo registro

          Insert;
          FieldByName('IDCONTAORCAMEN').AsString  := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString;
          FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
          FieldByName('EXERCICIO').AsInteger      := iExercicio;
          FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
          FieldByName('VLRORCCENARIO').AsFloat    := rValor;
          FieldByName('IDCENARIOORCAMEN').AsFloat := cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger;
          FieldByName('PERIODO').AsInteger        := iPeriodo;

        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCCENARIO').AsFloat    := rValor
        end;
        Post;
      end;
      CtrlValorescenario.AplicaOperacaoValoresCenario;

      if (bGeraResult) and (rValResult <> 0) then begin
        if cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString = pedtCodigoContaDeText then
          sContaResult := pedtCodigoContaParaText
        else
          sContaResult := pedtCodigoContaText;

 
        cdsSaldos.Close;
        CtrlValorescenario.CdsValorescenario.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          ParamByName('CAMPOS').AsString := 'IDVALORESCENARIO';
          ParamByName('TABELAS').AsString := 'VALORESCENARIO';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (IDCENARIOORCAMEN = ' +
                    IntToStr(cdsCenario.FieldByName
                    ('IDCENARIOORCAMEN').AsInteger) +
                    ') AND (PERIODO IS NULL) AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CtrlValorescenario.CdsValorescenario.Data := Data;
        end;

        with CtrlValorescenario.CdsValorescenario do begin

          if (IsEmpty) then begin
            //Se não existir insere o novo registro

            Insert;
            FieldByName('IDCONTAORCAMEN').AsString  := sContaResult;
            FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
            FieldByName('EXERCICIO').AsInteger      := iExercicio;
            FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
            FieldByName('IDCENARIOORCAMEN').AsFloat := cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger;
            FieldByName('PERIODO').AsInteger        := 0;

            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult;
            end else begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult*-1;
            end;
          end else begin

            Edit;
            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult;
            end else begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult*-1;
            end;
          end;
          Post;
        end;
        CtrlValorescenario.AplicaOperacaoValoresCenario;
      end;
      cdsCenario.Next;

      if (edtLegenda.Tag = -1) then abort;
    end;
  end else begin
    if iPeriodo = 0 then begin
      rValResult := 0;
    
      CdsSaldos.Close;
      CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString := 'IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, IDPESSOA, VLRORCADO, VLRREALIZADO';
        ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString +
                    ''') AND (EXERCICIO = ' + IntToStr(iExercicio) +
                    ') AND (IDPESSOA = ' + IntToStr(idEmpresa) + ')';
        CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Data := Data;
      end;

      with CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt do begin

        if IsEmpty then begin
          //Se não existir insere o novo registro
          Insert;
          FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
          FieldByName('IDCONTAORCAMEN').AsString  := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString;
          FieldByName('EXERCICIO').AsInteger      := iExercicio;
          FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
          FieldByName('VLRORCADO').AsFloat        := rValor;
          FieldByName('VLRREALIZADO').AsFloat     := 0;
        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCADO').AsFloat        := rValor;
        end;
        Post;
      end;
      CtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt;

      if (bGeraResult) and (rValResult <> 0) then begin
        if cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString = pedtCodigoContaDeText then
          sContaResult := pedtCodigoContaParaText
        else
          sContaResult := pedtCodigoContaText;
       
        cdsSaldos.Close;
        CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          //Busca na tabela de Saldos se o registro existe
          ParamByName('CAMPOS').AsString := 'IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, IDPESSOA, VLRORCADO, VLRREALIZADO';
          ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Data := Data;
        end;

        with CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt do begin

          if IsEmpty then begin
            //Se não existir insere o novo registro
            Insert;
            FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
            FieldByName('IDCONTAORCAMEN').AsString  := sContaResult;
            FieldByName('EXERCICIO').AsInteger      := iExercicio;
            FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
            FieldByName('VLRREALIZADO').AsFloat     := 0;

            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCADO').AsFloat        := rValResult;
            end else begin

              FieldByName('VLRORCADO').AsFloat        := rValResult*-1;
            end;
          end else begin

            //Caso exista, dá update
            Edit;
            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCADO').AsFloat        := rValResult;
            end else begin

              FieldByName('VLRORCADO').AsFloat        := rValResult*-1;
            end;
          end;
          Post;
        end;
        CtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt;
      end;
    end else begin
     
      cdsSaldos.Close;
      FCdsSaldoOrcado.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        //Busca na tabela de Saldos se o registro existe
        ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, IDPESSOA,        IDPLANOORCAMEN, DATAREFERENCIA,' +
                                          'EXERCICIO,      PERIODO,         VLRREALIZADO,   VLRORCADO,' +
                                          'VLRRESERVADO,   VLRCOMPROMETIDO, VLRORCACUM,     VLRREALACUM';
        ParamByName('TABELAS').AsString := 'SALDOORCADO';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString +
                    ''') AND (DATAREFERENCIA = TO_DATE(''' +
                    FormatDateTime('dd/mm/yyyy',dDataCorrente) +
                    ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
        FCdsSaldoOrcado.Data := Data;
      end;

      with FCdsSaldoOrcado do begin

        if IsEmpty then begin

          Insert;
          FieldByName('IDCONTAORCAMEN').AsString   := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString;
          FieldByName('IDPESSOA').AsInteger        := IdEmpresa;
          FieldByName('IDPLANOORCAMEN').AsFloat    := PlanoOrc;
          FieldByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
          FieldByName('EXERCICIO').AsInteger       := iExercicio;
          FieldByName('PERIODO').AsInteger         := iPeriodo;
          FieldByName('VLRREALIZADO').AsFloat      := 0;
          FieldByName('VLRORCADO').AsFloat         := rValor;
          FieldByName('VLRRESERVADO').AsFloat      := 0;
          FieldByName('VLRCOMPROMETIDO').AsFloat   := 0;
          FieldByName('VLRORCACUM').AsFloat        := rValor;
          FieldByName('VLRREALACUM').AsFloat       := 0;
        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCADO').AsFloat         := rValor;
          FieldByName('VLRORCACUM').AsFloat        := rValor;
        end;

        Post;
      end;
      AplicaOperacaoSaldoOrcado;
    end;
  end;
end;

procedure TCtrlSaldoOrcado.StartTransactionOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.StartTransactionOrc;

  end else begin

    StartTransaction;
  end;
end;

procedure TCtrlSaldoOrcado.CommitOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.CommitOrc;

  end else begin

    Commit;
  end;
end;

procedure TCtrlSaldoOrcado.RollBackOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.RollBackOrc;

  end else begin

    RollBack;
  end;
end;

function TCtrlSaldoOrcado.AbreCenario : OleVariant;
begin

  Result := GetDataPacket('SELECT'                          + #13 + #10 +
                           '  IDCENARIOORCAMEN, NOMECENARIO' + #13 + #10 +
                           'FROM'                            + #13 + #10 +
                           '  CENARIOORCAMEN'                + #13 + #10 +
                           'ORDER BY'                        + #13 + #10 +
                           '  NOMECENARIO'                   + #13 + #10);
end;

function  TCtrlSaldoOrcado.EfetivaClick(pedtCodigoContaText,
                                         pedtCodigoContaDeText,
                                         pedtCodigoContaParaText,
                                         PdblcPeriodoIniText,
                                         pEdConteudo1Text,
                                         pEdConteudo2Text,
                                         pEdConteudo3Text,
                                         pEdConteudo4Text : String;
                                         psePosIni1Value,
                                         psePosIni2Value,
                                         psePosIni3Value,
                                         psePosIni4Value,
                                         psePosFim1Value,
                                         psePosFim2Value,
                                         psePosFim3Value,
                                         psePosFim4Value,
                                         pspnedExercicioValue: Double;
                                         pdblcPeriodoIniLookupValue,
                                         pdblcPeriodoFimLookupValue : String;
                                         pcbCenariosChecked,
                                         pcbBuscaSaldoAnteriorChecked : Boolean;
                                         pdblcPeriodoLimiteText,
                                         pdblcPeriodoLimiteLookUpValue : String) : Boolean;
var
  rValor           : Double;
  iExercicioAtual,
  iExercicio,
  iPeriodo         : Integer;
  conteudo1,
  conteudo2,
  conteudo3,
  conteudo4        : String;

begin
  try

    StartTransactionOrc;
    //
    if Trim(pedtCodigoContaText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcresult(pedtCodigoContaText, IdEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    if Trim(pedtCodigoContaDeText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcde(pedtCodigoContaDeText, IdEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    if Trim(pedtCodigoContaParaText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcpara(pedtCodigoContaParaText, idEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    EdtLegenda.Text    := '';

    if Trim(PdblcPeriodoIniText) <> '' then begin
      EdtLegenda.Text := 'Zerando Valores do Orçamento nos Períodos Indicados';

      if Trim(pedConteudo1Text) <> '' then begin
        conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                      FloatToStr(psePosFim1Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo1Text)) +'))';
      end;

      if Trim(pedConteudo2Text) <> '' then begin
        conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                      FloatToStr(psePosFim2Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo2Text)) + '))';
      end;

      if Trim(pedConteudo3Text) <> '' then begin
        conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                      FloatToStr(psePosFim3Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo3Text)) + '))';
      end;

      if Trim(pedConteudo4Text) <> '' then begin
        conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                      FloatToStr(psePosFim4Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo4Text)) + '))';
      end;

      if pcbCenariosChecked then begin

        CtrlValorescenario.AltVlrOrcCenario(IdEmpresa,
                                             Trunc(pspnedExercicioValue),
                                             StrToInt(pdblcPeriodoIniLookupValue),
                                             StrToInt(pdblcPeriodoFimLookupValue),
                                             conteudo1, conteudo2, conteudo3, conteudo4, 0);
      end else begin

        AltVlrOrcado(IdEmpresa,
                      Trunc(pspnedExercicioValue),
                      StrToInt(pdblcPeriodoIniLookupValue),
                      StrToInt(pdblcPeriodoFimLookupValue),
                      conteudo1, conteudo2, conteudo3, conteudo4, 0);
      end;
    end;

    if (edtLegenda.Tag = -1) then Abort;

    if pcbBuscaSaldoAnteriorChecked then begin
      EdtLegenda.Text := 'Zerando Valores do Orçamento no Saldo Anterior';

      if Trim(pedConteudo1Text) <> '' then begin
        conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                      FloatToStr(psePosFim1Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo1Text))+'))';
      end;

      if Trim(pedConteudo2Text) <> '' then begin
        conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                      FloatToStr(psePosFim2Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo2Text)) + '))';
      end;

      if Trim(pedConteudo3Text) <> '' then begin
        conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                      FloatToStr(psePosFim3Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo3Text)) + '))';
      end;

      if Trim(pedConteudo4Text) <> '' then begin
        conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                      FloatToStr(psePosFim4Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo4Text)) + '))';
      end;

      if pcbCenariosChecked then begin
        CtrlValorescenario.AltVlrorccenario2(IdEmpresa,
                                              Trunc(pspnedExercicioValue), conteudo1,
                                              conteudo2, conteudo3, conteudo4, 0);
      end else begin
        CtrlSaldoorcadoant.AltVlrorcado(IdEmpresa,
                                         Trunc(pspnedExercicioValue), conteudo1,
                                         conteudo2, conteudo3, conteudo4, 0);
      end;
    end;
    if (edtLegenda.Tag = -1) then Abort;

    EdtLegenda.Text := 'Selecionando as Contas a serem Copiadas';

    cdsContasOrcamen.Close;
    if Trim(pedConteudo1Text) <> '' then begin
      conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                    FloatToStr(psePosFim1Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo1Text)) + '))';
    end;

    if Trim(pedConteudo2Text) <> '' then begin
      conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                    FloatToStr(psePosFim2Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo2Text)) + '))';
    end;

    if Trim(pedConteudo3Text) <> '' then begin
      conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                    FloatToStr(psePosFim3Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo3Text)) + '))';
    end;
    if Trim(pedConteudo4Text) <> '' then begin
      conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                    FloatToStr(psePosFim4Value) + ') IN (' +
                                                    Trim(pedConteudo4Text) + '))';
    end;

    with DtmBuscaContabil.sqlContasOrcamen do begin
      Prepare;
      ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, FLGSINALCONTA';
      ParamByName('TABELAS').AsString := 'CONTASORCAMEN';
      ParamByName('CONDICOES').asString := '(IDPLANOORCAMEN  = ' + IntToStr(PlanoOrc) + ')' +
                                           conteudo1 + conteudo2 + conteudo3 + conteudo4 +
                                           ' AND  (TIPOCALCREALIZADO = ''P'') AND ' +
                                           '((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))';
      CdsContasOrcamen.Data := Data;
    end;

    if (edtLegenda.Tag = -1) then Abort;

    EdtLegenda.Text := 'Copiando Valores da Contabilidade para o Orçamento';

    pbAguarde.Max := cdsContasOrcamen.RecordCount;
    pbAguarde.Position := 0;
    cdsContasOrcamen.First;
    //*********************************************
    if Trim(pdblcPeriodoIniText) <> '' then begin        
      cdsPeriodo.Close;
      with DtmBuscaContabil.sqlPeriodo do begin
        Prepare;
        ParamByName('EXERCICIO').AsInteger  := Trunc(pspnedExercicioValue);
        ParamByName('PESSOA').AsInteger     := IdEmpresa;
        ParamByName('PERIODOINI').AsInteger := StrToInt(pdblcPeriodoIniLookupValue);
        ParamByName('PERIODOFIM').AsInteger := StrToInt(pdblcPeriodoFimLookupValue);
        CdsPeriodo.Data := Data;
      end;
    end;

    while not cdsContasOrcamen.EOF do begin
      pbAguarde.Position := pbAguarde.Position + 1;
      edtPosicao.Text    := IntToStr(pbAguarde.Max - pbAguarde.Position);
      cdsComposicao.Close;

      with DtmBuscaContabil.sqlComposicao do begin
        Prepare;
        ParamByName('PLANO').asFloat  := PlanoOrc;
        ParamByName('CONTA').asString := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString;
        CdsComposicao.Data := Data;
      end;

      if Trim(pdblcPeriodoIniText) <> '' then begin

        cdsPeriodo.First;
        while not cdsPeriodo.EOF do begin
          rValor := 0;
          cdsComposicao.First;
          while not cdsComposicao.EOF do begin
            cdsContabilidade.Close;
            conteudo1 := '  (L.PLACONTA LIKE ''' + Trim(cdsComposicao.FieldByName('PLACONTA').AsString) +
                         '%'') AND (L.PLANO = '  + IntToStr(cdsComposicao.FieldByName('PLANO').AsInteger) +
                         ') AND ' + #13 + #10;

            if not cdsComposicao.FieldByName('CODCENTROCUSTO').IsNull then
               begin
              conteudo1 := conteudo1 + '  (L.CODCENTROCUSTO = ''' +
                           Espaco(Trim(cdsComposicao.FieldByName
                           ('CODCENTROCUSTO').asString),10) +
                           ''') AND (L.IDEMPRESA = ' +
                           IntToStr(cdsComposicao.FieldByName
                           ('IDEMPRESA').AsInteger) + ') AND ' + #13 + #10;
            end;
            conteudo1 := conteudo1 + '  (P.IDPESSOA = ' +
                         IntToStr(IdEmpresa) + ') AND ' + #13 + #10;
            if not cdsComposicao.FieldByName('UNIDNEGOC').IsNull then begin
              conteudo1 := conteudo1 + '(L.UNIDNEGOC = ' +
                           IntToStr(cdsComposicao.FieldByName
                           ('UNIDNEGOC').AsInteger) + ') AND ' + #13 + #10;
            end;
            if not cdsComposicao.FieldByName('IDPLANOPREV').IsNull then begin
              conteudo1 := conteudo1 + '  (L.IDPLANOPREV = ' +
                           IntToStr(cdsComposicao.FieldByName ('IDPLANOPREV').AsInteger) + ') AND ' + #13 + #10;
            end;
            if not cdsComposicao.FieldByName('IDPATRO').IsNull then begin
              conteudo1 := conteudo1 + '  (L.IDPATRO = ' +
                           IntToStr(cdsComposicao.FieldByName ('IDPATRO').AsInteger) + ') AND ' + #13 + #10;
            end;
            conteudo1 := conteudo1 +
                      '  (P.PLNDATDIA >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime) + ''',''DD/MM/YYYY'')) AND'  + #13 + #10 +
                      '  (P.PLNDATDIA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime) + ''',''DD/MM/YYYY'')) AND'  + #13 + #10 +
                      '  (L.PLNCODIGO  = P.PLNCODIGO)' + #13 + #10;
            with DtmBuscaContabil.sqlContabilidade do begin
              Prepare;
              ParamByName('CAMPOS').AsString    := '/*+ INDEX (LANCAMENTO) */ ' + #13 + #10 + 'SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS VALOR';
              ParamByName('TABELAS').AsString   := 'LANCAMENTO L, PLANILHA P';
              ParamByName('CONDICOES').AsString := conteudo1;
              CdsContabilidade.Data := Data;
            end;

            if not cdsContabilidade.IsEmpty then begin
              rValor := rValor + cdsContabilidade.FieldByName('VALOR').asFloat;
            end;
            cdsComposicao.Next;
            if (edtLegenda.Tag = -1) then Abort;
          end;
          if rValor <> 0 then begin
            if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'N' then
              rValor := rValor * -1;
            GravaOrc(rValor,
                      cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime,
                      cdsPeriodo.FieldByName('PERIODO').AsInteger,
                      cdsPeriodo.FieldByName('EXERCICIO').AsInteger,
                      False,
                      pcbCenariosChecked,
                      pedtCodigoContaDeText,
                      pedtCodigoContaParaText,
                      pedtCodigoContaText);
          end;
          cdsPeriodo.Next;

          if (edtLegenda.Tag = -1) then Abort;
        end;
      end;
      if pcbBuscaSaldoAnteriorChecked then begin
        rValor := 0;
        if Trim(pdblcPeriodoLimiteText) <> '' then begin
          iPeriodo        := StrToInt(pdblcPeriodoLimiteLookUpValue);
          iExercicioAtual := Trunc(pspnedExercicioValue) - 1;
        end else begin
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'PACEXERCICIOATUAL';
            ParamByName('TABELAS').AsString := 'PARAMCONTAB';
            ParamByName('CONDICOES').AsString := 'IDPESSOA = ' + IntToStr(idEmpresa);
            CdsAux.Data := Data;
          end;
          iExercicioAtual := cdsAux.FieldByName('PACEXERCICIOATUAL').AsInteger;
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'MAX(PERNUMERO) AS PERIODO';
            ParamByName('TABELAS').AsString := 'PERIODO';
            ParamByName('CONDICOES').AsString := '(IDPESSOA = ' + IntToStr(idEmpresa) +
                                                 ')AND (PEREXERCICIO = ' + IntToStr(iExercicioAtual) +
                                                 ') AND (PERBLOQUE = ''S'')';
            CdsAux.Data := Data;
          end;
          iPeriodo := cdsAux.FieldByName('PERIODO').AsInteger;
        end;
        cdsComposicao.First;
        while not cdsComposicao.EOF do begin
          cdsContabilidade.Close;
          if iExercicioAtual < Trunc(pspnedExercicioValue) then
            iExercicio := iExercicioAtual
          else
            iExercicio := Trunc(pspnedExercicioValue);

          conteudo1 := '(PLACONTA = ''' +
                       Espaco(Trim(cdsComposicao.FieldByName ('PLACONTA').AsString),18) + ''') AND (PLANO = ' +
                       IntToStr(cdsComposicao.FieldByName('PLANO').AsInteger) + ') AND ';

          if not cdsComposicao.FieldByName('CODCENTROCUSTO').IsNull then begin
            conteudo1 := conteudo1 + '(CODCENTROCUSTO = ''' +
                                     Espaco(Trim(cdsComposicao.FieldByName
                                     ('CODCENTROCUSTO').asString),10) +
                                     ''') AND (IDEMPRESA = ' +
                                     IntToStr(cdsComposicao.FieldByName
                                     ('IDEMPRESA').AsInteger) + ') AND ';
          end;
          conteudo1 := conteudo1 + '(IDPESSOA = ' +
                                   IntToStr(IdEmpresa) + ') AND ';
          if not cdsComposicao.FieldByName('UNIDNEGOC').IsNull then begin
            conteudo1 := conteudo1 + '(UNIDNEGOC = ' +
                   IntToStr(cdsComposicao.FieldByName('UNIDNEGOC').AsInteger) +
                   ') AND ';
          end;
          if not cdsComposicao.FieldByName('IDPLANOPREV').IsNull then begin
            conteudo1 := conteudo1 + '(IDPLANOPREV = ' +
                 IntToStr(cdsComposicao.FieldByName('IDPLANOPREV').AsInteger) +
                 ') AND ';
          end;
          if not cdsComposicao.FieldByName('IDPATRO').IsNull then begin
            conteudo1 := conteudo1 + '(IDPATRO = ' +
                     IntToStr(cdsComposicao.FieldByName('IDPATRO').AsInteger) +
                     ') AND ';
          end;
          conteudo1 := conteudo1 + '(PEREXERCICIO = ' +
                                   IntToStr(iExercicio) + ') AND ';
          if iExercicioAtual < Trunc(pspnedExercicioValue) then begin
            conteudo1 := conteudo1 + '((PERNUMERO <= ' + IntToStr(iPeriodo) + ') OR (PERNUMERO IS NULL))';
          end else begin
            conteudo1 := conteudo1 + '(PERNUMERO IS NULL)';
          end;

          with DtmBuscaContabil.sqlContabilidade do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR';
            ParamByName('TABELAS').AsString := 'PLANOSALDO';
            ParamByName('CONDICOES').AsString := conteudo1;
            CdsContabilidade.Data := Data;
          end;

          if not cdsContabilidade.IsEmpty then begin

            rValor := rValor + cdsContabilidade.FieldByName('VALOR').asFloat;
          end;
          cdsComposicao.Next;

          if (edtLegenda.Tag = -1) then Abort;
        end;
        if rValor <> 0 then begin
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'N' then
            rValor := rValor * -1;
        end;
        if iExercicioAtual < Trunc(pspnedExercicioValue) then begin
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'SUM(NVL(VLRORCADO,0)) AS SALDO';
            ParamByName('TABELAS').AsString := 'SALDOORCADO';
            ParamByName('CONDICOES').AsString := '(IDPESSOA = ' + IntToStr(idEmpresa) +
                                                 ') AND (PERIODO  > ' + IntToStr(iPeriodo) +
                                                 ') AND (EXERCICIO  >= ' + IntToStr(iExercicioAtual) +
                                                 ') AND (EXERCICIO  < ' + IntToStr(Trunc(pspnedExercicioValue)) +
                                                 ') AND (IDPLANOORCAMEN  = ' + IntToStr(PlanoOrc) +
                                                 ') AND (IDCONTAORCAMEN  = ''' + cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString + ''')';
            CdsContabilidade.Data := Data;
          end;

          if not cdsAux.IsEmpty then
            rValor := rValor + cdsAux.FieldByName('SALDO').AsFloat;
        end;
        if rValor <> 0 then begin
          GravaOrc(rValor,
                    Date,
                    0,
                    Trunc(pspnedExercicioValue),
                    False,
                    pcbCenariosChecked,
                    pedtCodigoContaDeText,
                    pedtCodigoContaParaText,
                    pedtCodigoContaText);

        end;
      end;
      cdsContasOrcamen.Next;

      if (edtLegenda.Tag = -1) then Abort;
    end;
    //******************************************
    if (pcbBuscaSaldoAnteriorChecked) and (Trim(pedtCodigoContaText) <> '') then begin

      EdtLegenda.Text := 'Selecionando as Contas a serem Zeradas';

      cdsContasOrcamen.Close;
      with DtmBuscaContabil.sqlContasOrcamen do begin
        Prepare;
        ParamByName('CAMPOS').AsString := 'C.IDCONTAORCAMEN, C.FLGSINALCONTA';
        ParamByName('TABELAS').AsString := 'CONTASORCAMEN C, GRUPOORCAMEN G';
        ParamByName('CONDICOES').AsString := '(C.IDPLANOORCAMEN  = ' +
                        IntToStr(PlanoOrc) +
                        ') AND (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) ' +
                        'AND ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) ' +
                        'AND (G.FLGRESULTADO = ''S'')';
        CdsContasOrcamen.Data := Data;
      end;
      if (edtLegenda.Tag = -1) then Abort;

      EdtLegenda.Text := 'Zerando as contas de Resultado';

      pbAguarde.Max := cdsContasOrcamen.RecordCount;
      pbAguarde.Position := 0;
      cdsContasOrcamen.First;
      while not cdsContasOrcamen.EOF do begin
        pbAguarde.Position := pbAguarde.Position + 1;
        edtPosicao.Text    := IntToStr(pbAguarde.Max - pbAguarde.Position);

        GravaOrc(0,
                  Date,
                  0,
                  Trunc(pspnedExercicioValue),
                  true,
                  pcbCenariosChecked,
                  pedtCodigoContaDeText,
                  pedtCodigoContaParaText,
                  pedtCodigoContaText);

        cdsContasOrcamen.Next;
        if (edtLegenda.Tag = -1) then Abort;
      end;
    end;
    CommitOrc;

    Result := True;
  except
    On E:exception do begin
      Result := False;
      RollbackOrc;
      MessageInfo := MessageInfo + E.Message;
    end;
  end;
end;



procedure TCtrlSaldoOrcado.CmeCadastroDelete(var pMensagem            : String;
                                                  pdbeContaOrigemText,
                                                  pdbeContaDestinoText,
                                                  psDataOri,
                                                  psDataRef            : String;
                                                  prValorTransf        : Real);
begin
   try
      StartTransactionOrc;

      //Dá o Update no Saldo da Conta de Origem...
      //Repõe o valor antigo na conta de origem
      AtualizaSaldo(PlanoOrc, idEmpresa, pdbeContaOrigemtext,  psDataOri, prValorTransf);

      //Tira o valor antigo na conta de destino
      AtualizaSaldo(PlanoOrc, idEmpresa, pdbeContaDestinotext, psDataRef, -(prValorTransf));
      inherited;

      CommitOrc;
      pMensagem := 'Exclusão da transferência efetuada com sucesso.';

      // Edilaine - SOL 185723 / KTN 1742408
      {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
      GravaLogPLANEORC('uCtrlSaldoOrcado.CmeCadastroDelete: ' + ' - ' +
                       'ContaOrig = ' + pdbeContaOrigemText + ' - ' +
                       'ContaDest = ' + pdbeContaDestinoText + ' - ' +
                       'DataOrigem = ' + psDataOri + ' - ' +
                       'DataRef = ' + psDataRef + ' - ' +
                       'Valor = ' + FloatToStr(prValorTransf),
                       Sistema.IdModulo,
                       Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

   except
      RollbackOrc;

      pMensagem := 'Foram detectados problemas na exclusão da Transferência.'
   end;
end;



function TCtrlSaldoOrcado.AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                                   const pedtCodigoContaText : String;
                                                   const iExercicio          : Integer;
                                                   const iPeriodoIni         : Integer;
                                                   const iPeriodoFim         : Integer
                                                   ) : Boolean;
var
  pConta : String;
  sDec   : Char;

begin
  sDec              := DecimalSeparator;
  DecimalSeparator  := '.';

  try
    StartTransactionOrc;

    _Cds.Data := GetDataPacket('SELECT IDPLANOORCAMEN FROM PARAMORCAMENTO');
    if (Trim(pEdtCodigoContaText) <> '') then
      begin
        pconta := ') AND (IDCONTAORCAMEN = ''' + Trim(pedtCodigoContaText) + ''')';
      end
    else
      begin
        pconta := ')';
      end;

    ZeraSaldo(pIdEmpresa, pconta);

    // Para Valor Reservado
    with dtmAcertaSaldo do
      begin
        cdsValorCorreto.Close;
        sqlValorCorreto.Prepare;
        sqlValorCorreto.ParamByName('IDCONTA').AsString   := pedtCodigoContaText;
        sqlValorCorreto.ParamByName('IDPESSOA').AsInteger := pIdEmpresa;
        sqlValorCorreto.ParamByName('IDPLANO').AsInteger  := _Cds.FieldByName('IDPLANOORCAMEN').AsInteger;
        sqlValorCorreto.Open;

        
        if pbAguarde <> nil then
        begin
           pbAguarde.Position   := 0;
           pbAguarde.Max        := cdsValorCorreto.RecordCount;
        end;    

        cdsValorCorreto.First;
        while not(cdsValorCorreto.EOF) do
          begin
            
            if pbAguarde <> nil then
               pbAguarde.Position := pbAguarde.Position + 1;
               
            // Se for definida UMA CONTA para acertar o SALDO
            if (trim(pedtCodigoContaText) <> '') and
               (trim(pedtCodigoContaText) <> trim(cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString)) then
              begin
                // Não faz Nada
              end
            // Se NENHUMA CONTA for definida para acertar o SALDO
            else
              begin
                cdsContaSaldo.Close;
                sqlContaSaldo.Prepare;
                sqlContaSaldo.ParamByName('IDPESSOA').AsInteger        := pIdEmpresa;
                sqlContaSaldo.ParamByName('IDPLANOORCAMEN').AsInteger  := cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger;
                sqlContaSaldo.ParamByName('IDCONTAORCAMEN').AsString   := cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString;
                sqlContaSaldo.ParamByName('DATAREFERENCIA').AsDateTime := cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime;
                sqlContaSaldo.Open;

                if cdsContaSaldo.RecordCount > 0 then
                  begin
                    //  Caso o a seja comprometido...
                    if cdsValorCorreto.FieldByName('FLGRESCOMP').AsString = 'C' then
                      begin
                        AcertaValor(pIdEmpresa,
                                    cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                                    cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                                    FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                                    'VLRCOMPROMETIDO',
                                    cdsValorCorreto.FieldByName('VLRCOMPROMISSO').AsFloat);
                      end
                    else
                      begin
                        AcertaValor(pIdEmpresa,
                                    cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                                    cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                                    FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                                    'VLRRESERVADO',
                                    cdsValorCorreto.FieldByName('VLRRESERVA').AsFloat);
                      end; // if interno
                  end // if externo

                else
                  begin
                    //  Caso o a seja comprometido...
                    if cdsValorCorreto.FieldByName('FLGRESCOMP').AsString = 'C' then
                      begin
                        InsereValor(pIdEmpresa,
                                    cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                                    cdsValorCorreto.FieldByName('EXERCICIO').AsInteger,
                                    cdsValorCorreto.FieldByName('PERIODO').AsInteger,
                                    cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                                    FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                                    'VLRCOMPROMETIDO',
                                    cdsValorCorreto.FieldByName('VLRCOMPROMISSO').AsFloat);

                      end
                    else
                      begin
                        InsereValor(pIdEmpresa,
                                    cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                                    cdsValorCorreto.FieldByName('EXERCICIO').AsInteger,
                                    cdsValorCorreto.FieldByName('PERIODO').AsInteger,
                                    cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                                    FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                                    'VLRRESERVADO',
                                    cdsValorCorreto.FieldByName('VLRRESERVA').AsFloat)
                      end; // if interno
                  end; // if externo

            end; // else

          cdsValorCorreto.Next;
          end; // while
      end; // with



    CommitOrc;
    Result := True;
    DecimalSeparator := sDec;

  // Edilaine - SOL 185723 / KTN 1742408
  {comentar o código abaixo pq o log foi tratado via trigger  TISALDOORCADO
    GravaLogPLANEORC('uCtrlSaldoOrcado.AcertaSaldoConfirmaClick - ' +
                     'Conta: ' + pedtCodigoContaText        + ' - ' +
                     'Exercício: ' + IntToStr(iExercicio)   + ' - ' +
                     'PeríodoINI: ' + IntToStr(iPeriodoIni) + ' - ' +
                     'PeríodoFIM: ' + IntToStr(iPeriodoFim),
                     Sistema.IdModulo,
                     Sistema.IdUsuario);
  } // Edilaine - SOL 185723 / KTN 1742408 - fim

  except
     on E:Exception do
     begin
        Result := False;
        RollBackOrc;
        MessageInfo := E.Message;
     end;
  end;

  DecimalSeparator := sDec;
end;



//           Integração com o RH
function TCtrlSaldoOrcado.IncluirOrcamentoRH(IdEmpresa           : Integer;
                                              IdPlanoOrcamentario : Double;
                                              ContaOrcamentaria   : String;
                                              DataRef             : TDate;
                                              Valor               : Double;
                                              const iIdDespesaOrc : integer ) : Boolean;  // Edilaine - SOL 192391 / KTN 1833220
var
  iNumOrcamentos  : integer;
  wDia, wMes, wAno: word;
begin
  if (ConnectionSide = cnsClient) then begin
    Result := Connection.AppServer.IncluirOrcamentoRH(IdEmpresa,
                                                       IdPlanoOrcamentario,
                                                       ContaOrcamentaria,
                                                       DataRef);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;

  end else begin
    _Cds.Data := GetDataPacket(
      'SELECT'+#13+
      '  COUNT(VLRORCADO) AS NUM_ORCAMENTOS'+#13+
      'FROM'+#13+
      '  SALDOORCADO'+#13+
      'WHERE'+#13+
      '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
      '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
      '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
      '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' + QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

    iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

    if (iNumOrcamentos > 0) then begin
      try
        Result := ExecSQL(
          'UPDATE SALDOORCADO'+#13+
          'SET    VLRORCADO = ROUND(' + TrocaVPP(FloatToStr(Valor)) +'/' + IntToStr(iNumOrcamentos) +',0)'+#13+
          'WHERE'+#13+
          '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
          '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
          '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
          '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = '+ QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

        if not(Result) then
          Raise exception.Create(MessageInfo);
      except
        On E : exception do begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar alterar o Orçamento para a Conta Nº '+
                         ContaOrcamentaria +#13+ 'Erro:' +#13 + E.Message;
        end;
      end;
    end else begin
      try
        DecodeDate(DataRef, wAno, wMes, wDia);
        Result := ExecSQL(
          'INSERT INTO SALDOORCADO'+#13+
          '(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO, IDDESPESAORC)'+#13+ // Edilaine - SOL 192391 / KTN 1833220
          'VALUES (' +
            TrocaVPP(FloatToStr(Valor)) +', '+
            IntToStr(IdEmpresa) +', '+
            FloatToStr(IdPlanoOrcamentario) +', '+
            QuotedStr(ContaOrcamentaria) +', '+
            'TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''), '+
            IntToStr(wMes) +', '+
            IntToStr(wAno) +', '+
            IntToStr(iIdDespesaOrc)+')');   // Edilaine - SOL 192391 / KTN 1833220

        if not(Result) then
          Raise exception.Create(MessageInfo);
      except
        On E: exception do
        begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar inserir o Orçamento para a Conta Nº '+
                         ContaOrcamentaria +#13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end;
  end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlSaldoOrcado.SetCdsSaldoorcado(const Value: TClientDataSet);
begin
   FCdsSaldoOrcado := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsCenario(Const Value: TClientDataSet);
begin
   FCdsCenario := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsContasOrcamen(Const Value: TClientDataSet);
begin
   FCdsContasOrcamen := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsSaldos(const Value: TClientDataSet);
begin
   FCdsSaldos := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsComposicao(const Value: TClientDataSet);
begin
   FCdsComposicao := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsPeriodo(const Value: TClientDataSet);
begin
   FCdsPeriodo:= Value;
end;

procedure TCtrlSaldoOrcado.SetCdsContabilidade(Const Value: TClientDataSet);
begin
   FCdsContabilidade := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsAux(Const Value: TClientDataSet);
begin
   FCdsAux := Value;
end;


// faz importação do orçamento de uma planilha excel
Function TCtrlSaldoOrcado.ImportaPlanilha(const sNomeArquivo   : String;
                                           const ilinhaIni      : integer;
                                           const sColCodContaOrc: string;
                                           const sColPeriodo1    : string;
                                           const sColPeriodo2    : string;
                                           const sColPeriodo3    : string;
                                           const sColPeriodo4    : string;
                                           const sColPeriodo5    : string;
                                           const sColPeriodo6    : string;
                                           const sColPeriodo7    : string;
                                           const sColPeriodo8    : string;
                                           const sColPeriodo9    : string;
                                           const sColPeriodo10   : string;
                                           const sColPeriodo11   : string;
                                           const sColPeriodo12   : string;
                                           const iExercicio      : integer;
                                           const iIdpessoa       : integer;
                                           const iIdplanoOrcamen : integer;
                                           const idUsuario       : integer): oleVariant;


Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);

Var
  ExcelApp, Sheet : Variant;
  i, j, totlinhas, totColunas, icontasErro  : Integer;
  wDecimal   : Char;
  _cdsRegistro, _cdsConta : TClientDataset;
  sMsg : string;
  iColCodContaOrc, iColPeriodo1, iColPeriodo2, iColPeriodo3, iColPeriodo4, iColPeriodo5, iColPeriodo6,
  iColPeriodo7, iColPeriodo8, iColPeriodo9, iColPeriodo10, iColPeriodo11, iColPeriodo12: integer;
  aColunasPer : array [1..12] of integer;
begin
  sMsg := '';
  wDecimal         := DecimalSeparator;
  DecimalSeparator := ',';
  totlinhas := 0;
  totColunas := 0;
  icontasErro := 0;
   _cdsRegistro := TClientDataset.Create(nil);
   _cdsConta := TClientDataset.Create(nil);


   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo
   // conseguindo ou não Fecha o Arquivo
   try

     sMsg := '';
     DoProgresso(['Abrindo a planilha Excel...',
                        0,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        0,            // Mínimo de Registros  (em cima)
                        0,            // Total de Registros   (em cima)
                        0,           // Registro Atual        (em cima)
                        '',
                        '' ]
                        );

      _cdsRegistro.close;
      _cdsRegistro.data := getDataPacket (' SELECT ''                                           '' AS NOMECONTAORCAMEN, S.* FROM SALDOORCADO S WHERE 1 = 2 ');
      _cdsRegistro.data := copyClientDataSet(_cdsRegistro);

      // Conecta com o Excel
      try
         ExcelApp := IDispatch(ExcelApp);
         ExcelApp := CreateOleObject('Excel.Application');
         ExcelApp.Visible := False;
         { Abre Arquivo Excel }
         ExcelApp.Workbooks.Open(sNomeArquivo,0);
      except
         MessageInfo := 'Não consegui conectar o Excel desta máquina!';
         sMsg := sMsg + #13 + messageInfo + #13;
         exit;
      end;

      try

        { Seleciona pasta da planilha a utulizar (Localizada abaixo da planilhja)  }
        try
          Sheet := ExcelApp.Workbooks[1].WorkSheets[1];
        except
          messageInfo := 'Não foi possível abrir a planilha.';
          sMsg := sMsg + #13 + messageInfo;
        end;


        totlinhas   := INTEGER(Sheet.UsedRange.Rows.Count);
        totColunas  := INTEGER(Sheet.UsedRange.Columns.count);

        // Inicia a importaçao para o vetor
         if length(sColCodContaOrc) = 1 then
           iColCodContaOrc := VetorEnumerado[sColCodContaOrc[1]]
         else if length(sColCodContaOrc) = 2 then
           iColCodContaOrc := VetorEnumerado[sColCodContaOrc[1]] * 26 + VetorEnumerado[sColCodContaOrc[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo1) = 1 then
           iColPeriodo1 := VetorEnumerado[sColPeriodo1[1]]
         else if length(sColPeriodo1) = 2 then
           iColPeriodo1 := VetorEnumerado[sColPeriodo1[1]] * 26 + VetorEnumerado[sColPeriodo1[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo2) = 1 then
           iColPeriodo2 := VetorEnumerado[sColPeriodo2[1]]
         else if length(sColPeriodo2) = 2 then
           iColPeriodo1 := VetorEnumerado[sColPeriodo2[1]] * 26 + VetorEnumerado[sColPeriodo2[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo3) = 1 then
           iColPeriodo3 := VetorEnumerado[sColPeriodo3[1]]
         else if length(sColPeriodo3) = 2 then
           iColPeriodo3 := VetorEnumerado[sColPeriodo3[1]] * 26 + VetorEnumerado[sColPeriodo3[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo4) = 1 then
           iColPeriodo4 := VetorEnumerado[sColPeriodo4[1]]
         else if length(sColPeriodo4) = 2 then
           iColPeriodo4 := VetorEnumerado[sColPeriodo4[1]] * 26 + VetorEnumerado[sColPeriodo4[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo5) = 1 then
           iColPeriodo5 := VetorEnumerado[sColPeriodo5[1]]
         else if length(sColPeriodo5) = 2 then
           iColPeriodo5 := VetorEnumerado[sColPeriodo5[1]] * 26 + VetorEnumerado[sColPeriodo5[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo6) = 1 then
           iColPeriodo6 := VetorEnumerado[sColPeriodo6[1]]
         else if length(sColPeriodo6) = 2 then
           iColPeriodo6 := VetorEnumerado[sColPeriodo6[1]] * 26 + VetorEnumerado[sColPeriodo6[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo7) = 1 then
           iColPeriodo7 := VetorEnumerado[sColPeriodo7[1]]
         else if length(sColPeriodo7) = 2 then
           iColPeriodo7 := VetorEnumerado[sColPeriodo7[1]] * 26 + VetorEnumerado[sColPeriodo7[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo8) = 1 then
           iColPeriodo8 := VetorEnumerado[sColPeriodo8[1]]
         else if length(sColPeriodo8) = 2 then
           iColPeriodo8 := VetorEnumerado[sColPeriodo8[1]] * 26 + VetorEnumerado[sColPeriodo8[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo9) = 1 then
           iColPeriodo9 := VetorEnumerado[sColPeriodo9[1]]
         else if length(sColPeriodo9) = 2 then
           iColPeriodo9 := VetorEnumerado[sColPeriodo9[1]] * 26 + VetorEnumerado[sColPeriodo9[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo10) = 1 then
           iColPeriodo10 := VetorEnumerado[sColPeriodo10[1]]
         else if length(sColPeriodo10) = 2 then
           iColPeriodo10 := VetorEnumerado[sColPeriodo10[1]] * 26 + VetorEnumerado[sColPeriodo10[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo11) = 1 then
           iColPeriodo11 := VetorEnumerado[sColPeriodo11[1]]
         else if length(sColPeriodo11) = 2 then
           iColPeriodo11 := VetorEnumerado[sColPeriodo11[1]] * 26 + VetorEnumerado[sColPeriodo11[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         if length(sColPeriodo12) = 1 then
           iColPeriodo12 := VetorEnumerado[sColPeriodo12[1]]
         else if length(sColPeriodo12) = 2 then
           iColPeriodo12 := VetorEnumerado[sColPeriodo12[1]] * 26 + VetorEnumerado[sColPeriodo12[2]]
         else
           messageInfo := 'A importação de planilha Excel está limitada até a coluna ZZ';

         TFloatField(_cdsRegistro.fieldByName('VLRORCADO')).DisplayFormat := '#,##0.00';

         //passa os dados do vetor para um clientDataSet
         for i := ilinhaIni to totLinhas do
         begin
           if FbCancelaImportacao then //se cancelou a operacao entao sai do looping
             break;

           // verifica se a conta orcamentaria existe
           if (i >= ilinhaIni + 1) then
           begin
             _cdsConta.Close;
             _cdsConta.data := getDataPacket('SELECT NOMECONTAORCAMEN FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = '+
                                            quotedStr(Trim(Sheet.Cells[i, iColCodContaOrc])) +
                                            ' AND IDPLANOORCAMEN = ' + intToStr(iIdPlanoOrcamen));
             // verifica se a conta existe
             _cdsConta.LogChanges := false;
             if _cdsConta.IsEmpty then
             begin
               inc(icontasErro);
               sMsg := sMsg + 'Linha '+ intTostr(i - 1) +'. Não importado dados da conta '+ Trim(Sheet.Cells[i, iColCodContaOrc]) +
                                                     ', conta não cadastrada.' +#13#10;

               DoProgresso(['Processamento da conta '+ Trim(Sheet.Cells[i, iColCodContaOrc]),
                              1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                              ilinhaIni,            // Mínimo de Registros  (em cima)
                              totLinhas,            // Total de Registros   (em cima)
                              i,           // Registro Atual        (em cima)
                              '',
                              sMsg ]
                              );

             end;//if
           end;//if

           for j := 1 to totColunas + 1 do
           begin
             if FbCancelaImportacao then //se cancelou a operacao entao sai do looping
               break;

	     // se mudou de período entao insere mais uma linha
             if (not _cdsConta.IsEmpty) and (i >= ilinhaIni + 1) and (j in [iColPeriodo1, iColPeriodo2, iColPeriodo3, iColPeriodo4, iColPeriodo5, iColPeriodo6,
                      iColPeriodo7, iColPeriodo8, iColPeriodo9, iColPeriodo10, iColPeriodo11, iColPeriodo12]) then
             begin
               _cdsRegistro.Append;


               DoProgresso(['Processamento da conta '+ Trim(Sheet.Cells[i, iColCodContaOrc]),
                               1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                               ilinhaIni,            // Mínimo de Registros  (em cima)
                               totLinhas,            // Total de Registros   (em cima)
                               i,           // Registro Atual        (em cima)
                               '',
                               sMsg ]
                               );


               if j = iColPeriodo1 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 1;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo1]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo2 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 2;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo2]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo3 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 3;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo3]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo4 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 4;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo4]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo5 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 5;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo5]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo6 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 6;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo6]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo7 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 7;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo7]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo8 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 8;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo8]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo9 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 9;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo9]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo10 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 10;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo10]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo11 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 11;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo11]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end
               else if j = iColPeriodo12 then
               begin
                 _cdsRegistro.fieldByName('PERIODO').asInteger := 12;
                 try
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := strToFloat(Trim(Sheet.Cells[i, iColPeriodo12]));
                 except
                   _cdsRegistro.fieldByName('VLRORCADO').asFloat := 0;
                 end;
               end;

               try
                 _cdsRegistro.fieldByName('EXERCICIO').asInteger := iExercicio;
                 _cdsRegistro.fieldByName('IDCONTAORCAMEN').asString := Trim(Sheet.Cells[i, iColCodContaOrc]);
                 _cdsRegistro.fieldByName('NOMECONTAORCAMEN').asString := _cdsConta.fieldByName('NOMECONTAORCAMEN').asString;
                 _cdsRegistro.fieldByName('DATAREFERENCIA').asDateTime := strToDate('01/' + _cdsRegistro.fieldByName('PERIODO').asString +'/'+ _cdsRegistro.fieldByName('EXERCICIO').asString);
                 _cdsRegistro.fieldByName('IDCRITERIORATORC').Clear;
                 _cdsRegistro.fieldByName('IDPESSOA').asFloat  := iIdpessoa;
                 _cdsRegistro.fieldByName('IDPLANOORCAMEN').asInteger  := iIdPlanoOrcamen;
               except
                 inc(icontasErro);
                 sMsg := sMsg + 'Linha '+  intTostr(i - 1) + '. Não importado dados da conta '+ Trim(Sheet.Cells[i, iColCodContaOrc]) + ' período '+ intToStr(j)+ '/' + intTostr(iExercicio) +
                                ', dados inválidos.' +#13#10;
                 _cdsRegistro.Cancel;
               end;

             end;//if
           end; //for
         end;   //for
        if _cdsRegistro.State in [dsInsert, dsEdit] then
          _cdsRegistro.Post;

      finally
        // Fecha o Arquivo Independente do resultado da Operacao
        ExcelApp.Workbooks[1].Close(False);
        ExcelApp.Quit;
      end;
   finally
     DecimalSeparator :=  wDecimal;
     DoProgresso(['Processamento da Planilha ',
                   2,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                   ilinhaIni,            // Mínimo de Registros  (em cima)
                   totLinhas,            // Total de Registros   (em cima)
                   i,           // Registro Atual        (em cima)
                   '',
                   '----- Início do processamento  ----- '+#13#13 + sMsg +#13#10+
                   'Total de contas importadas com sucesso: '+ intTostr((totLinhas - 1) - icontasErro )+#13#10+
                   'Total de contas não importadas: '+ intTostr(icontasErro)+#13#10+
                   ' ------ Fim do Processamento  ----- ' ]
                 );

     sMsg := '';
     result := _cdsRegistro.Data;
     _cdsRegistro.free;
     _cdsConta.free;
   end;
end;


procedure TCtrlSaldoOrcado.SetbCancelaImportacao(const Value: boolean);
begin
  FbCancelaImportacao := Value;
end;

function TCtrlSaldoOrcado.Exclui(const sidcontaOrcamen: string;
                                 const iPeriodo, iExercicio, iIdpessoa,
                                       iIdplanoOrcamen: integer): Boolean;
begin
  Result := ExecSQL(' DELETE FROM SALDOORCADO ' +
                    '  WHERE EXERCICIO = '+ intToStr(iExercicio) +
                    '    AND PERIODO = '+ intToStr(iperiodo) +
                    '    AND IDPESSOA = '+ intTostr(iIdpessoa)+
                    '    AND IDPLANOORCAMEN = '+ intToStr(iIdplanoOrcamen) +
                    '    AND IDCONTAORCAMEN = '+ quotedStr(sidcontaOrcamen)
                    );
end;


// faz importação de cotação de moeda de planilha excel



procedure TCtrlSaldoOrcado.SetValueField(AFIELD: String;
                                         AVALOR,
                                         AIDPESSOA,
                                         AIDPLANOORCAMEN: Double;
                                         AIDCONTAORCAMEN: String;
                                         ADATAREFERENCIA: TDateTime;
                                         ACHAVEAUX: Double;
                                         AIncValue: Boolean;
                                         ADecValue: Boolean);
begin
  Try
    if AIncValue AND ADecValue Then
       Raise Exception.Create('Verifique os parâmetros!' + #13 + 'TCtrlSaldoOrcado.SetValueField');

    if AIncValue Then
       AFIELD := AFIELD + ' = (NVL(' + AFIELD + ',0) + ' + TrocaVPP(FloatToStr(AVALOR)) + ')'
    Else if ADecValue Then
            AFIELD := AFIELD + ' = (NVL(' + AFIELD + ',0) - ' + TrocaVPP(FloatToStr(AVALOR)) + ')'
         Else
            AFIELD := AFIELD + ' = ' + TrocaVPP(FloatToStr(AVALOR));



    if NOT ExecSQL( 'UPDATE SALDOORCADO'
                  + '   SET ' + AFIELD
                  + ' WHERE (IDPESSOA       = ' + FloatToStr( AIDPESSOA       ) + ')'
                  + '   AND (IDPLANOORCAMEN = ' + FloatToStr( AIDPLANOORCAMEN ) + ')'
                  + '   AND (IDCONTAORCAMEN = ' + QuotedStr ( AIDCONTAORCAMEN ) + ')'
                  + '   AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(ADATAREFERENCIA)) + ',''DD/MM/YYYY''))'
                  + '   AND (CHAVEAUX       = ' + FloatToStr(ACHAVEAUX)      + ')'
                  ) Then
       RAISE Exception.Create(MessageInfo);

  Except
    RAISE;
  End;
end;

procedure TCtrlSaldoOrcado.MovimentaValor(AFieldOrigem,
                                          AFieldDestino: String;
                                          AVALOR,
                                          AIDPESSOA,
                                          AIDPLANOORCAMEN: Double;
                                          AIDCONTAORCAMEN: String;
                                          ADATAREFERENCIA: TDateTime;
                                          ACHAVEAUX: Double;
                                          IDDESPESAORC    : INTEGER = 0; //MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
                                          PFLAGCOMPROMISSO: string = 'E');//MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290
var cdsVerifica : TClientDataSet;//Marcio Sanches Spinosa SOL 206429 KTN 1999836
    _ssql       : string;//MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
begin
  Try
    //Marcio Sanches Spinosa SOL 206429 KTN 1999836 - Inicio
    cdsVerifica := TClientDataSet.Create(nil);
    ////MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487 - Inicio
    _ssql := 'SELECT VLRCOMPROMETIDO FROM SALDOORCADO S' +
    ' WHERE S.IDPLANOORCAMEN= ' + FloatToStr( AIDPLANOORCAMEN ) +
    ' AND S.IDCONTAORCAMEN= ' + QuotedStr ( AIDCONTAORCAMEN ) +
    '   AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(ADATAREFERENCIA)) + ',''DD/MM/YYYY''))';

    if iddespesaorc > 0 then
      _ssql := _ssql + ' AND S.IDDESPESAORC = ' + inttostr(iddespesaorc);

    cdsVerifica.Data := GetDataPacket(_ssql);

//    cdsVerifica.Data := GetDataPacket('SELECT VLRCOMPROMETIDO FROM SALDOORCADO S' +
//    ' WHERE S.IDPLANOORCAMEN= ' + FloatToStr( AIDPLANOORCAMEN ) +
//    ' AND S.IDCONTAORCAMEN= ' + QuotedStr ( AIDCONTAORCAMEN ) +
//    '   AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(ADATAREFERENCIA)) + ',''DD/MM/YYYY''))');
    //MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487 - /fim
    //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290 - Inicio
    IF (PFLAGCOMPROMISSO <> 'A') then
    BEGIN
    //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290 - Fim
      IF ((cdsVerifica.FieldByName('VLRCOMPROMETIDO').value - AVALOR) >= 0 )then
      begin
        if Trim(AFieldOrigem) <> '' Then
           AFieldOrigem  := AFieldOrigem  + ' = (NVL(' + AFieldOrigem  + ',0) - ' + TrocaVPP(FloatToStr(AVALOR)) + ')';
      end
      else
      begin
        if Trim(AFieldOrigem) <> '' Then
           AFieldOrigem  := AFieldOrigem  + ' = (NVL(' + AFieldOrigem  + ',0) - ' + TrocaVPP(FloatToStr(0)) + ')';
      end;
    end
    else
    begin
    //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290 - Inicio
        if Trim(AFieldOrigem) <> '' Then
           AFieldOrigem  := AFieldOrigem  + ' = (NVL(' + AFieldOrigem  + ',0) - ' + TrocaVPP(FloatToStr(AVALOR)) + ')';
    //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290 - Fim
    end;
//    end;
    //Marcio Sanches Spinosa SOL 206429 KTN 1999836 - Fim

    if Trim(AFieldDestino) <> '' Then
       AFieldDestino := ', ' + AFieldDestino + ' = (NVL(' + AFieldDestino + ',0) + ' + TrocaVPP(FloatToStr(AVALOR)) + ')';

    if NOT ExecSQL( 'UPDATE SALDOORCADO'
                  + '   SET ' + AFieldOrigem  + AFieldDestino
                  //+ '   SET ' + AFieldOrigem  + ' = (NVL(' + AFieldOrigem  + ',0) - ' + TrocaVPP(FloatToStr(AVALOR)) + '), '
                  //+             AFieldDestino + ' = (NVL(' + AFieldDestino + ',0) + ' + TrocaVPP(FloatToStr(AVALOR)) + ')'
                  + ' WHERE (IDPESSOA       = ' + FloatToStr( AIDPESSOA       ) + ')'
                  + '   AND (IDPLANOORCAMEN = ' + FloatToStr( AIDPLANOORCAMEN ) + ')'
                  + '   AND (IDCONTAORCAMEN = ' + QuotedStr ( AIDCONTAORCAMEN ) + ')'
                  + '   AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(ADATAREFERENCIA)) + ',''DD/MM/YYYY''))'
                  + '   AND (CHAVEAUX       = ' + FloatToStr(ACHAVEAUX)      + ')'
                  ) Then
       RAISE Exception.Create(MessageInfo);

       FreeAndNil(cdsVerifica);

  Except
      RAISE;
  End;

end;

end.
