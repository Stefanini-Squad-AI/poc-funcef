{ Alterações
**********************************************************************
//Rotina: GeraFolha
//Nº SOL: 126964
//Nº KINTANA: 668955
//Data da Alteração: 29/01/2010
//Responsável: Marilza Colpani
//Descrição: Desvincular a flag FLGESPECIAL do módulo Folha de Pagamento,
//                 substituindo pelo flag FLGESPECIALFP, que receberá todos os
//                 valores da flag desvinculada.
//******************************************************************************
Analista.: Claudio Faria
Pendencia: 24663
Data.....: 25/2007
Rotina...: GeraFolha
Descrição: Gerar Folha apartir de uma lista.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18542
Data.....: 21/09/2007
Rotina...: GeraFolha
Descrição: Implementando mensagem ao usuário mostrando as rubricas especiais parametrizadas com li_
           nha de informe.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20091
Data.....: 06/07/2007
Rotina...: Várias
Descrição: Implementando a gravação do campo IdProcJud na LancIRRF.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24723
Data.....: 17/05/2007
Rotina...: GeraFolha
Descrição: Buscar o tipo de desembolso do favorecido na rubricaxplano quando for uma rubrica de IR.
           Caso essa parametrização não exista buscar da forma antiga.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24530
Data.....: 18/04/2007
Rotina...: GeraFolha
Descrição: Separar a gravação dos registros de aposentados/pensionistas dos registros de recebedor de
           pensão alimentícia.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23063
Data.....: 10/04/2007
Rotina...: ProcessaEstornos
Descrição: Processar apenas registros com data de pagamento anterior a data inicial da busca.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23017
Data.....: 09/04/2007
Rotina...: GeraFolha
Descrição: Ignorar a rubrica que tiver parametrizada com o informe de rendimento de 65 anos.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24174
Data.....: 09/04/2007
Rotina...: GeraFolha
Descrição: Utilizar a tabela InformeDePara para gravar a nova linha do informe caso a pessoa esteja
           em molestiagrave.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23989
Data.....: 04/04/2007
Rotina...: GeraFolha
Descrição: Alteração no update da histrubsal, onde coloaquei na condição o codirrfdarf a ser atuali_
           zado.
**********************************************************************
Analista.: Claudio Faria
Pendencia: 24617
Data.....: 05/03/2007
Rotina...: GeraFolha
Descrição: Ajuste na rotina para evitar um loop eterno
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24222
Data.....: 17/01/2007
Rotina...: GeraFolha
Descrição: Acerto na rotina que grava dedução por idade.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24221
Data.....: 16/01/2007
Rotina...: GeraFolha
Descrição: Alteração na forma de comparar se a pessoa é idosa ou não. 
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 24220
Data.....: 15/01/2007
Rotina...: GeraFolha
Descrição: Acerto na query que busca os valores já deduzidos (dedução por idade) no mês.
**********************************************************************
Analista.: Paulo Ramos
Pendencia: 23849
Data.....: 13/01/2007
Rotina...: GeraFolha
Descricao: Na busca de Folha de Pagamento fazer a validação dos dados
           contábeis e financeiros apenas para os IdInforme referentes a IR, que são
           registrados na LancIRRF. Estes registros são FLGIRRF = 'S'
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23696
Data.....: 07/11/2006
Rotina...: GeraFolha
Descrição: Não processar rubricas com flgespecial <> 0 para a folha de benefícios. 
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23668
Data.....: 01/11/2006
Rotina...: GeraFolha
Descrição: Alteração nos joins de idplanoprev da histrubsal com a partprevplan.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 22465
Data.....: 18/10/2006
Rotina...: ProcessaEstornos
Descrição: Não utilizar o campo PlaContaRecDesc. Usar agora o PlaConta.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19152
Data.....: 04/10/2006
Rotina...: GeraFolha
Descrição: Permitir a geração de folha de pagamento individualmente.
**********************************************************************
Analista.: Flavio Dias
Pendencia: 21712
Data.....: 08/06/2006
Rotina...: GeraFolha
Descrição: Acertar DECODE de FLGDESCONTO para considerar valor 2
**********************************************************************
Analista.: Flavio Dias
Pendencia: 21145
Data.....: 07/06/2006
Rotina...: GeraFolha
Descrição: Utilizar FLGISENTOIRRF para colocar rendimento como ISENTO
**********************************************************************
Analista.: Paulo Ramos
Pendencia: 21705
Data.....: 01/06/2006
Rotina...: GeraFolha
Descrição: Sempre apresentava erro na verificação da busca da Folha de Benefícios.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21705
Data.....: 10/05/2006
Rotina...: GeraFolha
Descrição: Retirei da query principal da busca da folha de pagamento a tabela
           ContabFolha e busco os parâmetros nesta tabela com outra query.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21705
Data.....: 02/04/2006
Rotina...: GeraFolha
Descrição: Utilizar a tabela ContabFolha para buscar parâmetros contábeis/finan_
           ceiros quando for uma busca para a folha de pagamento.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21366
Data.....: 31/03/2006
Rotina...: GeraFolha
Descrição: Buscar a diferença do último dia do mês da data de pagamento pela
           data de nascimento.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21445
Data.....: 22/03/2006
Rotina...: GeraFolha
Descrição: Inserir no cdsdet registro de dedução por idade apenas uma vez.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21550
Data.....: 16/02/2006
Rotina...: ProcessaEstornos
Descrição: Coloquei um NVL no flgestorno.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: Sem pendência
Data.....: 16/01/2006
Rotina...: GeraFolha
Descrição: Alterei o filtro da busca individual de idpessoa, para idresponsavel,
           já que é o idresponsavel que é utilizado no update da histrubsal.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21254
Data.....: 16/01/2006
Rotina...: GeraFolha
Descrição: Permitir fazer a busca por rubrica.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21192
Data.....: 10/01/2006
Rotina...: GeraFolha
Descrição: Acerto no decode para buscar o motivo da histrubsal, caso os condições
           anteriores do decode não sejam satisfeitas.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21171
Data.....: 02/01/2006
Rotina...: GeraFolha
Descrição: Mostrar mensagem de erro de parametrização para busca de cada módulo.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20594
Data.....: 05/12/2005
Rotina...: ProcessaEstornos
Descrição: Buscando a data de pagamento para passar para a função GravaIRRF a
           data de pagamento, caso seja um registro de estorno. 
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20156
Data.....: 13/09/2005
Rotina...: GeraFolha
Descrição: Alterar o sinal dos valores das rubricas informativas, igual aos
           valores das rubricas de desconto para o lançamento na LancxInforme
           ser feito corretamente.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19187 (Reabertura)
Data.....: 06/06/2005
Rotina...: GeraFolha
Descrição: Buscar da HistRubSal o campo Plano ao invés de buscar o idplanocontabil
           e colocá-lo no campo PlanoContab do dataset principal (cdsDocumentos).
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19348
Data.....: 30/05/2005
Rotina...: GeraFolha
Descrição: Buscar o idmotivo de abono, somente quando a rubrica de ir
           (FlgTipoDesc = 'I' e FlgTipoDesc = 'K') referente a abono.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19101 e 19102
Data.....: 10/05/2005
Rotina...: ProcessaEstornos
Descrição: Fazer o teste para saber se é para compensar ou não o estorno.
           Situações a não compensar: Décimo Terceiro ou ano de estorno diferente
                                      do ano de lançamento do irrf na lancirrf
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19187
Data.....: 05/05/2005
Rotina...: GeraFolha
Descrição: Buscar da HistRubSal o campo Plano ao invés de buscar o idplanocontabil
           e colocá-lo no campo PlanoContab do dataset principal (cdsDocumentos).
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18904
Data.....: 04/05/2005
Rotina...: GeraFolha
Descrição: Foi colocado um filtro pelo valorprovento, dependendo dos campos
           flgdesconto e flgespecial da provdesc
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19064
Rotina...: GeraFolha
Descrição: Esta função está recebendo mais um parâmetro, que indica se os campos
           CodIrrfDarf e IdInforme, serão buscados na ProvDesc ou somente na
           HistRubSal. Caso busque as informações da ProvDesc, será feita uma
           atualização destes campos na HistRubSal e depois será feito a busca
           normalmente nesta tabela.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18976
Rotina...: GeraFolha
Descrição: Buscar o CodCentroCusto na paramFolha e passar para a query
**********************************************************************
Analista.: Marchetti
Pendencia: 18649
Rotina...: GeraFolha
Descrição: Levar em consideracao o FLGDESCONTO para ser trazido na query como negativo
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 18382
Rotina...: GeraFolha
Descrição: Acerto na gravação para maiores de 65 anos
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 17801
Rotina...: GeraFolha
Descrição: Trazer o IDPROGRAMA quando a busca for da folha de beneficios
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 18111
Rotina...: GeraFolha
Descrição: Retirada a obrigatoriedade de indicação da versão da folha de benefícios.
           Testa se a parametro iVersao é <> -1
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 17976
Rotina...: GeraFolha
Descrição: Pegar o Plano Contabil ao inves do Plano Previdenciario na Folha de Benefícios
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 17881
Rotina...: GeraFolha
Descrição: Acertado o filtro da folha para buscar a rubrica com idinforme = 18
**********************************************************************
**********************************************************************
Analista.: Marchetti
Pendencia: 17354
Rotina...: ProcessaEstorno
Descrição: Criar processo para gerar os lançamentos de estorno da Folha de
           Benefício para compensação do DARF
**********************************************************************
}
unit uCtrlGeraFolha;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,uCtrlParamIRRF,
     uCtrLancIRRF, UDiasUteis, uCMMath, Classes,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};
  Type
    TCtrlGeraFolha = Class(TCmControlObject)

    private
      cdsDocumento : TclientDataSet;
      cdsAux : TclientDataSet;
      cdsAux1 : TclientDataSet;
      cdsAux2 : TclientDataSet;
      cdsAux3 : TclientDataSet;
      cdsAux4 : TclientDataSet; 
      cdsDet : TclientDataSet;
      cdsMantido : TclientDataSet;
      cdsParamFolha : TclientDataSet;  
      cdsPessFisica : TclientDataSet;
      cdsParamIRRF : TclientDataSet;
      cdsInformeDePara : TClientDataSet; 
      ParamIRRF : TCtrlParamIRRF;
      LancIRRF : TCtrLancIRRF;

      wAno, wMes, wDia : Word;
      procedure ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario: Integer; CodNatureza, DataIni : string; UsaPlanoPatro : Boolean);
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function GeraFolha(IdEmpresa        : LongInt;
                         iSistema         : integer;
                         DataIni,
                         DataFim,
                         CodNatureza      : string;
                         UsaPlanoPatro : Boolean;
                         iTipoFiltro,
                         iVersao          : Integer;
                         bBuscaProvDesc   : Boolean;
                         //iPessoa        : Integer; //CPrev - 24663
                         piIdListaUsuario : Integer; //CPrev - 24663
                         sCodRubricas: String) : Boolean;

      function strZero(TamanhoTexto : Integer; Texto : String) : String;  // preenche um valor com zeros a esquerda

      function EstaemTransacao: boolean;

      procedure Atualizaposicao (cTexto : String); 
      Procedure Linha; 

    protected

    End;

implementation
Uses
    FGeraFolhaMT;

{ TCtrlGeraFolha }

procedure TCtrlGeraFolha.AfterInitialize;
begin
  inherited;
  ParamIRRF.InitializeAs(self);
  LancIRRF.InitializeAs(self);
  ParamIRRF.OpenTransaction := False;
  LancIRRF.OpenTransaction := False;
end;


function TCtrlGeraFolha.EstaemTransacao: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;


constructor TCtrlGeraFolha.Create;
begin
  inherited;
  cdsDocumento    := TClientDataSet.Create(nil);
  cdsAux          := TClientDataSet.Create(nil);
  cdsAux1         := TClientDataSet.Create(nil);
  cdsAux2         := TClientDataSet.Create(nil);
  cdsAux3         := TClientDataSet.Create(nil);
  cdsAux4         := TClientDataSet.Create(nil);
  cdsDet          := TClientDataSet.Create(nil);
  cdsPessFisica   := TClientDataSet.Create(nil);
  cdsMantido      := TClientDataSet.Create(nil);
  cdsparamFolha   := TClientDataSet.Create(nil);  
  cdsParamIRRF    := TClientDataSet.Create(nil);
  cdsInformeDePara:= TClientDataSet.Create(nil);
  ParamIRRF       := TCtrlParamIRRF.create;
  LancIRRF        := TCtrLancIRRF.Create;
end;

destructor TCtrlGeraFolha.Destroy;
begin
  inherited;
  cdsDocumento.free;
  cdsAux.free;
  cdsAux1.free;
  cdsAux2.free;
  cdsAux3.free;
  cdsAux4.free;
  cdsDet.free;
  cdsPessFisica.free;
  cdsParamIRRF.free;
  ParamIRRF.free;
  LancIRRF.free;
  cdsInformeDePara.Free;
  cdsMantido.free;
  cdsParamFolha.free;  
end;

procedure TCtrlGeraFolha.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlGeraFolha.GeraFolha(IdEmpresa : LongInt;
                                  iSistema : integer;
                                  DataIni,
                                  DataFim,
                                  CodNatureza : string;
                                  UsaPlanoPatro : Boolean;
                                  iTipoFiltro,
                                  iVersao          : Integer;
                                  bBuscaProvDesc: Boolean;
                                  //iPessoa        : Integer; //CPrev - 24663
                                  piIdListaUsuario : Integer; //CPrev - 24663
                                  sCodRubricas: String) : Boolean;
                                  
var fPessoa, rValorLinha, iCodLanc, rValorLinhaSinal, rValIRRF,rValBase, rValorSinal:Double;
    fIdFoBenef, iLinhaInforme, fPatro, fPlanoPrev, fIdModulo, fIdMotivo, fIdPrograma: LongInt;
    fDataEfet,sNumDocumento,fCodNatur,fCodCentroCusto:String;
    ssqlParm : String;  
    bPrim : Boolean;
    dDataComparaIdade, 
    dDataIni, dDataFim : TDateTime;
    iAno,iMes,iDia : Word;
    sMolestiagrave,sAcima65 : String;
    bFaltaParmMolestia :boolean;
    bFaltaParmMais65   :boolean;
    bFaltaPrograma     : boolean;
    bProcessa, b65acumprimvez          : boolean;
    iPosicao : Integer; 
    iProcessado : Integer; 
    rValorTemp, rValorRend, rValorRend13 : Double; 
    ssqlaux4 : String; 
    sCodCentroRespon, sCodtiprecdes, sPlacontac : String; 
    iPlanoContab : Integer;
    bNaoebeneficio : boolean;
    bGravouValorIdoso : Boolean;

    fValorIdoso, fValorIdoso13, fValIdosoFixo       : Extended;
    fValorIdosoacum, fValorIdoso13acum              : Extended;

    nRecno  : TbookMark;
    iMeses : Integer;

    limotivofolha, limotivoabono : integer; 
    bMolestiaGrave,      
    bTemAcJud : Boolean; 
    fPercAcao : Extended; 

    iFlgPensaoAlim, 
    iLinhaRendAcJud, iLinhaRendAcJud13: Integer; 
    iIdProcJud : Integer; 

    lstRubricaEspecial : TStringList;
    iContLstRub : Integer;
    bAchouRub : Boolean;
    sSql : tStringList;
        
begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GeraFolha(IdEmpresa, iSistema,
                                             CodNatureza, UsaPlanoPatro, DataIni);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    DecodeDate(Date, wAno, wMes, wDia);
//    frmGeraFolhaMT.ProgressBar1.Position:=0;
//    frmGeraFolhaMT.ProgressBar1.Min:=0;
//    frmGeraFolhaMT.ProgressBar1.Max:=100;
//    frmGeraFolhaMT.ProgressBar1.update;
    frmGeraFolhaMT.lblcontagem.caption:='';
    frmGeraFolhaMT.lblcontagem.update;
    frmGeraFolhaMT.repaint;

    sSql := TStringList.Create;

    Linha;
    if iSistema = 0 then
      frmGeraFolhaMT.memResult.Lines.Add('BUSCA LANÇAMENTOS DA FOLHA DE FUNCIONÁRIOS')
    else
    Begin
      frmGeraFolhaMT.memResult.Lines.Add('BUSCA LANÇAMENTOS DA FOLHA DE BENEFÍCIOS');
      cdsAux.Data     := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''CODCCUSTOFINAN''');
      If cdsAux.FieldByName('VALORPARAM').AsString = '' Then
        fCodCentroCusto := ' '
      Else
        fCodCentroCusto := cdsAux.FieldByName('VALORPARAM').AsString;
      cdsAux.Data   := GetDataPacket('SELECT IDMOTIVOFOLHABEN, IDMOTIVOABONO '+
                                     ' FROM PARAMAPREV WHERE IDPESSOA =  '+InttoStr(Sistema.IdEmpresa));
      limotivofolha := cdsAux.fieldbyname('IDMOTIVOFOLHABEN').asinteger;
      limotivoabono := cdsAux.fieldbyname('IDMOTIVOABONO').asinteger;
    End;
    Linha;
    frmGeraFolhaMT.memResult.Lines.Add('Início do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
    Linha;
    frmGeraFolhaMT.memResult.Lines.Add('Parâmetros para a Busca dos Lançamentos :');
    Linha;

    lstRubricaEspecial := TStringList.Create;

    bFaltaParmMolestia := false;
    bFaltaParmMais65   := false;
    bFaltaPrograma     := False;
    bProcessa          := true;
    bGravouValorIdoso  := False;

    AtualizaPosicao ('VERIFICANDO OS PARÂMETROS DO SISTEMA. AGUARDE.');

    cdsParamIRRF.data := GetDataPacket('SELECT IDPROGRAMA FROM PROGRAMA WHERE FLGTIPOPROGRAMA = ''PRE''');

    cdsInformeDePara.Data := GetDataPacket('SELECT * FROM INFORMEDEPARA ORDER BY IDSITUACAO, IDINFORMEORIGEM '); 

    if cdsParamIRRF.IsEmpty then
    begin
      bFaltaPrograma := True;
      bProcessa := false;
    end;

    cdsParamIRRF.data := ParamIRRF.ProcurarParamIRRF(IdEmpresa);

    If (trim(cdsParamIrrf.fieldbyname('IDINFORMEMOLESTIA').asString) = '') then
    begin
      bfaltaParmMolestia := true;
      bProcessa := false;
    end
    else
    begin
      sMolestiagrave := Inttostr(cdsParamIrrf.fieldbyname('IDINFORMEMOLESTIA').asInteger);

      iLinhaRendAcJud   := cdsParamIrrf.fieldbyname('IDINFORMEACJUD').asInteger;
      iLinhaRendAcJud13 := cdsParamIrrf.fieldbyname('IDINFORMEACJUD13').asInteger;
    End;

    If (trim(cdsParamIrrf.fieldbyname('IDINFORME65ANOS').asString) = '') then
    begin
      bFaltaParmMais65 := true;
      bProcessa := false;
    end
    else
      sAcima65 := Inttostr(cdsParamIrrf.fieldbyname('IDINFORME65ANOS').asInteger);

    ssqlParm := 'SELECT NVL(VALORPARAM,0) AS PARMRESGATE FROM PARAMFOLHA  ' + #13#10 +
                'WHERE IDFUNDACAO = ' + InttoStr(Sistema.IdEmpresa)         + #13#10 +
                ' AND NOMEPARAM = ''FLGCALCULAIRRESGATEISENTO''';

    cdsParamFolha.data   := GetDataPacket(SsqlParm);
    Result := True;
    dDataIni := StrToDate(DataIni);
    dDataFim := strTodate(DataFim);

    If bBuscaProvDesc Then
    Begin
      sSql.Text := ' UPDATE HISTRUBSAL H '                                                                    + #13#10 +
                   ' SET H.IDINFORME   = (SELECT IDINFORME   FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA), ' + #13#10 +
                   '     H.CODIRRFDARF = (SELECT CODIRRFDARF FROM PROVDESC WHERE IDPROVENTO = H.IDRUBRICA)  ' + #13#10 +
                   ' WHERE EXISTS (SELECT 1 FROM PROVDESC P '                                                 + #13#10 +
                   '               WHERE P.IDPROVENTO       = H.IDRUBRICA '                                   + #13#10 +
                   '                 AND P.CODIRRFDARF IS NOT NULL '                                          + #13#10 +
                   '                 AND P.IDINFORME   IS NOT NULL) '                                         + #13#10 +
                   '   AND (H.IDLANCIRRF      IS NULL) '                                                      + #13#10 +
                   '   AND (H.DATAPAGAMENTO   >= TO_DATE('''+DateToStr(dDataIni)+''',''DD/MM/YYYY'')) '       + #13#10 +
                   '   AND (H.DATAPAGAMENTO   <= TO_DATE('''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) '       + #13#10;

      If Pos(',', sCodRubricas) > 0 Then
      Begin
        If Trim(sCodRubricas) <> '' Then
          sSql.Text := sSql.Text + '   AND (H.IDRUBRICA       IN (' + sCodRubricas + ')) ' + #13#10;
      End
      Else
        If Trim(sCodRubricas) <> '' Then
          sSql.Text := sSql.Text + '   AND (H.IDRUBRICA       = ' + sCodRubricas + ') ' + #13#10;

      sSql.Text := sSql.Text + '   AND ((H.CODIRRFDARF    IS NULL) OR ' + #13#10 +
                               '        (H.IDINFORME      IS NULL)) ';

      //CPrev - 24663 - Inicio
      //If iPessoa > 0 then
      //  ssql := ssql + ' AND (H.IDPESSOA        = '+Inttostr(iPessoa)+' ) ';
      If piIdListaUsuario > 0 Then
        sSql.Text := sSql.Text + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                       + #13#10 +
                                              ' WHERE H.IDTITULAR     = LD.IDTITULAR '                      + #13#10 +
                                              ' AND H.IDRESPONSAVEL = LD.IDPESSOA '                       + #13#10 +
                                              ' AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') ' + #13#10;
      //CPrev - 24663 - Fim

      if iVersao >= 0 then
        sSql.Text := sSql.Text + ' AND (H.IDHSTFOLHABENEF = '+IntToStr(iVersao)+') ';

      if iSistema = 1 then
        sSql.Text := sSql.Text + '   AND (H.IDMODULO        = 18) ' + #13#10
      else
        sSql.Text := sSql.Text + '   AND (H.IDMODULO        = 21) ' + #13#10;

      if not ExecSQL(sSql.Text) then
        Raise Exception.Create(messageinfo);
      sSql.Clear;
    End;

    If bProcessa then
    begin
      frmGeraFolhaMT.memResult.Lines.Add('Linha do Informe para Maiores de 65 anos : PREENCHIDA');
      frmGeraFolhaMT.memResult.Lines.Add('Linha do Informe para Moléstia Grave     : PREENCHIDA');
      Linha;
      AtualizaPosicao ('SELECIONANDO DADOS. AGUARDE.');

      if iSistema = 0 then
      Begin   // FOLHA DE PAGAMENTOS - INICIO
        Ssql.Text := 'SELECT '+
                     'ABS(SUM(H.VALORPROVENTO * DECODE(PD.FLGDESCONTO,1,-1,1))) AS VALOR, '+
                     'SUM(H.VALORPROVENTO * '                                                                + #13#10 +
                     '  DECODE(I.CODDIRF, 22, '                                                              + #13#10 +
                     '    DECODE(PD.FLGDESCONTO, 0, 1, -1), 16, '                                            + #13#10 +
                     '      DECODE(PD.FLGDESCONTO, 0, 1, -1), 23, '                                          + #13#10 +
                     '         DECODE(PD.FLGDESCONTO, 0, 1, -1), 24, '                                       + #13#10 +
                     '            DECODE(PD.FLGDESCONTO, 0, 1, -1), 25, '                                    + #13#10 +
                     '              DECODE(PD.FLGDESCONTO, 0, 1, -1), 01, '                                  + #13#10 +
                     '                DECODE(PD.FLGDESCONTO, 2, DECODE(PD2.FLGDESCONTO,1,1,-1), -1),'        + #13#10 +
                     '                DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALORSINAL, '                    + #13#10 +
                     'H.IDINFORME, '+
                     'H.IDPESSOA, '+
                     'H.DATAPAGAMENTO, '+
                     'PG.IDPATRO AS IDPESSJUR, '+
                     'I.FLGIRRF, '+
                     'I.FLGBASE, '+
                     'H.IDHSTFOLHABENEF, '+
                     'P.NUMDOCUMENTO, '+
                     'H.CODIRRFDARF, '+
                     'H.IDMOTIVO, '+
                     'CC.IDPROGRAMA, '+
                     'PG.IDPATRO, '+
                     'PG.IDPLANOPREV, '+
                     'H.IDMODULO, '+
                     'I.CODDIRF, '+
                     'F.CODCENTROCUSTO, '+
                     'PD.CODPROVDESC,  '+
                     'PD.IDPROVENTO, '+
                     //Marilza Colpani - SOL 126964/KTN 668955
//                     'PD.FLGESPECIAL, '+#13#10+
                     'PD.FLGESPECIALFP, '+#13#10+
                     'PD.FLGDESCONTO '+
                     ', 0 AS FLGPENSAOALIM '+ #13#10 +

                     ' ,0 AS PERCACAO '+#13#10+
                     ' ,0 AS TEMACAO '+#13#10+

                     'FROM HISTRUBSAL  H, '                                                                       + #13#10 +
                     '     PARAMGLOBAL PG, '                                                                      + #13#10 +
                     '     PROVDESC    PD, '                                                                      + #13#10 +
                     '     PROVDESC    PD2, '                                                                     + #13#10 +
                     '     INFORME     I, '                                                                       + #13#10 +
                     '     PESSOA      P, '                                                                       + #13#10 +
                     '     FUNCIONARIO F, '                                                                       + #13#10 +
                     '     CENTCUST    CC '                                                                       + #13#10 +
                     'WHERE (H.IDRUBRICA   = PD.IDPROVENTO) '                                                     + #13#10 +
                     '  AND (PD.IDPROVENTOEXCESSODEB = PD2.IDPROVENTO(+)) '                                       + #13#10 +
                     '  AND (H.IDMODULO    = 21) '                                                                + #13#10 +
                     '  AND (I.IDINFORME   = H.IDINFORME) '                                                       + #13#10 +
                     '  AND (H.IDLANCIRRF  IS NULL) '                                                             + #13#10;

        //CPrev - 24663 - Inicio

        // Alterado Por Arnaldo V. Scarin - SOL 108810 - Kintana 523975
        // Devido ao fato de poderem existir mais de um cpf para o mesmo usuário,
        // é necessário fazer esse tipo de sub-select, para termos certeza que lancamentos
        // feitos para um idpessoa que não seja o primeiro, no caso de cpf duplicado,
        // possam ser encontrados. Exemplo: CPF: 037.302.708-77
        If piIdListaUsuario > 0 Then
        begin
//          sSql:= sSql + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                                  + #13#10 +
//                                  //CPrev - Pend. 24663 - ' WHERE H.IDTITULAR     = LD.IDTITULAR '                                 + #13#10 +
//                                  //CPrev - Pend. 24663 -  ' AND H.IDRESPONSAVEL = LD.IDPESSOA '                                  + #13#10 +
//                                    ' WHERE H.IDPESSOA      = LD.IDPESSOA '                                  + #13#10 + //CPrev - Pend. 24663
//                                      ' AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') '            + #13#10;

          sSql.Text := sSql.Text + ' and (H.IDpessoa in (Select IdPessoa' + #13#10+
                                   '                      From pessoa' + #13#10+
                                   '                      where NUMDOCUMENTO in ( SELECT Numdocumento' + #13#10+
                                   '                                              from Pessoa pe,' + #13#10+
                                   '                                                   LISTAFOLHABENEFDET LD' + #13#10+
                                   '                                              Where pe.idpessoa = ld.idpessoa' + #13#10+
                                   '                                                AND (LD.IDLISTA = '+ IntToStr(piIdListaUsuario) +')))) '                      + #13#10;


        end;
        //CPrev - 24663 - Fim
        If iTipoFiltro = 1 then
          sSql.Text := sSql.Text + ' AND (H.CODIRRFDARF = '+QuotedStr(CodNatureza)+') ';

        If Pos(',', sCodRubricas) > 0 Then
        Begin
          If Trim(sCodRubricas) <> '' Then
            sSql.Text := sSql.Text + '  AND (H.IDRUBRICA IN ('+sCodRubricas+')) ';
        End
        Else
          If Trim(sCodRubricas) <> '' Then
            sSql.Text := sSql.Text + '  AND (H.IDRUBRICA = '+sCodRubricas+') ';

        sSql.Text := sSql.Text + '   AND (F.CODCENTROCUSTO =  CC.CODCENTROCUSTO(+)) '                                        + #13#10 +
                                 '   AND (F.IDEMPRESA      =  CC.IDEMPRESA(+)) '                                             + #13#10 +
                                 '   AND (F.IDPESSOA       =  H.IDPESSOA) '                                                  + #13#10 +
                                 '   AND ((H.FLGESTORNO    =  0) OR (H.FLGESTORNO IS NULL)) '                                + #13#10 +
                                 '   AND (P.IDPESSOA       =  H.IDPESSJUR) '                                                 + #13#10 +
                                 '   AND (H.DATAPAGAMENTO  >= TO_DATE('+quotedStr(DateTostr(dDataIni))+',''DD/MM/YYYY'') ) ' + #13#10 +
                                 '   AND (H.DATAPAGAMENTO  <= TO_DATE('+quotedStr(DateTostr(dDataFim))+',''DD/MM/YYYY'') ) ' + #13#10 +
                                 '   AND (PG.IDPESSOA      = '+IntToStr(IdEmpresa)+' ) '                                     + #13#10 +
                                 '   AND (H.IDPESSJUR      = '+IntToStr(IdEmpresa)+' ) '                                     + #13#10 +
                                 ' GROUP BY H.IDINFORME, '                                                                   + #13#10 +
                                 '          H.IDPESSOA, '                                                                    + #13#10 +
                                 '          H.IDPESSJUR, '                                                                   + #13#10 +
                                 '          I.FLGIRRF, '                                                                     + #13#10 +
                                 '          I.FLGBASE, '                                                                     + #13#10 +
                                 '          H.IDHSTFOLHABENEF, '                                                             + #13#10 +
                                 '          I.CODDIRF, '                                                                     + #13#10 +
                                 '          H.IDMOTIVO, '                                                                    + #13#10 +
                                 '          F.CODCENTROCUSTO, '                                                              + #13#10 +
                                 '          CC.IDPROGRAMA, '                                                                 + #13#10 +
                                 '          P.NUMDOCUMENTO, '                                                                + #13#10 +
                                 '          PG.IDPLANOPREV, '                                                                + #13#10 +
                                 '          H.CODIRRFDARF, '                                                                 + #13#10 +
                                 '          PG.IDPATRO, '                                                                    + #13#10 +
                                 '          H.IDMODULO, '                                                                    + #13#10 +
                                 '          PD.CODPROVDESC, '                                                                + #13#10 +
                                 '          PD.IDPROVENTO,  '                                                                + #13#10 +
                                 '          H.DATAPAGAMENTO, '                                                               + #13#10 +
                                 //Marilza Colpani - SOL 126964/KTN 668955
//                                 '       PD.FLGESPECIAL, '+#13#10+
                                 '       PD.FLGESPECIALFP, '+#13#10+
                                 '          PD.FLGDESCONTO '                                                                 + #13#10 +
                                 ' ORDER BY H.IDPESSOA, '                                                                    + #13#10 +
                                 '          H.IDHSTFOLHABENEF, '                                                             + #13#10 +
                                 '          H.DATAPAGAMENTO, '                                                               + #13#10 +
                                 '          H.CODIRRFDARF, '                                                                 + #13#10 +
                                 '          H.IDMOTIVO, '                                                                    + #13#10 +
                                 '          PG.IDPLANOPREV, '                                                                + #13#10 +
                                 '          PG.IDPATRO, '                                                                    + #13#10 +
                                 '          F.CODCENTROCUSTO, '                                                              + #13#10 +
                                 '          CC.IDPROGRAMA '                                                                  + #13#10;
      // FOLHA DE PAGAMENTOS - FIM
      end
      else
      Begin
      // FOLHA DE BENEFICIOS  - INICIO
        SSql.Text := 'SELECT '+
                     'ABS(SUM(DECODE(H.VALORPROVENTO,0,DECODE(H.FLGDESCONTO,2,H.VALORINFO,H.VALORPROVENTO),H.VALORPROVENTO) * '+
                             ' DECODE(PD.FLGDESCONTO,1,-1,1))) AS VALOR, '+
                     '   SUM(DECODE(H.VALORPROVENTO, 0, '                                                           + #13#10 +
                     '         DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) * '         + #13#10 +
                     '           DECODE(I.CODDIRF, 22, '                                                            + #13#10 +
                     '             DECODE(PD.FLGDESCONTO, 0, 1, -1), 16, '                                          + #13#10 +
                     '               DECODE(PD.FLGDESCONTO, 0, 1, -1), 23, '                                        + #13#10 +
                     '                 DECODE(PD.FLGDESCONTO, 0, 1, -1), 24, '                                      + #13#10 +
                     '                   DECODE(PD.FLGDESCONTO, 0, 1, -1), 25, '                                    + #13#10 +
                     '                     DECODE(PD.FLGDESCONTO, 0, 1, -1),01, '                                   + #13#10 +
                     '                       DECODE(PD.FLGDESCONTO, 2, DECODE(PD2.FLGDESCONTO,1,1,-1), -1),'        + #13#10 +
                     '                       DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALORSINAL, '                    + #13#10 +
                     'H.IDINFORME, '+
                     'H.IDRESPONSAVEL AS IDPESSOA, '+
                     'H.IDRESPONSAVEL, '+
                     'H.IDHSTFOLHABENEF, '+
                     '    DECODE(H.FLGTIPODESC, ''I'', DECODE(SUBSTR(H.MES, 6, 2), ''13'', '+
                     inttostr(limotivoabono)+', '+inttostr(limotivofolha)+'), '+
                     ' DECODE(H.FLGTIPODESC, ''K'', DECODE(SUBSTR(H.MES, 6, 2), ''13'', '+
                     inttostr(limotivoabono)+', '+
                     inttostr(limotivofolha)+'), '+
                     '       H.IDMOTIVO )) AS IDMOTIVO, '                                                                              + #13#10 +
                     '       H.IDPATRO AS IDPESSJUR, '                                                                                 + #13#10 +
                     '       H.IDPATRO, '                                                                                              + #13#10 +
                     '       H.DATAPAGAMENTO,'                                                                                         + #13#10 +
                     '       I.FLGIRRF, '                                                                                              + #13#10 +
                     '       I.FLGBASE, '                                                                                              + #13#10 +
                     '       I.CODDIRF, '                                                                                              + #13#10 +
                     '       P.NUMDOCUMENTO, '                                                                                         + #13#10 +
                     '       H.CODIRRFDARF, '                                                                                          + #13#10 +
                     '       DECODE(H.IDPLANOCONTABIL,NULL,PP.IDPLANOPREV,H.IDPLANOCONTABIL) AS IDPLANOPREV, '                         + #13#10 +
                     '       H.IDMODULO, '                                                                                             + #13#10 +
                             QuotedStr(fCodCentroCusto) + ' AS CODCENTROCUSTO, '                                                       + #13#10 +
                     '       PRG.IDPROGRAMA, '                                                                                         + #13#10 +
                     '       H.FLGMOLESTIAGRAVE, '                                                                                     + #13#10 +
                     '       PD.CODPROVDESC, '                                                                                         + #13#10 +
                     '       PD.IDPROVENTO, '                                                                                          + #13#10 + // P.16736
                     '       H.VALORINFO,  '                                                                                           + #13#10 + // P.16207
                     '       DECODE(PD.FLGDESCONTO,0,NVL(H.PLACONTAD,RX.PLACONTAD),NVL(H.PLACONTAC,RX.PLACONTAC)) AS PLACONTAC, '      + #13#10 + // P.15761
                     '       DECODE(H.FLGTIPODESC, ''I'', '                                                                            + #13#10 +
                     '         DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), '                           + #13#10 +
                     '           DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)) AS CODTIPRECDES, '               + #13#10 +
                     '       DECODE(H.PLANO,NULL,RX.PLANO, H.PLANO) AS PLANOCONTAB, '                                                  + #13#10 +
                     '       PD.FLGDESCONTO, '                                                                                         + #13#10 +
                     //Marilza Colpani - SOL 126964/KTN 668955
//                     '       PD.FLGESPECIAL, '                                                                                         + #13#10 +
                     '       PD.FLGESPECIALFP, '                                                                                         + #13#10 +
                     '       H.CODCENTRORESPON, '                                                                                      + #13#10 +
                     '       PR.PERCACAO, '                                                                                            + #13#10 +
                     '       DECODE(NVL(PR.PERCACAO, 0), 0, 0, 1) AS TEMACAO, '                                                        + #13#10 +
                     {Neste momento entendemos que não seria necessário separar os registros do alimentan_
                      nte, por isso gravaremos somente 0 para recebedor de benefícios/pensões e 2 para o
                      recebedor de pensão alimentícia, ou seja, o alimentado                            }
                     '       DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0) AS FLGPENSAOALIM, '                                        + #13#10 +
                     '       PR2.IDPROCJUD '                                                                                           + #13#10 +
                     'FROM HISTRUBSAL H, '                                                                                             + #13#10 +
                     '     PARTPREVPLAN PP, '                                                                                          + #13#10 +
                     '     PROVDESC PD, '                                                                                              + #13#10 +
                     '     PROVDESC PD2, '                                                                                             + #13#10 +
                     '     INFORME I, '                                                                                                + #13#10 +
                     '     PROGRAMA PRG, '                                                                                             + #13#10 +
                     '     PESSOA P, '                                                                                                 + #13#10 +
                     '     RUBRICAXPLANO RX, '                                                                                         + #13#10 +
                     '     PROCJUD PR, '                                                                                               + #13#10 +
                     '     PROCJUD PR2 '                                                                                               + #13#10 +
                     'WHERE (H.IDRUBRICA             = PD.IDPROVENTO) '                                                                    + #13#10 +
                     '  AND (PD.IDPROVENTOEXCESSODEB = PD2.IDPROVENTO(+)) '                                                            + #13#10 +
                     '  AND (I.IDINFORME             = H.IDINFORME) '                                                                      + #13#10 +
                     '  AND (PRG.FLGTIPOPROGRAMA     = ''PRE'') '                                                                          + #13#10 +
                     '  AND (H.IDMODULO              = 18) '                                                                               + #13#10;

        If iTipoFiltro = 1 then
          sSql.Text := sSql.Text + '  AND (H.CODIRRFDARF       = ' + QuotedStr(CodNatureza) + ') ';

        If Pos(',', sCodRubricas) > 0 Then
        Begin
          If Trim(sCodRubricas) <> '' Then
            sSql.Text := sSql.Text + '  AND (H.IDRUBRICA IN ('+sCodRubricas+')) ';
        End
        Else
          If Trim(sCodRubricas) <> '' Then
            sSql.Text := sSql.Text + '  AND (H.IDRUBRICA = '+sCodRubricas+') ';

        sSql.Text := sSql.Text + '  AND ((H.FLGESTORNO       = 0) OR (H.FLGESTORNO IS NULL)) ' + #13#10 +
                                 '  AND (H.IDLANCIRRF        IS NULL) '                        + #13#10 +
                                 '  AND (H.IDPESSJUR         = '+IntToStr(IdEmpresa)+' ) '     + #13#10 +
                                 '  AND (P.IDPESSOA          = H.IDPESSJUR) '                  + #13#10;

        if iVersao <> -1 then
          sSql.Text := sSql.Text + '  AND (H.IDHSTFOLHABENEF   = ' + IntToStr(iVersao) + ' ) ';

        // CPrev - 24663 - Inicio
        If piIdListaUsuario > 0 Then
        begin
          sSql.Text := sSql.Text + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                                             + #13#10 +
                                               ' WHERE (H.IDTITULAR     = LD.IDTITULAR) '                                         + #13#10 +
                                               ' AND (H.IDRESPONSAVEL = LD.IDPESSOA) '                                            + #13#10 +
                                               ' AND (LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +')) '                      + #13#10;
        end;
        //CPrev - 24663 - Fim

        sSql.Text := sSql.Text + '  AND (H.DATAPAGAMENTO     >= TO_DATE('+quotedStr(DateTostr(dDataIni))+',''DD/MM/YYYY'') ) '     + #13#10 +
                                 '  AND (H.DATAPAGAMENTO     <= TO_DATE('+quotedStr(DateTostr(dDataFim))+',''DD/MM/YYYY'') ) '     + #13#10 +
                                 '  AND (PP.IDPESSJUR        = H.IDPATRO) '                                                        + #13#10 +
                                 '  AND (PP.IDPESSOA         = H.IDTITULAR) '                                                      + #13#10 +
                                 '  AND ( (PP.IDPLANOPREV    = H.IDPLANOPREV   AND H.IDTITULAR   = H.IDPESSOA) '                   + #13#10 +
                                 '     OR (PP.IDPLANOPREV    = H.IDPLANOORIGEM AND H.IDTITULAR  <> H.IDPESSOA)) '                  + #13#10 +
                                 '  AND (RX.IDPESSJUR(+)     = H.IDPATRO) '                                                        + #13#10 +
                                 '  AND (RX.IDRUBRICA(+)     = H.IDRUBRICA) '                                                      + #13#10 +
                                 '  AND (RX.IDPLANOPREV(+)   = H.IDPLANOPREV) '                                                    + #13#10 +
                                 '  AND (((PD.FLGDESCONTO    IN (0, 1)) AND '                                                      + #13#10 +
                                 //Marilza Colpani - SOL 126964/KTN 668955
//                                 '       (PD.FLGESPECIAL     = 0)      AND '                                                       + #13#10 +
                                 '       (PD.FLGESPECIALFP   = 0)      AND '                                                       + #13#10 +
                                 '       (H.VALORPROVENTO    > 0)) OR      '                                                       + #13#10 +
                                 '       ((PD.FLGDESCONTO    = 2)      AND '                                                       + #13#10 +
                                 //Marilza Colpani - SOL 126964/KTN 668955
//                                 '        (PD.FLGESPECIAL    <> 0)))       '                                                       + #13#10 +
                                 '        (PD.FLGESPECIALFP    <> 0)))       '                                                       + #13#10 +
                                 '  AND (H.IDINFORME IS NOT NULL)        '                                                         + #13#10 +
                                 ' AND (H.IDRESPONSAVEL = PR.IDPESSOA(+)) '+#13#10+
                                 ' AND (H.IDPROCJUD     = PR2.IDPROCJUD(+)) '+#13#10+
                                 'GROUP BY H.IDINFORME, '                                                                          + #13#10 +
                                 '         H.IDRESPONSAVEL, '                                                                      + #13#10 +
                                 '          H.IDPESSJUR, '                                                                         + #13#10 +
                                 '         I.FLGIRRF, '                                                                            + #13#10 +
                                 '         I.FLGBASE, '                                                                            + #13#10 +
                                 '         P.NUMDOCUMENTO, '                                                                       + #13#10 +
                                 '         DECODE(H.IDPLANOCONTABIL,NULL,PP.IDPLANOPREV,H.IDPLANOCONTABIL), '                      + #13#10 +
                                 '         H.CODIRRFDARF, '                                                                        + #13#10 +
                                 '         H.IDPATRO, '                                                                            + #13#10 +
                                 '         H.IDMODULO, '                                                                           + #13#10 +
                                 '         DECODE(H.FLGTIPODESC, ''I'', DECODE(SUBSTR(H.MES, 6, 2), ''13'', '                      + #13#10 +
                                           IntToStr(limotivoabono)+', '+inttostr(limotivofolha)+'), '                              + #13#10 +
                                 '         DECODE(H.FLGTIPODESC, ''K'', DECODE(SUBSTR(H.MES, 6, 2), ''13'', '                      + #13#10 +
                                           IntToStr(limotivoabono) + ', '                                                          + #13#10 +
                                           IntToStr(limotivofolha) + '), '                                                         + #13#10 +
                                 '         H.IDMOTIVO )), '                                                                        + #13#10 +
                                 '         H.IDHSTFOLHABENEF, '                                                                    + #13#10 +
                                 '         I.CODDIRF, '                                                                            + #13#10 +
                                 '         H.DATAPAGAMENTO, '                                                                      + #13#10 +
                                 '         PRG.IDPROGRAMA , '                                                                      + #13#10 +
                                 '         H.FLGMOLESTIAGRAVE , '                                                                  + #13#10 +
                                 '         PD.CODPROVDESC, '                                                                       + #13#10 +
                                 '         PD.IDPROVENTO, '                                                                        + #13#10 +
                                 '         H.VALORINFO ,    '                                                                      + #13#10 +
                                 '          DECODE(PD.FLGDESCONTO,0,NVL(H.PLACONTAD,RX.PLACONTAD),NVL(H.PLACONTAC,RX.PLACONTAC)), '+#13#10+
                                 '         DECODE(H.FLGTIPODESC, ''I'', '                                                          + #13#10 +
                                 '           DECODE(TRIM(RX.CODTIPRECDESFAV), '''', H.CODTIPRECDES, RX.CODTIPRECDESFAV), '         + #13#10 +
                                 '             DECODE(TRIM(H.CODTIPRECDES), '''', RX.CODTIPRECDES, H.CODTIPRECDES)), '             + #13#10 +
                                 '    DECODE(H.PLANO,NULL,RX.PLANO, H.PLANO), '+#13#10+
                                 '           PD.FLGDESCONTO, '                                                                     + #13#10 +
                                 //Marilza Colpani - SOL 126964/KTN 668955
//                                 '          PD.FLGESPECIAL, '+#13#10+
                                 '          PD.FLGESPECIALFP, '+#13#10+
                                 '          H.CODCENTRORESPON, '                                                                   + #13#10 +
                                 '    PR.PERCACAO, '                                                                               + #13#10 +
                                 '    DECODE(H.FLGPENSAOALIM, 2, H.FLGPENSAOALIM, 0), '                                            + #13#10 +
                                 '    PR2.IDPROCJUD '                                                                              + #13#10 +
                                 'ORDER BY H.IDRESPONSAVEL, '                                                                      + #13#10 +
                                 '         H.IDHSTFOLHABENEF, '                                                                    + #13#10 +
                                 '         H.DATAPAGAMENTO, '                                                                      + #13#10 +
                                 '         IDMOTIVO, '                                                                             + #13#10 +
                                 '         I.FLGIRRF DESC, '                                                                       + #13#10 +
                                 '         H.CODIRRFDARF, '                                                                        + #13#10 +
                                 '         IDPLANOPREV, '                                                                          + #13#10 +
                                 '         H.IDPATRO, '                                                                            + #13#10 +
                                 '         PRG.IDPROGRAMA, '                                                                       + #13#10 +
                                 '         FLGPENSAOALIM '                                                                         + #13#10;

        // FOLHA DE BENEFICIOS  - FIM
      end;

//      sSql.SaveToFile('C:\Busca_Folha_pagamento.sql');

      cdsDocumento.data := GetDataPacket(Ssql.Text);
//      frmGeraFolhaMT.ProgressBar1.Position:=0;
//      frmGeraFolhaMT.ProgressBar1.Max:=cdsDocumento.RecordCount;
      sSql.Clear;
      frmGeraFolhaMT.Repaint;
      iProcessado := 0;
      cdsDocumento.First;
      iPosicao := 0;
      // PROCESSAMENTO PRINCIPAL - INICIO


      If not cdsDocumento.eof then
      begin
        if ((not bBuscaProvDesc) and (iSistema = 1)) or (iSistema = 0) Then 
        Begin
          // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - INICIO
          AtualizaPosicao ('VERIFICANDO A CONSISTENCIA DOS DADOS. AGUARDE');
          cdsDocumento.First;

          While not cdsDocumento.EOF do
          begin
            If cdsdocumento.fieldbyname('FLGDESCONTO').asinteger <> 2 then  
            begin  
              If iSistema = 0 Then
              Begin
                //FAZER ESTA VALIDACAO DOS DADOS CONTABEIS E FINANCEIROS APENAS
                //PARA O INFORME REFERENTE AO IR, CUJO VALOR É LANCADO NA LANCIRRF.
                If cdsDocumento.FieldByName('FLGIRRF').AsString = 'S' then
                begin
                  If cdsDocumento.FieldByName('FLGDESCONTO').AsInteger = 0 Then
                    cdsAux.Data := GetDataPacket(' SELECT NVL(CONTACREDITO, 0) AS PLACONTAC, CODCENTRORESPON, NVL(IDPLANO1, IDPLANO2) AS PLANOCONTAB, CODTIPRECDES '+
                                               ' FROM CONTABFOLHA '+
                                               ' WHERE (CODCENTROCUSTO = '+cdsDocumento.FieldByName('CODCENTROCUSTO').AsString+' OR '+
                                                 ' CODCENTROCUSTO IS NULL) '+
                                                 ' AND IDPROVENTO     = '+cdsDocumento.FieldByName('IDPROVENTO').AsString+
                                                 ' ORDER BY PLACONTAC DESC ')
                  else
                    cdsAux.Data := GetDataPacket(' SELECT NVL(CONTACREDITO, 0) AS PLACONTAC, CODCENTRORESPON, NVL(IDPLANO1, IDPLANO2) AS PLANOCONTAB, CODTIPRECDES '+
                                               ' FROM CONTABFOLHA '+
                                               ' WHERE (CODCENTROCUSTO = '+cdsDocumento.FieldByName('CODCENTROCUSTO').AsString+' OR '+
                                                 ' CODCENTROCUSTO IS NULL) '+
                                                 ' AND IDPROVENTO     = '+cdsDocumento.FieldByName('IDPROVENTO').AsString+
                                                 ' ORDER BY PLACONTAC DESC ');
                

                  If (trim(cdsDocumento.fieldbyname('CODIRRFDARF').asstring) = '') or
                     (Trim(cdsAux.FieldByName('CODCENTRORESPON').AsString)   = '') or
                     (Trim(cdsAux.FieldByName('PLACONTAC').AsString)         = '') or
                     (Trim(cdsAux.FieldByName('PLANOCONTAB').AsString)       = '') then
                  begin
                    If trim(cdsdocumento.fieldbyname('CODIRRFDARF').asstring) = '' Then
                      frmGeraFolhaMT.memResult.Lines.Add('A Rubrica '+cdsdocumento.fieldbyname('IDPROVENTO').asstring+
                                                         ' está sem a informação de Natureza de Rendimentos preenchida.'+
                                                         ' Favor verificar no Sistema de Folha de Pagamento de Funcionários.');
  
                    If Trim(cdsAux.FieldByName('CODCENTRORESPON').AsString) = '' Then
                      frmGeraFolhaMT.memResult.Lines.Add('A Rubrica '+cdsdocumento.fieldbyname('IDPROVENTO').asstring+
                                                         ' está sem a informação de Centro de Responsabilidade preenchida.'+
                                                         ' Favor verificar no Sistema de Folha de Pagamento de Funcionários.');
  
                    If cdsAux.FieldByName('PLACONTAC').AsString = '' Then
                      frmGeraFolhaMT.memResult.Lines.Add('A Rubrica '+cdsdocumento.fieldbyname('IDPROVENTO').asstring+
                                                         ' está sem a informação de Conta Contábil preenchida.'+
                                                         ' Favor verificar no Sistema de Folha de Pagamento de Funcionários.');
  
                    If cdsAux.FieldByName('PLANOCONTAB').AsString = '' Then
                      frmGeraFolhaMT.memResult.Lines.Add('A Rubrica '+cdsdocumento.fieldbyname('IDPROVENTO').asstring+
                                                         ' está sem a informação de Plano Contábil preenchida.'+
                                                         ' Favor verificar no Sistema de Folha de Pagamento de Funcionários.');
                    bProcessa := false;
                  End;
                End;
              End
              Else
              Begin
                If trim(cdsdocumento.fieldbyname('CODIRRFDARF').asstring) = '' Then
                begin 
                  frmGeraFolhaMT.memResult.Lines.Add('A Rubrica '+cdsdocumento.fieldbyname('IDPROVENTO').asstring+
                                                     ' está sem a informação de Natureza de Rendimentos Preenchida.'+
                                                     ' Favor verificar o Cadastro de Rubricas Salariais, no Sistema '+
                                                     ' de Folha de Benefícios. ');
                  bProcessa := false;
                end; 
              End;
            end;  
            cdsDocumento.Next
          end;
        end;

        // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - FIM
        If bProcessa then
        begin
          AtualizaPosicao ('PROCESSANDO. AGUARDE');

          fDataEfet := '';

          cdsDocumento.first;
          bMolestiaGrave := False; 
          While not cdsDocumento.EOF do
          Begin
            iMeses         := 0; 

            bTemAcJud      := (cdsdocumento.FieldByName('TEMACAO').AsInteger = 1);
            fPercAcao      := cdsdocumento.FieldByName('PERCACAO').AsFloat;
            iIdProcJud     := 0;
            fIdFoBenef     := cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger;
            fPessoa        := cdsDocumento.FieldByName('IDPESSOA').AsFloat;
            fCodNatur      := trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString);
            iFlgPensaoAlim := cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger; 
            b65acumprimvez := True;
            Ssql.Text := 'SELECT DATAMOLESTIAGRAVE, TO_CHAR(DATANASC, ''DD/MM/YYYY'') AS DATANASC, FLGISENTOIRRF '+
                         '  FROM PESSOAFISICA '+
                         ' WHERE (IDPESSOA = '+cdsDocumento.FieldByName('IDPESSOA').Asstring+') ';
            cdsPessFisica.data := GetDataPacket(Ssql.Text);

            if cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
            begin
              if (((not cdsPessFisica.fieldByname('DATAMOLESTIAGRAVE').IsNull) and
                   (cdsPessFisica.fieldByname('DATAMOLESTIAGRAVE').AsDateTime <= StrToDate(DataIni))) or
                   (cdsDocumento.fieldByname('FLGMOLESTIAGRAVE').AsInteger = 1) or
                   (cdsPessFisica.fieldByname('FLGISENTOIRRF').AsInteger = 1))
              then bMolestiaGrave := True
              else bMolestiaGrave := False;
            end;

            If cdsPessFisica.fieldByname('DATANASC').IsNull Then
            Begin
              frmGeraFolhaMT.memResult.Lines.Add('Erro: Matrícula : ' +
                                                 cdsDocumento.FieldByName('IDPESSOA').AsString +
                                                 ' não possui data de nascimento cadastrada '  );

              cdsDocumento.Next;
              Continue;
            End;

            if fDataEfet <> cdsDocumento.FieldByName('DATAPAGAMENTO').AsString Then
            Begin
              fDataEfet  := cdsDocumento.FieldByName('DATAPAGAMENTO').AsString;

              cdsParamIRRF.Data := GetDataPacket(
                                                 'SELECT ' +
                                                 '    VLRIDOSO AS VLRIDOSOS, ' +
                                                 '    IDADEIDOSO ' +
                                                 'FROM ' +
                                                 '    HSTPARAMIRRF ' +
                                                 'WHERE ' +
                                                 '    DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
                                                 '                       FROM   HSTPARAMIRRF ' +
                                                 '                       WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(fDataEfet) + ',''DD/MM/YYYY''))'
                                                );


            end;
            fValIdosoFixo := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            fValorIdoso   := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            fValorIdoso13 := cdsParamIRRF.FieldByName('VLRIDOSOS').AsFloat;
            rValorRend    := 0;
            rValorRend13  := 0;
            Try
              StartTransaction;
              While (cdsDocumento.FieldByName('IDPESSOA').AsFloat = fPessoa) and
                    (cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger = fIdFoBenef) and
                    (trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString) = fCodNatur) and
                    (cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger = iFlgPensaoAlim) and 
                    (fDataEfet = cdsDocumento.FieldByName('DATAPAGAMENTO').AsString) and 
                    (not cdsDocumento.EOF) do
              Begin
                iPosicao := iPosicao + 1;
                Ssql.Text := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, 1 AS FONTEPAGADORA '+
                             '  FROM  LANCXINFORME '+
                             ' WHERE (1 = 2)';
                cdsDet.data     := GetDataPacket(SSql.Text);

                rValIRRF        := 0;
                rValBase        := 0;
                fPatro          := cdsDocumento.FieldByName('IDPESSJUR').AsInteger;
                fPlanoPrev      := cdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
                fCodCentroCusto := cdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
                fIdPrograma     := cdsDocumento.FieldByName('IDPROGRAMA').AsInteger;
                fIdMotivo       := cdsDocumento.FieldByName('IDMOTIVO').AsInteger;
                fIdModulo       := cdsDocumento.FieldByName('IDMODULO').AsInteger;
                sNumDocumento   := cdsDocumento.FieldByName('NUMDOCUMENTO').AsString;

                If iSistema = 0 Then
                Begin
                  If cdsAux.Active Then
                    sCodCentroRespon := cdsAux.FieldByName('CODCENTRORESPON').AsString;
                End
                Else
                begin
                  sCodCentroRespon := cdsDocumento.FieldByName('CODCENTRORESPON').AsString;

                  if iSistema = 1 then
                  begin
                    if (bTemAcJud) and
                       ((cdsDocumento.FieldByName('CODIRRFDARF').AsString = '7416') or
                        (cdsDocumento.FieldByName('CODIRRFDARF').AsString = '7431')) then
                      iIdProcJud := cdsDocumento.FieldByName('IDPROCJUD').AsInteger;
                  end;
                end;

                While (cdsDocumento.FieldByName('IDPESSOA').AsFloat = fPessoa) and
                      (cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger = fIdFoBenef) and
                      (cdsDocumento.FieldByName('IDPESSJUR').AsInteger = fPatro) and
                      (cdsDocumento.FieldByName('IDPLANOPREV').AsInteger = fPlanoPrev) and
                      (trim(cdsDocumento.FieldByName('CODIRRFDARF').AsString) = fCodNatur) and
                      (cdsDocumento.FieldByName('FLGPENSAOALIM').AsInteger = iFlgPensaoAlim) and 
                      (fDataEfet = cdsDocumento.FieldByName('DATAPAGAMENTO').AsString) and 
                      (not cdsDocumento.EOF) do

                Begin
                  //Marilza Colpani - SOL 126964/KTN 668955
//                  if ( cdsDocumento.FieldByName('FLGESPECIAL').AsInteger = 1 ) and
                  if ( cdsDocumento.FieldByName('FLGESPECIALFP').AsInteger = 1 ) and
                     ( not cdsDocumento.FieldByName('IDINFORME').IsNull      ) then
                  begin
                    bAchouRub := False;
                    for iContLstRub := 0 to lstRubricaEspecial.Count - 1 do
                    begin
                      if lstRubricaEspecial[iContLstRub] = cdsDocumento.FieldByName('IDPROVENTO').AsString then
                        bAchouRub := True;
                    end;

                    if not bAchouRub then
                      lstRubricaEspecial.Add( cdsDocumento.FieldByName('IDPROVENTO').AsString );
                  end;

                  iLinhaInforme    := cdsDocumento.FieldByName('IDINFORME').AsInteger;
                  rValorLinha      := cdsDocumento.FieldByName('VALOR').AsFloat;
                  rValorLinhaSinal := cdsDocumento.FieldByName('VALORSINAL').AsFloat;

                  if iLinhaInforme = StrToInt(sAcima65) Then
                  begin
                    cdsdocumento.next;
                    Continue;
                  end;

                  if cdsDocumento.FieldByName('FLGIRRF').AsString = 'S' then
                  begin
                    // PEGA O VALOR DO IRRF PARA TODAS AS FOLHAS
                    //Marilza Colpani - SOL 126964/KTN 668955
//                    If (cdsdocumento.FieldByName('FLGESPECIAL').AsInteger = 0) or (iSistema = 0) Then
                    If (cdsdocumento.FieldByName('FLGESPECIALFP').AsInteger = 0) or (iSistema = 0) Then
                    Begin
                      rValIRRF := rValIRRF + (cdsDocumento.FieldByName('VALORSINAL').AsFloat * -1);
                      If cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
                         // FORMA A BASE PARA A FOLHA DE BENEFICIOS
                        rValBase := rValBase + cdsDocumento.FieldByName('VALORINFO').AsFloat;

                      If iSistema = 0 Then
                      Begin
                        iPlanoContab    := cdsAux.FieldByName('PLANOCONTAB').AsInteger;
                        sCodtiprecdes   := cdsAux.FieldByname('CODTIPRECDES').AsString;
                        sPlacontac      := cdsAux.FieldByname('PLACONTAC').AsString;
                      End
                      else
                      Begin
                        iPlanoContab    := cdsDocumento.FieldByName('PLANOCONTAB').AsInteger;
                        sCodtiprecdes   := cdsDocumento.FieldByname('CODTIPRECDES').AsString; 
                        sPlacontac      := cdsDocumento.FieldByname('PLACONTAC').AsString;    
                      end;
                    End;
                  end;

                  If iPlanoContab <= 0 Then
                    If iSistema = 0 Then
                    Begin
                      If cdsAux.Active Then 
                        iPlanoContab    := cdsAux.FieldByName('PLANOCONTAB').AsInteger;
                    End
                    Else
                      iPlanoContab    := cdsDocumento.FieldByName('PLANOCONTAB').AsInteger;

                  if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') or
                     (cdsDocumento.FieldByName('CODDIRF').AsInteger = 5) then
                  Begin
                    if cdsDocumento.FieldByName('IDMODULO').AsInteger = 18 then
                    Begin
                      if bMolestiaGrave then 
                      begin
                        If (fCodNatur <> '3223') then
                        begin
                          if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                            iLinhaInforme := StrToInt(sMolestiaGrave);
                        end
                        else
                        begin
                          If (cdsParamFolha.Fieldbyname('PARMRESGATE').asInteger = 1) then
                          begin
                            if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                              iLinhaInforme := cdsDocumento.FieldByName('IDINFORME').AsInteger;
                          end
                          else
                          begin
                            if (cdsDocumento.FieldByName('FLGBASE').AsString = 'S') then
                              iLinhaInforme := StrToInt(sMolestiaGrave);
                          end;
                        end;
                      end
                      else
                      Begin
                        DecodeDate(cdsDocumento.FieldByName('DATAPAGAMENTO').AsDateTime, iAno, iMes, iDia);
                        dDataComparaIdade := DiasUteis.UltDiaMes(iAno, iMes);
                        iMeses := DiasUteis.IntervaloMeses(cdsPessFisica.fieldByname('DATANASC').AsDateTime, dDataComparaIdade) div 12; 
                        if (not cdsPessFisica.fieldByname('DATANASC').IsNull) and                      
                           (iMeses >= cdsParamIRRF.fieldByname('IDADEIDOSO').AsInteger) Then
                        Begin
                          if b65acumprimvez Then
                          Begin
                            b65acumprimvez    := False;
                            fValorIdosoacum   := 0;
                            fValorIdoso13acum := 0;
                            cdsAux.Close;

                            // pegar valores de 13o somente após aniversário de 65 anos.


                            if cdsDocumento.FieldByName('CODDIRF').AsInteger <> 5 Then
                            Begin
                              Ssql.Text := 'SELECT SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VLRBASE65 '+
                                           'FROM  HISTRUBSAL H '+
                                           'WHERE H.IDRESPONSAVEL = ' + cdsDocumento.FieldByName('IDPESSOA').Asstring + ' AND ' +
                                           '      TO_CHAR(H.DATAPAGAMENTO,''YYYY/MM'') = ''' + copy(fDataEfet, 7,4) + '/' + copy(fDataEfet, 4,2) + ''' AND ' +
                                           '      H.IDMODULO = 18 AND ' +
                                           '      H.IDLANCIRRF IS NOT NULL AND ' +
                                           '      H.FLGESTORNO = 0 AND '+
                                           '      H.IDINFORME IN (SELECT IDINFORME FROM INFORME WHERE FLGBASE = ''S'' AND CODDIRF <> 5)';
                              cdsAux.data     := GetDataPacket(SSql.Text);

                              if not cdsDet.EOF Then
                                fValorIdosoacum := cdsAux.FieldByName('VLRBASE65').AsFloat;

                            end
                            else
                            Begin
                              Ssql.Text := 'SELECT SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO)) AS VLRBASE65 '+
                                           'FROM  HISTRUBSAL H '+
                                           'WHERE H.IDRESPONSAVEL = ' + cdsDocumento.FieldByName('IDPESSOA').Asstring + ' AND ' +

                                           ' TRUNC((to_number(to_char(H.DATAPAGAMENTO, ''yyyymm'')) - to_number(to_char(to_date('+QuotedStr(copy(cdsPessFisica.fieldByname('DATANASC').AsString, 7, 4) + copy(cdsPessFisica.fieldByname('DATANASC').AsString, 4, 2))+', ''yyyymm''), ''yyyymm'')) ) / 100 ) >= 65 AND '+
                                           ' TO_CHAR(H.DATAPAGAMENTO, ''YYYY'') = '+QuotedStr(Copy(cdsDocumento.fieldByname('DATAPAGAMENTO').AsString, 7, 4))+' AND '+

                                           '      H.IDMODULO = 18 AND ' +
                                           '      H.IDLANCIRRF IS NOT NULL AND ' +
                                           '      H.FLGESTORNO = 0 AND '+
                                           '      H.IDINFORME IN (SELECT IDINFORME FROM INFORME WHERE CODDIRF = 5 ) ';

                              cdsAux.data     := GetDataPacket(SSql.Text);

                              if not cdsDet.EOF Then
                                 fValorIdoso13acum := cdsAux.FieldByName('VLRBASE65').AsFloat;
                            end;
                          end;
                          fValIdosoFixo := fValIdosoFixo  - fValorIdosoacum;
                          fValorIdoso   := fValorIdoso    - fValorIdosoacum;
                          fValorIdoso13 := fValorIdoso13  - fValorIdoso13acum;

                          if cdsDocumento.FieldByName('CODDIRF').AsInteger <> 5 Then
                          Begin
                            if (cdsDocumento.FieldByName('VALORSINAL').AsFloat > 0) AND
                               (cdsDocumento.FieldByName('VALORSINAL').AsFloat < fValorIdoso) and
                               (fValorIdoso > 0) then
                            Begin
                              If Trim(sCodRubricas) = '' Then
                              Begin
                                if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                Begin
                                  cdsDet.Edit;
                                  cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + cdsDocumento.FieldByName('VALOR').AsFloat;
                                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                end
                                else
                                Begin
                                  cdsDet.Insert;
                                  cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                  cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDocumento.FieldByName('VALOR').AsFloat;
                                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                end;
                                cdsDet.Post;
                                fValorIdoso      := fValorIdoso - cdsDocumento.FieldByName('VALOR').AsFloat;
                                rValorLinha      := 0;
                                rValorLinhaSinal := 0;
                                rValorRend       := rValorRend + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                              End;
                            end
                            else
                            Begin
                              if (cdsDocumento.FieldByName('VALORSINAL').AsFloat > 0) then
                              Begin
                                if (fValorIdoso > 0) then
                                begin
                                  If Trim(sCodRubricas) = '' Then
                                  Begin
                                    if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                    Begin
                                      cdsDet.Edit;
                                      cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + fValorIdoso;
                                      cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + fValorIdoso;
                                      cdsDet.Post;
                                    end
                                    Else
                                    Begin
                                      cdsDet.Insert;
                                      cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                      cdsDet.FieldByName('VLRLANC').AsFloat      := fValorIdoso;
                                      cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValorIdoso;
                                      cdsDet.Post;
                                    End;
                                  End;
                                end;
                                rValorLinha      := (cdsDocumento.FieldByName('VALOR').AsFloat - fValorIdoso);
                                rValorLinhaSinal := (cdsDocumento.FieldByName('VALORSINAL').AsFloat - fValorIdoso);
                                fValorIdoso := 0;
                                rValorRend := rValorRend + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                              end
                              else
                              Begin
                                if abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) > rValorRend Then
                                Begin
                                  if (fValIdosoFixo - fValorIdoso) >= abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) Then
                                  Begin
                                    fValorIdoso := fValorIdoso + abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) - rValorRend;
                                    If Trim(sCodRubricas) = '' Then
                                    Begin
                                      if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                      Begin
                                        cdsDet.Edit;
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := fValIdosoFixo - fValorIdoso;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValIdosoFixo - fValorIdoso;
                                      end
                                      else
                                      Begin
                                        cdsDet.Insert;
                                        cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := fValIdosoFixo - fValorIdoso;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValIdosoFixo - fValorIdoso;
                                      end;
                                      cdsDet.Post;
                                      rValorRend := 0;
                                    End;
                                  end
                                  else
                                  Begin
                                    rValorRend  := (fValIdosoFixo - fValorIdoso) + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                    fValorIdoso := fValIdosoFixo;

                                    If Trim(sCodRubricas) = '' Then
                                    Begin
                                      if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                      Begin
                                        cdsDet.Edit;
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := 0;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := 0;
                                      End;
                                    end;
                                  end;
                                end;
                                rValorLinha      := cdsDocumento.FieldByName('VALOR').AsFloat;
                                rValorLinhaSinal := (cdsDocumento.FieldByName('VALORSINAL').AsFloat);
                              end;
                            end;
                          end
                          else
                          Begin
                            rValorRend13 := rValorRend13 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                            if (cdsDocumento.FieldByName('VALORSINAL').AsFloat > 0) AND
                               (cdsDocumento.FieldByName('VALORSINAL').AsFloat < fValorIdoso13) and
                               (fValorIdoso13 > 0) then
                            Begin
                              If Trim(sCodRubricas) = '' Then
                              Begin
                                if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                Begin
                                  cdsDet.Edit;
                                  cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + cdsDocumento.FieldByName('VALOR').AsFloat;
                                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                end
                                else
                                Begin
                                  cdsDet.Insert;
                                  cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                  cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDocumento.FieldByName('VALOR').AsFloat;
                                  cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                end;
                                cdsDet.Post;
                                fValorIdoso13   := fValorIdoso13 - cdsDocumento.FieldByName('VALOR').AsFloat;
                                rValorLinha      := 0;
                                rValorLinhaSinal := 0;
                              End;
                            end
                            else
                            Begin
                              if (cdsDocumento.FieldByName('VALORSINAL').AsFloat > 0) then
                              Begin
                                if (fValorIdoso13 > 0) then
                                begin
                                  If Trim(sCodRubricas) = '' Then
                                  Begin
                                    if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                    Begin
                                      cdsDet.Edit;
                                      cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + fValorIdoso13;
                                      cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + fValorIdoso13;
                                      cdsDet.Post;
                                    End
                                    Else
                                    Begin
                                      cdsDet.Insert;
                                      cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                      cdsDet.FieldByName('VLRLANC').AsFloat      := fValorIdoso13;
                                      cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValorIdoso13;
                                      cdsDet.Post;
                                    End;
                                  End;
                                end;
                                rValorLinha      := (cdsDocumento.FieldByName('VALOR').AsFloat - fValorIdoso13);
                                rValorLinhaSinal := (cdsDocumento.FieldByName('VALORSINAL').AsFloat - fValorIdoso13);
                                fValorIdoso13 := 0;
                                rValorRend13 := rValorRend13 + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                              end
                              else
                              Begin
                                if abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) > rValorRend13 Then
                                Begin
                                  if (fValIdosoFixo - fValorIdoso13) >= abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) Then
                                  Begin
                                    fValorIdoso13 := fValorIdoso13 + abs(cdsDocumento.FieldByName('VALORSINAL').AsFloat) - rValorRend13;
                                    If Trim(sCodRubricas) = '' Then
                                    Begin
                                      if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                      Begin
                                        cdsDet.Edit;
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := fValIdosoFixo - fValorIdoso13;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValIdosoFixo - fValorIdoso13;
                                      end
                                      else
                                      Begin
                                        cdsDet.Insert;
                                        cdsDet.FieldByName('IDINFORME').AsInteger  := StrToInt(sAcima65);
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := fValIdosoFixo - fValorIdoso13;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := fValIdosoFixo - fValorIdoso13;
                                      end;
                                      cdsDet.Post;
                                      rValorRend13 := 0;
                                    End;
                                  end
                                  else
                                  Begin
                                    rValorRend13  := (fValIdosoFixo - fValorIdoso13) + cdsDocumento.FieldByName('VALORSINAL').AsFloat;
                                    fValorIdoso13 := fValIdosoFixo;
                                    If Trim(sCodRubricas) = '' Then
                                    Begin
                                      if cdsDet.Locate('IDINFORME',StrToInt(sAcima65), []) Then
                                      Begin
                                        cdsDet.Edit;
                                        cdsDet.FieldByName('VLRLANC').AsFloat      := 0;
                                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := 0;
                                      end;
                                    End;
                                  end;
                                end;
                                rValorLinha      := cdsDocumento.FieldByName('VALOR').AsFloat;
                                rValorLinhaSinal := (cdsDocumento.FieldByName('VALORSINAL').AsFloat);
                              end;
                            end;
                          end;
                        end;
                      end;
                    end
                    else
                    Begin
                      // FORMA A BASE PARA A FOLHA DE FUNCIONARIOS
                      if cdsDocumento.FieldByName('FLGBASE').AsString = 'S' then
                        rValBase := rValBase + rValorLinha;
                    end;
                  end;
                  if rValorLinha <> 0 then
                  begin
                    If bTemAcJud and
                       (cdsdocumento.fieldByname('FLGBASE').AsString  = 'S') and
                       (iFlgPensaoAlim <> 2) Then 
                    Begin
                      {Trata linha do informe mensal de ação judicial}
                      If (cdsdocumento.fieldByname('CODDIRF').AsString <> '5') Then
                      Begin
                        If RoundCM((rValorLinha * fPercAcao) / 100, 2) > 0 Then
                        Begin
                          if cdsDet.Locate('IDINFORME',iLinhaRendAcJud, []) Then
                          Begin
                            cdsDet.Edit;
                            cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaRendAcJud;
                            cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * fPercAcao)/100, 2) ;
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * fPercAcao)/100, 2);
                          end
                          else
                          Begin
                            cdsDet.Insert;
                            cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaRendAcJud;
                            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * fPercAcao) / 100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * fPercAcao) / 100, 2);
                          end;
                        End;  

                        {Trata linha do informe mensal normal}
                        If RoundCM((rValorLinha * (100 - fPercAcao))/100, 2) > 0 Then
                        Begin
                          if cdsDet.Locate('IDINFORME',iLinhaInforme, []) Then
                          Begin
                            cdsDet.Edit;
                            cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                            cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * (100 - fPercAcao))/100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * (100 - fPercAcao))/100, 2);
                          end
                          else
                          Begin
                            cdsDet.Insert;
                            cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
                            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * (100 - fPercAcao))/100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * (100 - fPercAcao))/100, 2);
                          end;
                        end;  
                      End
                      Else
                      Begin
                        {Trata Linha do Informe de Décimo terceiro de ação judicial}
                        If RoundCM((rValorLinha * fPercAcao) / 100, 2) > 0 Then
                        Begin
                          if cdsDet.Locate('IDINFORME',iLinhaRendAcJud13, []) Then
                          Begin
                            cdsDet.Edit;
                            cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaRendAcJud13;
                            cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * fPercAcao)/100, 2) ;
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * fPercAcao)/100, 2);
                          end
                          else
                          Begin
                            cdsDet.Insert;
                            cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaRendAcJud13;
                            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * fPercAcao) / 100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * fPercAcao) / 100, 2);
                          end;
                        End;

                        {Trata Linha do Informe de Décimo terceiro normal}
                        If RoundCM((rValorLinha * (100 - fPercAcao))/100, 2) > 0 Then
                        Begin
                          if cdsDet.Locate('IDINFORME',iLinhaInforme, []) Then
                          Begin
                            cdsDet.Edit;
                            cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                            cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + RoundCM((rValorLinha * (100 - fPercAcao))/100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + RoundCM((rValorLinhaSinal * (100 - fPercAcao))/100, 2);
                          end
                          else
                          Begin
                            cdsDet.Insert;
                            cdsDet.FieldByName('IDINFORME').AsInteger     := iLinhaInforme;
                            cdsDet.FieldByName('VLRLANC').AsFloat         := RoundCM((rValorLinha * (100 - fPercAcao))/100, 2);
                            cdsDet.FieldByName('VLRLANCSINAL').AsFloat    := RoundCM((rValorLinhaSinal * (100 - fPercAcao))/100, 2);
                          end;
                        End;
                      End;
                    End
                    Else
                    Begin
                      If bMolestiaGrave Then
                        If cdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', cdsDocumento.FieldByName('IDINFORME').AsString]), []) Then
                          iLinhaInforme := cdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;

                      if cdsDet.Locate('IDINFORME',iLinhaInforme, []) Then
                      Begin
                        cdsDet.Edit;
                        cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                        cdsDet.FieldByName('VLRLANC').AsFloat      := cdsDet.FieldByName('VLRLANC').AsFloat + rValorLinha;
                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := cdsDet.FieldByName('VLRLANCSINAL').AsFloat + rValorLinhaSinal;
                      end
                      else
                      Begin
                        cdsDet.Insert;
                        cdsDet.FieldByName('IDINFORME').AsInteger  := iLinhaInforme;
                        cdsDet.FieldByName('VLRLANC').AsFloat      := rValorLinha;
                        cdsDet.FieldByName('VLRLANCSINAL').AsFloat := rValorLinhaSinal;
                      end;
                    End;  
                    cdsDet.Post;
                  end;
                  cdsDocumento.Next;
                  FrmGeraFolhaMt.lblcontagem.caption := Format('Processando %d de %d',[cdsDocumento.Recno,cdsDocumento.RecordCount]);

                  frmGerafolhaMT.repaint;
                end;
                iCodLanc := 0;
                bPrim    := True;
                LancIRRF.GravaIRRF(IdEmpresa,
                                   UsaPlanoPatro,
                                   0,
                                   IdEmpresa,
                                   fPessoa,
                                   fCodNatur,
                                   fDataEfet,
                                   rValBase,
                                   rValIRRF,
                                   0,
                                   0,
                                   rValBase,
                                   0,
                                   0,
                                   0,
                                   0,
                                   cdsDet.data,
                                   iCodLanc,
                                   sPlacontac,
                                   iPlanoContab,
                                   'S',
                                   fPlanoPrev,
                                   fPatro,
                                   fIdPrograma,
                                   bPrim,
                                   fIdModulo,
                                   fIdModulo,
                                   fIdMotivo,
                                   fCodCentroCusto,
                                   fIdFoBenef,
                                   sCodtiprecdes,
                                   sPlacontac,
                                   sCodCentroRespon,
                                   0,
                                   0,
                                   False,
                                   0,
                                   True,
                                   '',
                                   0,
                                   iFlgPensaoAlim,
                                   iIdProcJud);

                Ssql.Text := ' UPDATE HISTRUBSAL SET IDLANCIRRF = '+ FloatTostr(iCodLanc)+
                             ' WHERE ';

                if fIdFoBenef = 0
                then sSql.Text := sSql.Text + ' (IDHSTFOLHABENEF IS NULL) '
                else sSql.Text := sSql.Text + ' (IDHSTFOLHABENEF = '+IntToStr(fIdFoBenef)+') ';

                if iSistema = 1
                then sSql.Text := sSql.Text + '  AND (IDRESPONSAVEL = '+FloatToStr(fPessoa)+') '
                else sSql.Text := sSql.Text + '  AND (IDPESSOA = '+FloatToStr(fPessoa)+') ';

                sSql.Text := sSql.Text + ' AND (DATAPAGAMENTO = TO_DATE('''+fDataEfet+''',''DD/MM/YYYY'')) ';

                if iSistema = 1
                then sSql.Text := sSql.Text + '  AND (IDMODULO = 18)  '
                else sSql.Text := sSql.Text + '  AND (IDMODULO = 21)  ';

                If Pos(',', sCodRubricas) > 0 Then
                Begin
                  If Trim(sCodRubricas) <> '' Then
                    sSql.Text := sSql.Text + '  AND (IDRUBRICA IN ('+sCodRubricas+')) ';
                End
                Else
                  If Trim(sCodRubricas) <> '' Then
                    sSql.Text := sSql.Text + '  AND (IDRUBRICA = '+sCodRubricas+') ';

                sSql.Text := sSql.Text + ' AND (CODIRRFDARF = '+QuotedStr(fCodNatur)+' OR CODIRRFDARF IS NULL)';

                if iFlgPensaoAlim = 2 Then
                  sSql.Text := sSql.Text + ' AND (FLGPENSAOALIM = 2) ' + #13#10
                else
                  sSql.Text := sSql.Text + ' AND (NVL(FLGPENSAOALIM, 0) in (0, 1))' + #13#10;

                if not ExecSQL(sSql.Text) then
                  Raise Exception.Create(messageinfo);

                If EstaemTransacao then
                begin
                  if iPosicao mod 100 = 0 then
                  begin
                    Commit;
                    StartTransaction;
                  end;
                end
                else
                  Starttransaction;
              end;
              Commit;
            Except
              On E:Exception Do
              Begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
              End;
            end;
          end;

          frmGeraFolhaMT.memResult.Lines.Add('Atenção: rubricas com situação especial parametrizadas com linha de informe! Verifique.');
          for iContLstRub := 0  to lstRubricaEspecial.Count - 1 do
            frmGeraFolhaMT.memResult.Lines.Add('código interno da rubrica: '+ lstRubricaEspecial[iContLstRub]);

          lstRubricaEspecial.Free;

          if iSistema = 1 then
            //CPREV - 24663 - ProcessaEstornos(IdEmpresa, iTipoFiltro, iPessoa, CodNatureza, DataIni, UsaPlanoPatro);
            ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario, CodNatureza, DataIni, UsaPlanoPatro); //CPREV - 24663

          AtualizaPosicao ('Fim do Processo .');
          Linha;
          frmGeraFolhaMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
          Linha;
          result := true;
        end
        else
        begin
          AtualizaPosicao ('Fim do Processo .');
          Linha;
          frmGeraFolhaMT.memResult.Lines.Add('O processamento foi interrompido na fase de verificação devido a inconsistências cadastrais ');
          frmGeraFolhaMT.memResult.Lines.Add('e só poderá ser executado completamente se estas informações estiverem parametrizadas.');
          Linha;
          frmGeraFolhaMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
          Linha;
          result := false;
        end;
      end
      else
      begin
        if iSistema = 1 then
        begin
          //CPREV - 24663 - ProcessaEstornos(IdEmpresa, iTipoFiltro, iPessoa, CodNatureza, DataIni, UsaPlanoPatro);
          ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListaUsuario, CodNatureza, DataIni, UsaPlanoPatro); //CPREV - 24663
        end;

        AtualizaPosicao ('> NÃO HÁ NADA A PROCESSAR.');
        Linha;
        frmGeraFolhaMT.memResult.Lines.Add('NÃO HÁ NADA A PROCESSAR');
        Linha;
        frmGeraFolhaMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
        Linha;
        result := false;
      end;
    end
    else
    begin
      frmGeraFolhaMT.memResult.Lines.Add('');
      Linha;
      If bfaltaParmMolestia then
        frmGeraFolhaMT.memResult.Lines.Add('Linha do Informe para Moléstia Grave     : NÃO PREENCHIDA');

      If bFaltaParmMais65 then
        frmGeraFolhaMT.memResult.Lines.Add('Linha do Informe para Maiores de 65 anos : NÃO PREENCHIDA');

      If bFaltaPrograma then
        frmGeraFolhaMT.memResult.Lines.Add('Tipo de Programa Previdenciário no cadastro Global : NÃO PREENCHIDO');

      Linha;
      frmGeraFolhaMT.memResult.Lines.Add('O processamento só poderá ser feito se estas informações estiverem parametrizadas.');
      AtualizaPosicao ('Fim do Processo .');
      Linha;
      frmGeraFolhaMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
      result := false;
    end;
    // PROCESSAMENTO PRINCIPAL - FIM
  end;
  FreeAndNil(sSql);
end;

function TCtrlGeraFolha.strZero(TamanhoTexto: Integer;
                                Texto: String): String;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := zeros + texto;
end;

procedure TCtrlGeraFolha.Atualizaposicao (cTexto : String);
begin
//    FrmGeraFolhaMT.pnlPosicao.caption := cTexto;
//    FrmGeraFolhaMT.Repaint;
end;

procedure TCtrlGeraFolha.Linha;
begin
//  frmGeraFolhaMT.memResult.Lines.Add('-------------------------------------------------------'+
//                                         '-------------------------');
//  frmGeraFolhaMT.Repaint;
end;

procedure TCtrlGeraFolha.ProcessaEstornos(IdEmpresa, iTipoFiltro, piIdListausuario : Integer; CodNatureza, DataIni : string; UsaPlanoPatro : Boolean);
var
   sSQL            : String;
   cdsAux          : TClientDataSet;
   iProcessado     : Integer;
   iPosicao        : Integer;
   iCodLanc        : Double;
   bPrimVez        : Boolean;

   sDataPagamento  : String; 
   sDataLancamento : String;
   iIdBenefIrrf    : Integer;
   fVlrBase        : Real;
   sCodNatureza    : String;
   fVlrIrrf        : Real;
   sNumDocumento   : String;
   fVlrreferencia  : Real;
   iPlano          : Integer;
   iPlanoPrev      : Integer;
   sPlaconta       : String;
   iPatro          : Integer;
   iPrograma       : Integer;
   sCodCentroCusto : String;

   iIDMotivo       : Integer;
   iIDHistFolha    : Integer;
   sCodTipRecDes   : String;
   sPlaContaD      : String;
   sCodCentroRespon: String;
   sAnoProc        : String;
   bFlgCompensa    : Boolean;
begin
    try
//       frmGeraFolhaMT.ProgressBar1.Position := 0;
       frmGerafolhaMT.lblcontagem.caption   := '';
       frmGerafolhaMT.repaint;

       AtualizaPosicao('PROCESSANDO ESTORNOS. AGUARDE...');

       cdsAux := TClientDataSet.Create(nil);

       SSql :=
       'SELECT DISTINCT '                                                                  + #13 +
       '    L.IDLANCIRRF, '                                                                + #13 +
       '    L.DATALANCAMENTO, '                                                            + #13 +
       '    L.IDPESSOA, '                                                                  + #13 +
       '    L.IDBENEFIRRF, '                                                               + #13 +
       '    L.VLRBASE, '                                                                   + #13 +
       '    L.CODNATUREZA, '                                                               + #13 +
       '    L.VLRIRRF, '                                                                   + #13 +
       '    L.NUMDOCUMENTO, '                                                              + #13 +
       '    L.VLRREFERENCIA, '                                                             + #13 +
       '    L.PLANO, '                                                                     + #13 +
       '    L.PLACONTA, '                                                                  + #13 +
       '    L.FLGFOLHA, '                                                                  + #13 +
       '    L.IDMODULO, '                                                                  + #13 +
       '    L.IDMOTIVO, '                                                                  + #13 +
       '    L.IDHSTFOLHABENEF, '                                                           + #13 +
       '    L.IDPROGRAMA, '                                                                + #13 +
       '    L.CODCENTROCUSTO, '                                                            + #13 +
       '    L.CODTIPRECDES, '                                                              + #13 +
       '    L.PLACONTA AS PLACONTARECDES, '                                                + #13 +
       '    L.IDPLANOPREV, '                                                               + #13 +
       '    MIN(H.MES) AS MES, '                                                           + #13 +
       '    L.IDPATRO, '                                                                   + #13 +
       '    L.CODCENTRORESPON, '                                                           + #13 +
       '    H.DATAPAGAMENTO '                                                              + #13 +  
       'FROM '                                                                             + #13 +
       '    LANCIRRF L, HISTRUBSAL H '                                                     + #13 +

       'WHERE '                                                                            + #13 +
       '    H.IDMODULO            = 18 '                                                   + #13 +
       'AND H.IDPESSJUR           = ' + IntToStr(IdEmpresa)                                + #13 +
       'AND NVL(H.FLGESTORNO, 0) <> 0 '                                                    + #13 +  
       'AND H.IDLANCIRRF         IS NOT NULL '                                             + #13 +
       'AND H.IDLANCIRRFESTORNO  IS NULL '                                                 + #13 +
       'AND L.IDLANCIRRF          = H.IDLANCIRRF '                                         + #13 +
       'AND H.DATAPAGAMENTO      <= TO_DATE('+QuotedStr(DataIni)+', ''DD/MM/YYYY'') '      + #13 ; 

       If iTipoFiltro = 1 then
          ssql := ssql +
          'AND H.CODIRRFDARF       = '+QuotedStr(CodNatureza) + #13;

       //CPrev - 24663 - Inicio
       // If (iPessoa > 0) then
       //    ssql := ssql +
       //    'AND H.IDPESSOA             = '+Inttostr(iPessoa) + #13;
       If piIdListaUsuario > 0 Then
         sSql:= sSql + ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '                       + #13#10 +
                                   ' WHERE H.IDTITULAR     = LD.IDTITULAR '                      + #13#10 +
                                     ' AND H.IDRESPONSAVEL = LD.IDPESSOA '                       + #13#10 +
                                     ' AND LD.IDLISTA      = '+ IntToStr(piIdListaUsuario) +') ' + #13#10;

       //CPrev - 24663 - Fim

       sSql := sSql + ' GROUP BY           '                                    + #13 +
                      ' L.IDLANCIRRF,      '                                    + #13 +
                      ' L.DATALANCAMENTO,  '                                    + #13 +
                      ' L.IDPESSOA,        '                                    + #13 +
                      ' L.IDBENEFIRRF,     '                                    + #13 +
                      ' L.VLRBASE,         '                                    + #13 +
                      ' L.CODNATUREZA,     '                                    + #13 +
                      ' L.VLRIRRF,         '                                    + #13 +
                      ' L.NUMDOCUMENTO,    '                                    + #13 +
                      ' L.VLRREFERENCIA,   '                                    + #13 +
                      ' L.PLANO,           '                                    + #13 +
                      ' L.PLACONTA,        '                                    + #13 +
                      ' L.FLGFOLHA,        '                                    + #13 +
                      ' L.IDMODULO,        '                                    + #13 +
                      ' L.IDMOTIVO,        '                                    + #13 +
                      ' L.IDHSTFOLHABENEF, '                                    + #13 +
                      ' L.IDPROGRAMA,      '                                    + #13 +
                      ' L.CODCENTROCUSTO,  '                                    + #13 +
                      ' L.CODTIPRECDES,    '                                    + #13 +
                      ' L.PLACONTA,  '                                          + #13 + 
                      ' L.IDPLANOPREV,     '                                    + #13 +
                      ' L.IDPATRO,         '                                    + #13 +
                      ' H.DATAPAGAMENTO,   '                                    + #13 +  
                      ' L.CODCENTRORESPON  '                                    + #13 ;

       cdsDocumento.data := GetDataPacket(Ssql);

       iProcessado                          := 0;
       iPosicao                             := 0;

//       frmGeraFolhaMT.ProgressBar1.Position := 0;
//       frmGeraFolhaMT.ProgressBar1.Max      := cdsDocumento.RecordCount;
//       frmGeraFolhaMT.Repaint;

       cdsDocumento.First;

       try
         StartTransacao;
         While not cdsDocumento.EOF do
         Begin

//            frmGerafolhaMT.ProgressBar1.Position := frmGerafolhaMT.ProgressBar1.Position + frmGerafolhaMT.ProgressBar1.Step;
//            iProcessado                          := frmGerafolhaMT.ProgressBar1.Position;
//            frmGerafolhaMT.lblcontagem.caption   := 'Processando '+inttostr(iProcessado)+
//                                                    ' de '+inttostr(frmGerafolhaMT.ProgressBar1.Max);
            FrmGeraFolhaMt.lblcontagem.caption := Format('Processando %d de %d',[cdsDocumento.Recno,cdsDocumento.RecordCount]);

            frmGerafolhaMT.repaint;

            sDataLancamento := DataIni;
            sDataPagamento  := cdsDocumento.FieldByName('DATAPAGAMENTO').AsString; 
            iIdBenefIrrf    := cdsDocumento.FieldByName('IDBENEFIRRF').AsInteger;
            fVlrBase        := cdsDocumento.FieldByName('VLRBASE').AsFloat;
            sCodNatureza    := cdsDocumento.FieldByName('CODNATUREZA').AsString;
            fVlrIrrf        := cdsDocumento.FieldByName('VLRIRRF').AsFloat * -1;
            fVlrreferencia  := cdsDocumento.FieldByName('VLRBASE').AsFloat * -1;
            iPlano          := cdsDocumento.FieldByName('PLANO').AsInteger;
            iPlanoPrev      := cdsDocumento.FieldByName('IDPLANOPREV').AsInteger;
            sPlaconta       := cdsDocumento.FieldByName('PLACONTA').AsString;
            iPatro          := cdsDocumento.FieldByName('IDPATRO').AsInteger;
            iPrograma       := cdsDocumento.FieldByName('IDPROGRAMA').AsInteger;
            sCodCentroCusto := cdsDocumento.FieldByName('CODCENTROCUSTO').AsString;
            iIDMotivo       := cdsDocumento.FieldByName('IDMOTIVO').AsInteger;
            iIDHistFolha    := cdsDocumento.FieldByName('IDHSTFOLHABENEF').AsInteger;
            sCodTipRecDes   := cdsDocumento.FieldByName('CODTIPRECDES').AsString;
            sPlaContaD      := cdsDocumento.FieldByName('PLACONTARECDES').AsString;
            sCodCentroRespon:= cdsDocumento.FieldByName('CODCENTRORESPON').AsString;
            sAnoProc        := Copy(cdsDocumento.FieldByName('DATALANCAMENTO').AsString, 7, 4);

            If (wAno <> StrToInt(sAnoProc)) Or
               (Copy(cdsDocumento.FieldByName('MES').AsString, 6, 2) = '13') Then
              bFlgCompensa := False
            Else
              bFlgCompensa := True;
            cdsAux.Data := GetDataPacket('SELECT * FROM LANCXINFORME WHERE IDLANCIRRF = ' + cdsDocumento.FieldByName('IDLANCIRRF').AsString);

            Ssql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA '+
                     '  FROM  LANCXINFORME '+
                     ' WHERE (1 = 2)';

            cdsDet.data     := GetDataPacket(SSql);

            while not cdsAux.eof do
            begin

               cdsDet.Insert;
               cdsDet.FieldByName('IDINFORME').AsInteger  := cdsAux.FieldByName('IDINFORME').AsInteger;
               cdsDet.FieldByName('VLRLANC').AsFloat      := cdsAux.FieldByName('VLRLANC').AsFloat * -1;
               cdsDet.FieldByName('FONTEPAGADORA').AsFloat:= cdsAux.FieldByName('FONTEPAGADORA').AsFloat; 
               cdsDet.Post;

               cdsAux.Next;
            end;

            bPrimVez := True;
            iCodLanc:=0; 
            LancIRRF.GravaIRRF(IdEmpresa,
                               UsaPlanoPatro,
                               0,
                               IdEmpresa,
                               iIdBenefIrrf,
                               sCodNatureza,
                               sDataLancamento, 
                               fVlrBase,
                               fVlrIrrf,
                               0,
                               0,
                               fVlrreferencia,
                               0,
                               0,
                               0,
                               0,
                               cdsDet.data,
                               iCodLanc,
                               sPlaconta,
                               iPlano,
                               'S',
                               iPlanoPrev,
                               iPatro,
                               iPrograma,
                               bPrimVez,
                               18,
                               18,
                               iIDMotivo,
                               sCodCentroCusto,
                               iIDHistFolha,
                               sCodTipRecDes,
                               sPlaContaD,
                               sCodCentroRespon,
                               0,
                               0,
                               true  
                               , 0,
                               bFlgCompensa, 
                               sDataPagamento); 

            Ssql := 'UPDATE HISTRUBSAL SET IDLANCIRRFESTORNO = '+ FloatTostr(iCodLanc)                + #13 +
                    'WHERE '                                                                          + #13 +
                    '    IDMODULO          = 18 '                                                     + #13 +
                    'AND FLGESTORNO        <> 0 '                                                     + #13 +
                    'AND IDRESPONSAVEL     = ' + IntToStr(iIdBenefIrrf)                               + #13 +
                    'AND IDHSTFOLHABENEF   = ' + IntToStr(iIDHistFolha)                               + #13 +
                    'AND IDLANCIRRF        = ' + cdsDocumento.FieldByName('IDLANCIRRF').AsString;

            if not ExecSQL(sSql) then
               Raise Exception.Create(messageinfo);
            cdsDocumento.Next;

         end;
         Commit;
      Except
         On E:Exception Do
         Begin
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   finally
      cdsAux.Free;
   end;

end;

end.

