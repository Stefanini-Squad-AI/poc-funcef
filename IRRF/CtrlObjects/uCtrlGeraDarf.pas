{-------------------------------------------------------------------------------
----------------------------- HISTÓRICO DE ALTERAÇÕES --------------------------
Rotina:     GravarDocumento
Data:       15/07/2024
Pendencia:  WO10032 - Contas a Pagar - Remessa eletrônica
Autor:      Arnaldo Vicente Scarin
Descricao:  Quando o documento de origem possui diversas contas de baixa
            (CCBaixasXDocum preenchida), deveriam ser levadas essas contas
            para o Documento de Arrecadação de Impostos que é gerado a partir
            do DARF, mas isso não é feito. Em reunião ocorrida com o Cassio e
            o Depto. Contabil, foi informado que esses documentos podem ser
            criados somente com uma conta de baixa e para tanto será utilizada
            a conta de baixa que está vinculada ao Alterador do Imposto.
--------------------------------------------------------------------------------
Data      : 22/02/2024
Autor     : Everson Cunha
Pendencia : WO7479
Descrição : Geração Darf folha empregados idmodulo=21 está sempre passando conta
            de Fornecedores. Deverá considerar a conta parametrizada
--------------------------------------------------------------------------------
Rotina    : GravaCAP
Data      : 29/08/2012
Autor     : Higor Nayde Ferreira
Pendencia : 185443
Descrição : Na procedure GravaCAP passar IDPLANOPREV = 1(um) caso IDPATRO igual
            ou igual a zero
--------------------------------------------------------------------------------
Rotina    : GeraDarf(...)
Data      : 24/10/2007
Autor     : André Pontes
Pendencia : 26680
Descrição : Limpeza do cdsCCBaixasXDocum, que não estava sendo limpo após a
            criação do documento.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux(...)
Data      : 27/08/2007
Autor     : André Pontes
Pendencia : 21875
Descrição : Incluído no select o campo IDPLANOPREVPREV também para o caso de
            depósito judicial (é um SQL diferente)
--------------------------------------------------------------------------------
Rotina    : GeraDarf(...)
Data      : 20/08/2007
Autor     : André Pontes
Pendencia : -
Descrição : Rollback da transacao em caso de crítica/erro na GravaCAP
--------------------------------------------------------------------------------
Rotina    : ListLancamentosAux(...)
Data      : 20/08/2007
Autor     : André Pontes
Pendencia : 21875
Descrição : Incluído no select o campo IDPLANOPREVPREV
--------------------------------------------------------------------------------
Rotina    : GeraDarf(...)
Data      : 12/07/2007
Autor     : André Pontes
Pendencia : 21875
Descrição : Comparação do campo IDPLANOPREVPREV em vez de IDPLANOPREV para
            geração do DARF
--------------------------------------------------------------------------------
Rotina    : ListLancamentos(...)
Data      : 12/07/2007
Autor     : André Pontes
Pendencia : 21875
Descrição : Incluído no select o campo IDPLANOPREVPREV
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux, ListLancamento
Data      : 10/07/2007
Autor     : Bruno Bastos
Pendencia : 20091
Descrição : Alteração no join da LancIRRF com a ProcJud.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 08/06/2007
Autor     : Bruno Bastos
Pendencia : 25553
Descrição : Acerto para gravar um documento por subplano quando o usuário não
            tiver selecionado todos os registros do grid. Acerto também para
            geração de darf de depósito judicial para gravar um documento por
            estado de seção da ação.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 18/04/2007
Autor     : André Pontes
Pendencia : 23882
Descrição : Passagem do Centro de Responsabilidade (sobrescrevendo o rateio dos
            documentos originais)
--------------------------------------------------------------------------------
Rotina    : NaturezaResidExterior(...)
Data      : 21/03/2007
Autor     : André Pontes
Pendência : 24819
Descricao : QuotedStr no CodNatureza, que estava indo pra query sem aspas
--------------------------------------------------------------------------------
Rotina    : GreraDIRF
Data      : 06/11/2006
Autor     : Claudio Faria
Pendência : 24425
Descricao : Filtrar a query de deposito judicial quando não estiver marcado a
            opção de geração por estado.
--------------------------------------------------------------------------------
Rotina    : GreraDIRF
Data      : 06/11/2006
Autor     : Claudio Faria
Pendência : 24425
Descricao : Filtrar a query de deposito judicial quando não estiver marcado a
            opção de geração por estado.
--------------------------------------------------------------------------------
Rotina    : GravaCap
Data      : 06/11/2006
Autor     : Bruno Bastos
Pendência : 23686
Descricao : Se gerar documento individual para cada participante, verificar se
            ele tem registro na empresaforn e fornserv.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 01/11/2006
Autor     : Claudio Faria
Pendência : 20984
Descricao : Opção para emissão de documento de Darf judicial por estado.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux
Data      : 18/10/2006
Autor     : Bruno Bastos
Pendência : 22465
Descricao : Não utilizar mais o campo PlaContaRecDes da LancIRRF. Para facilitar
            a alteração, deixamos PlaContaRecDes como alias, mas como usado
            agora é o PlaConta.
--------------------------------------------------------------------------------
Rotina    : ListLancamentos
Data      : 26/05/2006
Autor     : Paulo Ramos
Pendência : 22342
Descricao : Usar o campo PLACONTA ao invés do campo PLACONTARECDES
            para tratar múltiplas contas de baixa.
--------------------------------------------------------------------------------
Rotina    : GeraDarf e GravaCap
Data      : 21/03/2006
Autor     : Bruno Bastos
Pendência : 21131
Descrição : Pegar atividade e projeto (UnidNegoc), da ParamIrrf, da ParamGlobal
            ou então gravar -1, caso os campos anteriores nãp estejam
            preenchidos.
--------------------------------------------------------------------------------
Rotina    : ListLancamento e ListLancamentoAux
Data      : 08/02/2006
Autor     : Paulo Ramos
Pendência : 21490
Descrição : Filtrar por IDMODULORESPON ao invés do IDMODULO.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 26/12/2005
Autor     : Bruno Bastos
Pendência : 21128
Descrição : Gravar a variável sCodtiprecdes e sCodCentroRespon quando for para
            gerar apenas um documento para darf de depósito judicial.
--------------------------------------------------------------------------------
Rotina    : GravaCap
Data      : 22/12/2005
Autor     : Bruno Bastos
Pendência : 20398
Descrição : Criação de dois parâmetros nesta rotina para tratar se é documento
            individual de depósito judicial.
--------------------------------------------------------------------------------
Rotina    : ListLancamentos
Data      : 20/09/2005
Autor     : Bruno Bastos
Pendência : 19596
Descrição : Mudei a ordenação da query quando for natureza de rendimento de
            depósito judicial.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 09/09/2005
Autor     : Bruno Bastos
Pendência : 20195
Descrição : Coloquei um if para testar se é natureza de depósito judicial.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 05/09/2005
Autor     : Bruno Bastos
Pendência : 19596
Descrição : Gerar apenas um darf para a mesma pessoa quando for depósito
            judicial.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux
Data      : 30/08/2005
Autor     : Bruno Bastos
Pendência : 19566 (Desfazer esta pendência)
Descrição : Pendência 19566 foi desfeita.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 13/07/2005
Autor     : Bruno Bastos
Pendência : 19674
Descrição : Criei um parâmetro para indicar se será gerado um documento
            individual para cada darf ou um documento único.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 11/07/2005
Autor     : Bruno Bastos
Pendência : 19674
Descrição : Alteração na rotina para gerar um documento para cada darf de depó_
            sito judicial.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux
Data      : 07/07/2005
Autor     : Bruno Bastos
Pendência : 19566
Descrição : Buscar tipo de desembolso na tabela naturendimento ou da paramirrf.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux e ListLancamentos
Data      : 26/04/2005
Autor     : Bruno Bastos
Pendência : 19122
Descrição : Foi colocado os campos plano previdenciario, patrocinadora e tipo de
            desembolso.
--------------------------------------------------------------------------------
Rotina    : ListLancamentoAux
Data      : 22/04/2005
Autor     : Bruno Bastos
Pendência : 19098
Descrição : Alteração no decode do campo RazaoSocial para se o vlrirrf for nega_
            tivo colocar o nome da pessoa, senão colocar o nome "FOLHA BENEF".
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 22/04/2005
Autor     : Bruno Bastos
Pendência : 18905
Descrição : Possibilitar a geração do Darf, para mais de mil registros, quando
            depósito judicial, guardando os iddarf's em um cds e depois fazendo
            um while deste cds.
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 18/04/2005
Autor     : Bruno Bastos
Pendência : 19007
Descrição : Acerto no cds que era usado para gravar CCBaixasxDocum
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 12/01/2005
Autor     : Marchetti
Pendência : 18164
Descrição : Acerto no rateio do IOF
--------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 19/11/2004
Autor     : Bruno Bastos
Pendência : 18090
Descrição : Comentei a parte do código que gravava o campo CODDOCUMENTO na
            tabela LANCIRRF, pois o mesmo campo já é atualizado na tabela DARF e
            a LANCIRRF tem o campo IDDARF. Sendo assim caso fosse, ou mesmo que
            ainda seja necessário buscar alguma informação em uma destas tabelas
            basta fazer um join entre as tabelas, pelo campo IDDARF, existente
            em ambas.
--------------------------------------------------------------------------------}

unit uCtrlGeraDarf;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
  uCtrlDARF, uCtrUtilLancIRRF, uCtrlParamIntegra, uString, uCtrlDocumento, uCtrlPadroes, Forms,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  type
    TCtrlGeraDarf = Class(TCmControlObject)

    private
      CdsLancamentos    : TClientDataSet;

      cdsCCBaixasxDocum : TClientDataSet; 
      cdsBuscaFornServ  : TClientDataSet; 
      cdsRateio         : TClientDataSet;
      cdsParamIRRF      : TClientDataSet;
      cdsCodRendGer     : TClientDataSet;
      cdsNatureza       : TClientDataSet;
      cdsDepJudicial    : TClientDataSet; 
      cdsParamGlobal    : TClientDataSet; 

      cdsLanc, cdsDoc, cdsRat : TClientDataSet;

      CtrlDarf : TCtrlDARF;
      UtilLancIRRF : TCtrUtilLancIRRF;
      CtrlDocumento : TCtrlDocumento;

    protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


    public

      iCodDarf, iPlanoPrev, iPatro, iPrograma : LongInt;
      rValorDarf : Double;
      sCodCentroRespon, sCodCentroCusto,sDataLanc, sCodNatureza, sContaContabil :string;

      sUFSecao:string; 

      sUnidNegoc : string; 
      sContaContabRecDes, sCodtipRecdes : string; 

      Constructor Create; Override;
      Destructor Destroy; Override;

      
      function ListLancamentos(IdPessoa, Imposto,iModulo : LongInt; DataFim, DataIni, CodNatureza : string) : OleVariant;
      function ListLancamentoAux(IdPessoa, Imposto, iModulo : LongInt; DataFim, DataIni, CodNatureza : string) : OleVariant;
      
      function ListLancamentosAgrupados(IdPessoa,
                                        Imposto,
                                        iModulo : LongInt;
                                        DataFim,
                                        DataIni,
                                        CodNatureza : string) : OleVariant; 

      function ListCCBaixasxDocum(piCodDocumento: Integer) : OleVariant; 

      function ListCodigos : OleVariant;
      function GeraDarf(IdPessoa,
                        IdModulo,
                        IdUsuario,
                        IdEspAcesso : LongInt;
                        DataRateio,
                        DataLancamentos,
                        DataCodigos,
                        DataCCBaixasxDocum : OleVariant; 
                        DataIni,
                        DataFim,
                        DataVenc,
                        Obs,
                        referencia : string;
                        UsaPlanoPatro   : Boolean;
                        psCentroRespon  : string  
                       ): Boolean;

      function GravaCAP(IdPessoa,
                        IdModulo,
                        iCodDarf,
                        IdUsuario,
                        IdEspAcesso : LongInt;
                        sCodNatureza,
                        DataIni,
                        DataFim,
                        DataVenc,
                        Obs,
                        referencia,
                        spContaContabRecdes,
                        spCodTipRecdes : string;
                        rValorDarf : Real;
                        UsaPlanoPatro : Boolean;
                        piDocIndividual,
                        piIdBenefIRRF: Integer;
                        pCodDocumento : Integer = -1) : Boolean;

      function NaturezaResidExterior(CodNaturesa : string) : Boolean;
      function BuscaRegPendenteDarf(const pdDtIniIRRF : TDateTime;
                                    const pdDtFimIRRF : TDateTime;
                                    const pdDtIniCSLL : TDateTime;
                                    const pdDtFimCSLL : TDateTime;
                                    const pdDtIniIOF  : TDateTime;
                                    const pdDtFimIOF  : TDateTime): OleVariant;

    end;



implementation
{ TCtrlGeraDarf }


procedure TCtrlGeraDarf.AfterInitialize;
begin
  inherited;
  CtrlDarf.InitializeAs(Self);
  UtilLancIRRF.InitializeAs(Self);

  CtrlDarf.OpenTransaction      := False;
  UtilLancIRRF.OpenTransaction  := False;
end;



constructor TCtrlGeraDarf.Create;
begin
  inherited;
  CdsLancamentos := TClientDataSet.Create(nil);
  cdsCCBaixasxDocum := TClientDataSet.Create(nil); 
  cdsBuscaFornServ  := TClientDataSet.Create(nil); 
  cdsRateio         := TClientDataSet.Create(nil);
  cdsParamIRRF      := TClientDataSet.Create(nil);
  cdsCodRendGer     := TClientDataSet.Create(nil);
  cdsNatureza       := TClientDataSet.create(nil);
  cdsLanc           := TClientDataSet.create(nil);
  cdsDoc            := TClientDataSet.create(nil);
  cdsRat            := TClientDataSet.create(nil);
  cdsDepJudicial    := TClientDataSet.create(nil); 
  cdsParamGlobal    := TClientDataSet.create(nil); 

  CtrlDarf          := TCtrlDARF.Create;
  UtilLancIRRF      := TCtrUtilLancIRRF.create;

  CtrlDocumento     := TCtrlDocumento.Create;

  CtrlDocumento.InitializeAs(Padroes);
end;



destructor TCtrlGeraDarf.Destroy;
begin
  inherited;

  CdsLancamentos.Free;
  cdsCCBaixasxDocum.Free;
  cdsBuscaFornServ.Free;
  cdsDepJudicial.Free; 
  cdsParamGlobal.Free; 
  cdsRateio.Free;
  cdsParamIRRF.Free;
  cdsCodRendGer.Free;
  cdsNatureza.Free;
  CtrlDarf.Free;
  UtilLancIRRF.Free;
  CtrlDocumento.Free; 
end;



procedure TCtrlGeraDarf.DoChangeDataBase;
begin
  inherited;
end;



function TCtrlGeraDarf.GeraDarf(IdPessoa,
                                IdModulo,
                                IdUsuario,
                                IdEspAcesso : Integer;
                                DataRateio,
                                DataLancamentos,
                                DataCodigos,
                                DataCCBaixasxDocum : OleVariant; 
                                DataIni,
                                DataFim,
                                DataVenc,
                                Obs,
                                referencia      : string;
                                UsaPlanoPatro   : Boolean;
                                psCentroRespon  : string  
                               ): Boolean;
var
  sSQL              : string;
  bDepJudicial      : Boolean;
  rvaltmp2          : Double;
  sSQLTmp           : string;
  sListaDarf        : string;
  sUltIdBenefIrrf   : string;
  sGuardaUFSecao    : string;
  iIdPlanoPrev      : Integer; 
  sCRGravacao       : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GeraDarf(IdPessoa,
                                            IdModulo,
                                            IdUsuario,
                                            IdEspAcesso,
                                            DataRateio,
                                            DataLancamentos,
                                            DataCodigos,
                                            DataIni,
                                            DataFim,
                                            DataVenc,
                                            Obs,
                                            Referencia,
                                            UsaPlanoPatro,
                                            psCentroRespon  
                                           );

    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := True;

    sUltIdBenefIrrf    := '$'; 
    sDataLanc          := '$';
    sCodNatureza       := '$';
    sContaContabil     := '$';
    sCodtipRecdes      := '$';  
    sContaContabRecDes := '$';  
    iPlanoPrev         := -100;
    sCodCentroCusto    := '$';
    sCodCentroRespon   := '$';
    iPatro             := -100;
    iPrograma          := -100;
    iCodDarf           := 0;
    rValorDarf         := 0;
    bDepJudicial       := False;

    try
      StartTransaction;

      cdsLancamentos.Data     := DataLancamentos;
      cdsCCBaixasxDocum.Data  := DataCCBaixasxDocum; 
      cdsDepJudicial.Data     := GetDataPacket('SELECT 0 AS IDDARF, ''RJ'' AS UFSECAO FROM DARF WHERE IDDARF = -1 '); 
      cdsParamGlobal.Data     := GetDataPacket('SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa)); 
      cdsRateio.Data          := DataRateio;

      sSQL :=
      'SELECT '                                                       + #13 +
      '  L.IDFORCLI, L.CODTIPRECDES, '                                + #13 +
      '  E.PLANO, E.CODSUBCONTA, E.CODCENTROCUSTO, E.CONTACFORN, '    + #13 +
      '  L.CODTIPDOC, L.CODCENTRORESPON, L.UNIDNEGOC, '               + #13 +
      '  L.FLGDOCDARFIRJUD, '                                         + #13 + 
      '  L.FLGTIPOGERADARF '                                          + #13 + 

      'FROM '                                                         + #13 +
      '  EMPRESAFORN E, '                                             + #13 +
      '  PARAMIRRF   L  '                                             + #13 +

      'WHERE  '                                                       + #13 +
      '      L.IDPESSOA = ' + IntToStr(IdPessoa)                      + #13 +
      '  AND E.IDPESSOA = L.IDPESSOA '                                + #13 +
      '  AND E.IDFORCLI = L.IDFORCLI ';

      cdsParamIRRF.Data := GetDataPacket(sSQL);

      // -------------------------------------------------------------------------------------------
      if cdsParamIRRF.FieldByName('UNIDNEGOC').AsString <> '' then
         sUnidNegoc := cdsParamIRRF.FieldByName('UNIDNEGOC').AsString
      else
        if cdsParamGlobal.FieldByName('UNIDNEGOC').AsString <> '' then
          sUnidNegoc := cdsParamGlobal.FieldByName('UNIDNEGOC').AsString
        else
          sUnidNegoc := '-1';
      // -------------------------------------------------------------------------------------------

      sListaDarf := '';

      iIdPlanoPrev := -1;
      if cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2' then
      begin
        cdsLancamentos.IndexFieldNames := 'IDPLANOPREVPREV';  
        cdsLancamentos.First; 
        iIdPlanoPrev := cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger;  
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------


      cdsLancamentos.First;
      while not(cdsLancamentos.EOF) do
      begin
        sCRGravacao := cdsLancamentos.FieldByName('CODCENTRORESPON').AsString;
        if psCentroRespon <> '' then
          sCRGravacao := psCentroRespon;

        if (cdsLancamentos.FieldByName('IDMODULO').AsInteger = 21) then  // Folha de Funcionarios
        begin
          //sContaContabRecDes := cdsParamIRRF.fieldbyname('CONTACFORN').asstring;     //Everson Cunha - WO7479
          sContaContabRecDes := cdsLancamentos.fieldbyname('PLACONTARECDES').asstring; //Everson Cunha - WO7479
          sCodtipRecdes      := cdsParamIRRF.fieldbyname('CODTIPRECDES').asstring;

          if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
          begin
            if (sCodNatureza <> cdsLancamentos.FieldByName('CODNATUREZA').AsString) or
               (sContaContabil <> cdsLancamentos.FieldByName('PLACONTARECDES').AsString) then
            begin
              if iCodDarf <> 0 then
              begin
                if not(cdsParamIrrf.IsEmpty) then
                begin
                  if not(GravaCAP(IdPessoa,
                                  idModulo,
                                  iCodDarf,
                                  IdUsuario,
                                  IdEspAcesso,
                                  sCodNatureza,
                                  DataIni,
                                  DataFim,
                                  DataVenc,
                                  Obs,
                                  referencia,
                                  sContaContabRecDes,
                                  sCodtipRecdes,
                                  rValorDarf,
                                  UsaPlanoPatro,
                                  1,
                                  0,
                                  cdsLancamentos.FieldByName('CodDocumento').asInteger
                                 )) then
                  begin
                    Result := False;
                    Rollback; 
                    Exit;
                  end;
                end;

                cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                cdsCCBaixasxDocum.Data  := ListCCBaixasxDocum(-1);  

                rValorDarf := 0;
              end;

              iCodDarf := getSequence('DARF');
            end;

            if not(UtilLancIRRF.GravaDarf(IdPessoa,
                                          iCodDarf,
                                          cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger,
                                          DataIni,
                                          DataFim,
                                          DataVenc,
                                          cdsLancamentos.FieldByName('FLGFOLHA').AsString,
                                          DataCodigos
                                         )) then
            begin
              Result      := False;
              MessageInfo := UtilLancIRRF.MessageInfo;
              Exit;
            end;

            if (iPatro          = cdsLancamentos.FieldByName('IDPATRO').AsInteger) and
               (iPlanoPrev      = cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger) and
               (sCodCentroCusto = cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString) and
               (iPrograma       = cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger) then
            begin
              cdsRateio.Edit;
              cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
              cdsRateio.Post;
            end
            else
            begin
              cdsRateio.Insert;
              cdsRateio.FieldByName('VALOR').AsFloat            := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
              cdsRateio.FieldByName('IDPATRO').AsFloat          := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
              cdsRateio.FieldByName('IDPLANOPREV').AsFloat      := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
              cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
              cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
              cdsRateio.FieldByName('IDPROGRAMA').AsFloat       := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
              cdsRateio.fieldbyname('CODTIPRECDES').asstring    := sCodtipRecdes; 
              cdsRateio.Post;
            end;

            rValorDarf        := rValorDarf + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
            sCodNatureza      := cdsLancamentos.FieldByName('CODNATUREZA').AsString;
            sContaContabil    := cdsLancamentos.FieldByName('PLACONTARECDES').AsString;
            sCodCentroCusto   := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
            sCodCentroRespon  := sCRGravacao; 
            iPatro            := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
            iPlanoPrev        := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
            iPrograma         := cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger;
          end;
        end
        else  // if (cdsLancamentos.FieldByName('IDMODULO').AsInteger = 21)
        begin  // Tudo menos folha de funcionarios e deposito judicial
          if ((cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7431') and
              (cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7416')) then
          begin
            if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
            begin
              if (sCodNatureza <> cdsLancamentos.FieldByName('CODNATUREZA').AsString) then
              begin
                if iCodDarf <> 0 then
                begin
                  if not cdsParamIrrf.IsEmpty then
                  begin
                    if not(GravaCAP(IdPessoa,
                                    IdModulo,
                                    iCodDarf,
                                    IdUsuario,
                                    IdEspAcesso,
                                    sCodNatureza,
                                    DataIni,
                                    DataFim,
                                    DataVenc,
                                    Obs,
                                    referencia,
                                    sContaContabrecDes,
                                    sCodTipRecdes,
                                    rValorDarf,
                                    UsaPlanoPatro,
                                    1,
                                    0,
                                    cdsLancamentos.FieldByName('CodDocumento').asInteger
                                   )) then
                    begin
                      Result := False;
                      Rollback; 
                      Exit;
                    end;
                  end;

                  cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                  cdsCCBaixasxDocum.Data  := ListCCBaixasxDocum(-1);  

                  rValorDarf := 0;
                end;

                iCodDarf := getSequence('DARF');
              end;

              if not(UtilLancIRRF.GravaDarf(IdPessoa,
                                            iCodDarf,
                                            cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger,
                                            DataIni,
                                            DataFim,
                                            DataVenc,
                                            cdsLancamentos.FieldByName('FLGFOLHA').AsString,
                                            DataCodigos
                                           )) then
              begin
                Result := False;
                MessageInfo := UtilLancIRRF.MessageInfo;
                Exit;
              end;

              if cdsLancamentos.FieldByName('CODNATUREZA').AsString = '7893' then // IOF
              begin
                if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                                    VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                    cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                    cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString,
                                    cdsLancamentos.FieldByName('CODTIPRECDES').AsString,
                                    cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger]),[]) then
                begin
                  cdsRateio.Edit;
                  cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                  cdsRateio.Post;
                end
                else
                begin
                  cdsRateio.Insert;
                  cdsRateio.FieldByName('VALOR').AsFloat            := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                  cdsRateio.FieldByName('IDPATRO').AsFloat          := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
                  cdsRateio.FieldByName('IDPLANOPREV').AsFloat      := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
                  cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                  cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
                  cdsRateio.FieldByName('IDPROGRAMA').AsFloat       := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
                  cdsRateio.Fieldbyname('CODTIPRECDES').asstring    := cdslancamentos.fieldbyname('CODTIPRECDES').asstring;
                  cdsRateio.Post;
                end;
              end
              else
              begin
                if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                                     VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                     cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                     cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString,
                                     cdsLancamentos.FieldByName('CODTIPRECDES').AsString,
                                     cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger]),[]) then
                begin
                  cdsRateio.Edit;
                  cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                  cdsRateio.Post;
                end
                else
                begin
                  cdsRateio.Insert;
                  cdsRateio.FieldByName('VALOR').AsFloat            := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                  cdsRateio.FieldByName('IDPATRO').AsFloat          := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
                  cdsRateio.FieldByName('IDPLANOPREV').AsFloat      := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
                  cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                  cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
                  cdsRateio.FieldByName('IDPROGRAMA').AsFloat       := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
                  cdsRateio.Fieldbyname('CODTIPRECDES').asstring    := cdslancamentos.fieldbyname('CODTIPRECDES').asstring;
                  cdsRateio.Post;
                end;
              end;

              rValorDarf          := rValorDarf + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
              sCodNatureza        := cdsLancamentos.FieldByName('CODNATUREZA').AsString;
              sContaContabRecdes  := cdsLancamentos.FieldByName('PLACONTARECDES').AsString; 
              sCodTipRecdes       := cdsLancamentos.FieldByName('CODTIPRECDES').AsString; 
              sCodCentroCusto     := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
              sCodCentroRespon    := sCRGravacao; 
              iPatro              := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
              iPlanoPrev          := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
              iPrograma           := cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger;
            end;
          end
          else  // DEP. JUDCIAL. OS DARFS DEVEM SER GERADOS INDIVIDUALMENTE POR PARTICIPANTE
          begin
            bDepJudicial := true;

            if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
            begin
              if sUltIdBenefIrrf <> cdsLancamentos.FieldByName('IDBENEFIRRF').AsString then 
                iCodDarf := getSequence('DARF');

              if not UtilLancIRRF.GravaDarf(IdPessoa, iCodDarf, cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger,
                                            DataIni, DataFim, DataVenc, cdsLancamentos.FieldByName('FLGFOLHA').AsString,
                                            DataCodigos) then
              begin
                Result := False;
                MessageInfo := UtilLancIRRF.MessageInfo;
                Exit;
              end;


              // -----------------------------------------------------------------------------------
              case cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger of
                0 : begin
                      rValorDarf         := rValorDarf + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                      rvaltmp2           := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                      sUltIdBenefIrrf    := cdsLancamentos.FieldByName('IDBENEFIRRF').AsString; 
                      sCodNatureza       := cdsLancamentos.FieldByName('CODNATUREZA').AsString;
                      sContaContabrecdes := cdsLancamentos.FieldByName('PLACONTARECDES').AsString; 
                      sCodtiprecdes      := cdsLancamentos.FieldByName('CODTIPRECDES').AsString; 
                      sCodCentroCusto    := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                      sCodCentroRespon   := sCRGravacao; 
                      iPatro             := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
                      iPlanoPrev         := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
                      iPrograma          := cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger;

                      if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                                           VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                           cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                           cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString,
                                           cdsLancamentos.FieldByName('CODTIPRECDES').AsString,
                                           cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger]),[]) then
                      begin
                        cdsRateio.Edit;
                        cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                        cdsRateio.Post;
                      end
                      else
                      begin
                        cdsRateio.Insert;
                        cdsRateio.FieldByName('VALOR').AsFloat            := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                        cdsRateio.FieldByName('IDPATRO').AsFloat          := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
                        cdsRateio.FieldByName('IDPLANOPREV').AsFloat      := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
                        cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                        cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
                        cdsRateio.FieldByName('IDPROGRAMA').AsFloat       := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
                        cdsRateio.Fieldbyname('CODTIPRECDES').asstring    := cdslancamentos.fieldbyname('CODTIPRECDES').asstring;
                        cdsRateio.Post;
                      end;
                    end;

                1 : begin
                      cdsDepJudicial.Insert;
                      cdsDepJudicial.FieldByName('IDDARF').AsInteger := iCodDarf;
                      cdsDepJudicial.Post;
                      sUltIdBenefIrrf    := cdsLancamentos.FieldByName('IDBENEFIRRF').AsString; 

                      sCodtiprecdes      := cdsLancamentos.FieldByName('CODTIPRECDES').AsString; 
                      sCodCentroRespon   := sCRGravacao; 
                    end;

                2 : begin 
                      cdsDepJudicial.Insert;
                      cdsDepJudicial.FieldByName('IDDARF').AsInteger := iCodDarf;
                      cdsDepJudicial.FieldByName('UFSECAO').AsString := cdsLancamentos.FieldByName('UFSECAO').AsString;
                      cdsDepJudicial.Post;

                      sUltIdBenefIrrf    := cdsLancamentos.FieldByName('IDBENEFIRRF').AsString;
                      sCodtiprecdes      := cdsLancamentos.FieldByName('CODTIPRECDES').AsString;
                      sCodCentroRespon   := sCRGravacao; 
                    end;  
              end;  
              // -----------------------------------------------------------------------------------

            end;
          end;
        end;  // if (cdsLancamentos.FieldByName('IDMODULO').AsInteger = 21)

        {Insere no cdsCCBaixasxDocum, para testar Múltiplas Contas de Baixa}
        if ((cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 1) And
           ((cdsLancamentos.FieldByName('CODNATUREZA').AsString = '7416') or
            (cdsLancamentos.FieldByName('CODNATUREZA').AsString = '7431'))) or
            ((cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7416') And
             (cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7431')) then
        begin
          if cdsLancamentos.FieldByName('PLACONTARECDES').AsString <> '' then
          begin
            if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
            begin
              if cdsCCBaixasxDocum.Locate('IDPATRO;IDPLANOPREV;PLACONTA',
                                          VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                          cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                          cdsLancamentos.FieldByName('PLACONTARECDES').AsString]), []) then
              begin
                cdsCCBaixasxDocum.Edit;
                cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                cdsCCBaixasxDocum.Post;
              end
              else
              begin
                if (cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger     <> cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger)    Or
                   (cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger         <> cdsLancamentos.FieldByName('IDPATRO').AsInteger)        Or
                   (cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString         <> cdsLancamentos.FieldByName('PLACONTARECDES').AsString)  then
                begin
                  cdsCCBaixasxDocum.Insert;
                  cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
                  cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger         := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
                  cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger        := cdsLancamentos.FieldByName('IDPESSOA').AsInteger;
                  cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString         := cdsLancamentos.FieldByName('PLACONTARECDES').AsString;
                  cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsString        := sUnidNegoc; 
                  cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger           := cdsLancamentos.FieldByName('PLANO').AsInteger;
                  cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat             := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                  cdsCCBaixasxDocum.Post;
                end;
              end;
            end;
          end;
        end;

        cdsLancamentos.Next;

        if ((cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7416')  and
            (cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7431')) and
           ( cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2' )  then
        begin
          if (iCodDarf <> 0) And
             ((iIdPlanoPrev <> cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger) or
             (cdslancamentos.EOF)) then
          begin
            if not GravaCAP(IdPessoa,
                            IdModulo,
                            iCodDarf,
                            IdUsuario,
                            IdEspAcesso,
                            sCodNatureza,
                            DataIni,
                            DataFim,
                            DataVenc,
                            Obs,
                            referencia,
                            sContaContabRecdes,
                            sCodtiprecdes,
                            rValorDarf,
                            UsaPlanoPatro,
                            1,
                            0,
                            cdsLancamentos.FieldByName('CodDocumento').asInteger) then
            begin
              Result := False;
              Rollback; 
              Exit;
            end;

            rValorDarf := 0;
            cdsRateio.Data         := CtrlDarf.ProcurarRateio(-1);
            cdsCCBaixasxDocum.Data  := ListCCBaixasxDocum(-1);  

            iIdPlanoPrev := cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger; 

            sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento);
            sSQLtmp := sSQLtmp + ' WHERE IDDARF = '+ IntToStr(iCodDarf) ;


            if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
              iCodDarf := getSequence('DARF')
            else
              iCodDarf := 0;

            if not ExecSQL(sSQLtmp) then
            begin
              Result := False;
              Exit;
            end;
          end;
        end;
        if ((cdsLancamentos.FieldByName('CODNATUREZA').AsString = '7416') or
            (cdsLancamentos.FieldByName('CODNATUREZA').AsString = '7431')) then
        begin
          if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 0 then
          begin
            if (iCodDarf <> 0) And
               ((sUltIdBenefIrrf <> cdsLancamentos.FieldByName('IDBENEFIRRF').AsString) or
               (cdslancamentos.EOF)) then
            begin
              if not GravaCAP(IdPessoa,
                              IdModulo,
                              iCodDarf,
                              IdUsuario,
                              IdEspAcesso,
                              sCodNatureza,
                              DataIni,
                              DataFim,
                              DataVenc,
                              Obs,
                              referencia,
                              sContaContabRecdes,
                              sCodtiprecdes,
                              rValorDarf,
                              UsaPlanoPatro,
                              0,
                              StrToInt(sUltIdBenefIrrf),
                              cdsLancamentos.FieldByName('CodDocumento').asInteger) then 
              begin
                  Result := False;
                  Rollback; 
                  Exit;
              end;

              rValorDarf := 0;
              cdsRateio.Data         := CtrlDarf.ProcurarRateio(-1);
              cdsCCBaixasxDocum.Data  := ListCCBaixasxDocum(-1);  

              sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento);
              sSQLtmp := sSQLtmp + ' WHERE IDDARF = '+ IntToStr(iCodDarf) ;

              if not ExecSQL(sSQLtmp) then
              begin
                  Result := False;
                  Exit;
              end;
            end;
          end;
        end;
        
      end;
      
      // -------------------------------------------------------------------------------------------

      if bDepJudicial then
      begin
        case cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger of
          1 : begin
                sDataLanc          := '$';
                sCodNatureza       := '$';
                sContaContabrecdes := '$';  
                sCodTipRecdes      := '$';  
                iPlanoPrev         := -100;
                sCodCentroCusto    := '$';
                sCodCentroRespon   := '$';
                iPatro             := -100;
                iPrograma          := -100;
                
                rValorDarf         := 0;
                rValtmp2           := 0;

                cdsRateio.Data     := CtrlDarf.ProcurarRateio(-1);

                cdsLancamentos.First;
                while not(cdsLancamentos.EOF) do
                begin
                  if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
                  begin
                    
                    rValorDarf         := rValorDarf + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                    
                    rvaltmp2           := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                    sCodNatureza       := cdsLancamentos.FieldByName('CODNATUREZA').AsString;
                    sContaContabrecdes := cdsLancamentos.FieldByName('PLACONTARECDES').AsString; 
                    sCodtiprecdes      := cdsLancamentos.FieldByName('CODTIPRECDES').AsString; 
                    sCodCentroCusto    := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                    sCodCentroRespon   := sCRGravacao; 
                    iPatro             := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
                    iPlanoPrev         := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
                    iPrograma          := cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger;

                    if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                                        VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                                    cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                                    cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString,
                                                    cdsLancamentos.FieldByName('CODTIPRECDES').AsString,
                                                    cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger]),[]) then
                    begin
                      cdsRateio.Edit;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + rvaltmp2;
                      cdsRateio.Post;
                    end
                    else
                    begin
                      cdsRateio.Insert;
                      cdsRateio.FieldByName('VALOR').AsFloat           := rvaltmp2;
                      cdsRateio.FieldByName('IDPATRO').AsFloat         := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
                      cdsRateio.FieldByName('IDPLANOPREV').AsFloat     := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
                      cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                      cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
                      cdsRateio.FieldByName('IDPROGRAMA').AsFloat      := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
                      cdsRateio.fieldbyname('CODTIPRECDES').asstring   := cdsLancamentos.FieldByName('CODTIPRECDES').AsString;; 
                      cdsRateio.Post;
                    end;
                  end;

                  cdslancamentos.Next;
                end;

                if not cdsParamIrrf.IsEmpty then
                begin
                  if not GravaCAP(IdPessoa,
                                  IdModulo,
                                  iCodDarf,
                                  IdUsuario,
                                  IdEspAcesso,
                                  sCodNatureza,
                                  DataIni,
                                  DataFim,
                                  DataVenc,
                                  Obs,
                                  referencia,
                                  sContaContabRecdes,
                                  sCodtiprecdes,
                                  rValorDarf,
                                  UsaPlanoPatro,
                                  1,
                                  0,
                                  cdsLancamentos.FieldByName('CodDocumento').asInteger) then
                  begin
                      Result := False;
                      Rollback; 
                      Exit;
                  end;
                end;

                
                cdsDepJudicial.First;
                while not cdsDepJudicial.EOF Do
                begin
                  sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento);
                  sSQLtmp := sSQLtmp + ' WHERE IDDARF = '+ cdsDepJudicial.FieldByName('IDDARF').AsString ;

                  if not ExecSQL(sSQLtmp) then
                  begin
                    Result := False;
                    Exit;
                  end;

                  cdsDepJudicial.Next;
                end;
                

              end;
          2 : begin
                sDataLanc          := '$';
                sCodNatureza       := '$';
                sContaContabrecdes := '$';
                sCodTipRecdes      := '$';
                iPlanoPrev         := -100;
                sCodCentroCusto    := '$';
                sCodCentroRespon   := '$';
                iPatro             := -100;
                iPrograma          := -100;
                rValorDarf         := 0;
                rValtmp2           := 0;

                cdsRateio.Data     := CtrlDarf.ProcurarRateio(-1);
                cdsCCBaixasxDocum.Data  := ListCCBaixasxDocum(-1); 

                cdsLancamentos.IndexFieldNames := 'UFSECAO';
                cdsLancamentos.First;
                sGuardaUFSecao := cdsLancamentos.FieldByName('UFSECAO').AsString;

                while not cdsLancamentos.EOF do
                begin
                  if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
                  begin
                    rValorDarf         := rValorDarf + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                    rvaltmp2           := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                    sCodNatureza       := cdsLancamentos.FieldByName('CODNATUREZA').AsString;
                    sContaContabrecdes := cdsLancamentos.FieldByName('PLACONTARECDES').AsString;
                    sCodtiprecdes      := cdsLancamentos.FieldByName('CODTIPRECDES').AsString;
                    sCodCentroCusto    := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                    sCodCentroRespon   := sCRGravacao; 
                    iPatro             := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
                    iPlanoPrev         := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
                    iPrograma          := cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger;

                    if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                                        VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                                    cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                                    cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString,
                                                    cdsLancamentos.FieldByName('CODTIPRECDES').AsString,
                                                    cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger]),[]) then
                    begin
                      cdsRateio.Edit;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + rvaltmp2;
                      cdsRateio.Post;
                    end
                    else
                    begin
                      cdsRateio.Insert;
                      cdsRateio.FieldByName('VALOR').AsFloat            := rvaltmp2;
                      cdsRateio.FieldByName('IDPATRO').AsFloat          := cdsLancamentos.FieldByName('IDPATRO').AsFloat;
                      cdsRateio.FieldByName('IDPLANOPREV').AsFloat      := cdsLancamentos.FieldByName('IDPLANOPREV').AsFloat;
                      cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString;
                      cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao; 
                      cdsRateio.FieldByName('IDPROGRAMA').AsFloat       := cdsLancamentos.FieldByName('IDPROGRAMA').AsFloat;
                      cdsRateio.fieldbyname('CODTIPRECDES').asstring    := cdsLancamentos.FieldByName('CODTIPRECDES').AsString;; 
                      cdsRateio.Post;
                    end;

                    if cdsCCBaixasxDocum.Locate('IDPATRO;IDPLANOPREV;PLACONTA',
                                                VarArrayOf([cdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                                            cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                                            cdsLancamentos.FieldByName('PLACONTARECDES').AsString]), []) then
                    begin
                      cdsCCBaixasxDocum.Edit;
                      cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                      cdsCCBaixasxDocum.Post;
                    end
                    else
                    begin
                      if (cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger <> cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger)    Or
                         (cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger     <> cdsLancamentos.FieldByName('IDPATRO').AsInteger)        Or
                         (cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString     <> cdsLancamentos.FieldByName('PLACONTARECDES').AsString)  then
                      begin
                        cdsCCBaixasxDocum.Insert;
                        cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger         := cdsLancamentos.FieldByName('IDPATRO').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger        := cdsLancamentos.FieldByName('IDPESSOA').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString         := cdsLancamentos.FieldByName('PLACONTARECDES').AsString;
                        cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsString        := sUnidNegoc;
                        cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger           := cdsLancamentos.FieldByName('PLANO').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat             := cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
                        cdsCCBaixasxDocum.Post;
                      end;
                    end;
                  end;

                  cdslancamentos.Next;

                  if (sGuardaUFSecao <> cdsLancamentos.FieldByName('UFSECAO').AsString) OR
                     (cdsLancamentos.EOF) then
                  begin
                    if not cdsParamIrrf.IsEmpty then
                    begin
                      if cdsDepJudicial.Locate('UFSECAO', sGuardaUFSecao, []) then
                      begin
                        iCodDarf := cdsDepJudicial.FieldByName('IDDARF').AsInteger;

                        if not GravaCAP(IdPessoa,
                                        IdModulo,
                                        iCodDarf,
                                        IdUsuario,
                                        IdEspAcesso,
                                        sCodNatureza,
                                        DataIni,
                                        DataFim,
                                        DataVenc,
                                        Obs,
                                        referencia,
                                        sContaContabRecdes,
                                        sCodtiprecdes,
                                        rValorDarf,
                                        UsaPlanoPatro,
                                        1,
                                        0,
                                        cdsLancamentos.FieldByName('CodDocumento').asInteger) then
                        begin
                          Result := False;
                          Rollback; 
                          Exit;
                        end;

                        cdsDepJudicial.First;

                        while not cdsDepJudicial.EOF Do
                        begin
                          sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento);
                          sSQLtmp := sSQLtmp + ' WHERE IDDARF = '+ cdsDepJudicial.FieldByName('IDDARF').AsString ;

                          if cdsDepJudicial.FieldByName('UFSECAO').AsString = sGuardaUFSecao then
                          begin
                            if not ExecSQL(sSQLtmp) then
                            begin
                                Result := False;
                                Exit;
                            end;
                          end;

                          cdsDepJudicial.Next;
                        end;
                      end;

                      cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                      cdsCCBaixasxDocum.Data := ListCCBaixasxDocum(-1);
                      rValorDarf     := 0;
                      sGuardaUFSecao := cdsLancamentos.FieldByName('UFSECAO').AsString
                    end;
                  end;
                end;
              end;
              
        end
      end
      else
      begin
        //Para gravar o ultimo registro.
        if (not cdsParamIrrf.IsEmpty) and (rValorDarf <> 0) Then
        begin
          if not GravaCAP(IdPessoa,
                          IdModulo,
                          iCodDarf,
                          IdUsuario,
                          IdEspAcesso,
                          sCodNatureza,
                          DataIni,
                          DataFim,
                          DataVenc,
                          Obs,
                          referencia,
                          sContaContabRecDes,
                          sCodtiprecdes,
                          rValorDarf,
                          UsaPlanoPatro,
                          1,
                          0,
                          cdsLancamentos.FieldByName('CodDocumento').asInteger) then
          begin
             Result := False;
             Raise Exception.Create(messageinfo);
          end;
        end;
      end;

      Commit;

    Except
      On E:Exception Do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;



function TCtrlGeraDarf.GravaCAP(IdPessoa, IdModulo, iCodDarf, IdUsuario,
                                IdEspAcesso : integer; sCodNatureza, DataIni,
                                DataFim, DataVenc, Obs, referencia,
                                spContaContabRecdes, spCodtiprecdes : string;
                                rValorDarf : Real; UsaPlanoPatro : Boolean;
                                piDocIndividual, piIdBenefIRRF: Integer;
                                pCodDocumento : Integer) : Boolean;
var
  IdPatro, IdPrograma, IdPlanoPrev,iPlano,
  iSubContaCli, PlnCodigo, iCodForn, iCodForma : LongInt;
  sSQL,sContaCliFor,sCCustoCliFor,ssCodTipRecDes : string;
  rvalortmp : double;
  iIdRamoTipoFor : Integer;

begin
      if ConnectionSide = cnsClient then
      begin
         Result := Connection.AppServer.GravaCAPDARF(IdPessoa, IdModulo, iCodDarf, IdUsuario, IdEspAcesso,
                                                     sCodNatureza, DataIni, DataFim, DataVenc,
                                                     Obs, Referencia, rValorDarf, UsaPlanoPatro,
                                                     piDocIndividual,
                                                     piIdBenefIRRF);
         if not Result then
            MessageInfo := Connection.AppServer.MessageInfo;
      end
      else
      begin 
           CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
           CtrlDocumento.IdEspAcesso        := IdEspAcesso;
           CtrlDocumento.IdUsuario          := IdUsuario;


           Result := True;
           rvalortmp := 0;
           sSQL := 'SELECT '+
                   'TRD.IDPESSOA, '+
                   'TRD.RECPAG, '+
                   'TRD.CODTIPRECDES, '+
                   'TRD.PLANO AS PLANOFORN, '+
                   'EPF.CODSUBCONTA, '+
                   'EPF.CODCENTROCUSTO, '+
                   'NAT.IDFORCLI '+
                   'FROM '+
                   'TIPORECEBDESEMB TRD, '+
                   'NATURENDIMENTO NAT, '+
                   'EMPRESAFORN EPF '+
                   'WHERE '+
                   'TRD.RECPAG = ''P'' AND '+
                   'TRD.ATIVO = ''S''  AND '+
                   'TRD.IDPESSOA = '+IntToStr(IdPessoa)+' AND '+
                   'TRD.IDPESSOA = NAT.IDPESSOA AND '+
                   'NAT.CODNATUREZA = '+quotedStr(Espaco(sCodNatureza,4))+' AND '+
                   'TRD.CODTIPRECDES = '+quotedStr(spCodtiprecdes)+ ' AND '+
                   'EPF.IDFORCLI = NAT.IDFORCLI AND '+
                   'EPF.IDPESSOA = NAT.IDPESSOA ';

           cdsCodRendGer.Data := GetDataPacket(sSQL);

           if cdsCodRendGer.IsEmpty then
           begin
               iCodForn       := cdsParamIRRF.FieldByName('IDFORCLI').AsInteger;
               iSubContaCli   := cdsParamIRRF.fieldbyname('CODSUBCONTA').asinteger;
               sCCustoCliFor  := cdsParamIRRF.fieldbyname('CODCENTROCUSTO').asstring;
               ssCodTipRecDes := cdsParamIRRF.fieldbyname('CODTIPRECDES').asstring;
               iPlano         := cdsParamIRRF.fieldbyname('PLANO').asinteger;
           end
           else
           begin
               iCodForn       := cdsCodRendGer.FieldByName('IDFORCLI').AsInteger;
               iSubContaCli   := cdsCodRendGer.fieldbyname('CODSUBCONTA').asinteger;
               sCCustoCliFor  := cdsCodRendGer.fieldbyname('CODCENTROCUSTO').asstring;
               ssCodTipRecDes := cdsCodRendGer.fieldbyname('CODTIPRECDES').asstring;
               iPlano         := cdsCodRendGer.fieldbyname('PLANOFORN').asInteger;
            end;
            sContaClifor := spContaContabRecdes;
           //
           sSQL := 'SELECT CODFORMA '+
                   '  FROM NATURENDIMENTO '+
                   ' WHERE (CODNATUREZA = '+quoteDstr(Espaco(sCodNatureza,4))+') '+
                   '   AND (CODFORMA IS NOT NULL) ';
           cdsNatureza.Data := GetDataPacket(sSQL);

           iCodForma := -1;
           if not cdsNatureza.IsEmpty then
              iCodForma := cdsNatureza.FieldByName('CODFORMA').AsInteger;
           //


           if ((sCodNatureza = '7416') or (sCodNatureza = '7431')) And
              (piDocIndividual = 0) then
           begin
             iCodForn := piIdBenefIRRF;


             sSQL := ' SELECT TIPOFAVASSISTIDOS FROM PARAMAPREV ';
             cdsBuscaFornServ.Data := GetDataPacket(sSQL);

             iIdRamoTipoFor := cdsBuscaFornServ.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

             sSQL :=
               'SELECT F.IDPESSOA '+
               'FROM EMPRESAFORN E, FORNSERV F '+
               'WHERE E.IDFORCLI = F.IDPESSOA '+
               '  AND F.IDPESSOA = '+IntToStr(piIdBenefIRRF);
             cdsBuscaFornServ.Data := GetDataPacket(sSQL);

             if cdsBuscaFornServ.IsEmpty then
               CtrlDocumento.ForCli.Inserir(piIdBenefIRRF, Sistema.IdEmpresa,
                                            -1, iPlano, iIdRamoTipoFor, '', '',
                                            '', '', tfcFornecedor);
           end;

           //inserir documento
           cdsDoc.Data := CtrlDarf.ProcurarDocumento(-1);
           cdsDoc.insert;
           cdsDoc.fieldByname('IDMODULO').AsInteger           := IdModulo;
           cdsDoc.fieldByname('PLANO').AsInteger              := iPlano;
           cdsDoc.fieldByname('PLACONTA').Asstring            := sContaClifor;
           cdsDoc.fieldByname('CODCENTROCUSTO').Asstring      := sCCustoCliFor;
           cdsDoc.fieldByname('IDPESSOA').AsInteger           := IdPessoa;
           cdsDoc.fieldByname('IDEMPRESA').AsInteger          := IdPessoa;
           cdsDoc.fieldByname('IDFORCLI').AsInteger           := iCodForn;
           cdsDoc.fieldByname('CODTIPDOC').AsInteger          := cdsParamIrrf.FieldByName('CODTIPDOC').AsInteger;
           cdsDoc.fieldByname('RECPAG').Asstring              := 'P';
           cdsDoc.fieldByname('NODOCUMENTO').AsInteger        := iCodDarf;
           cdsDoc.fieldByname('COMPLDOCUMENTO').AsString      := IntToStr(IdModulo);
           cdsDoc.fieldByname('DATAEMISSAO').Asstring         := DataFim;
           cdsDoc.fieldByname('DATAVENCTO').Asstring          := DataVenc;
           cdsDoc.fieldByname('DATAPROGRAMADA').Asstring      := DataVenc;
           cdsDoc.fieldByname('OBS').ASstring                 := Obs;
           cdsDoc.fieldByname('REFERENCIA').Asstring          := referencia;
           cdsDoc.fieldByname('OPERACAO').Asstring            := '2';
           cdsDoc.fieldByname('IDUSUARIOINCLUSAO').AsInteger  := IdUsuario;
           cdsDoc.fieldByname('UNIDNEGOC').AsString           := sUnidNegoc; 
           cdsDoc.fieldByname('CODSUBCONTA').AsInteger        := iSubContaCli;
           if iCodForma > 0 then
              cdsDoc.fieldByname('CODFORMA').AsInteger           := iCodForma;
           cdsDoc.fieldByname('EMISBLOQ').Asstring            := 'N';
           cdsDoc.Post;
           //
           PlnCodigo := -1;
           //
           //inserir lançamento
           cdsLanc.Data := CtrlDarf.ProcurarLancamentos(-1);
           cdsLanc.insert;
           cdsLanc.FieldByname('PLNCODIGO').AsInteger         := PlnCodigo;
           cdsLanc.FieldByname('DATALANCTO').Asstring         := DataFim;
           cdsLanc.FieldByname('VALOR').AsFloat               := rValorDarf;
           cdsLanc.FieldByname('DEBCRE').Asstring             := 'C';
           cdsLanc.FieldByname('OPERACAO').Asstring           := '2';
           cdsLanc.FieldByname('HISTORICOCOMPL').Asstring     := 'Código: '+sCodNatureza+'  Período: '+DataIni+' a '+DataFim;
           cdsLanc.FieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
           cdsLanc.FieldByname('UNIDNEGOC').AsString          := sUnidNegoc; 
           cdsLanc.Post;
           //
           cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
           //
           if UsaPlanoPatro then
           begin
               IdPatro     := iPatro;
               IdPrograma  := iPrograma;
               IdPlanoPrev := iPlanoPrev;
               if (IdPatro = 1117723) and (IdPlanoPrev <= 0 )then
                   IdPlanoPrev := 110;


               cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
               cdsRateio.First; //esse é o cds dá função que chamou.
               Rvalortmp := cdsRateio.fieldByname('VALOR').AsFloat;
               while not cdsRateio.EOF do
               begin
                   //inserir rateio

                   cdsRat.Insert;
                   cdsRat.fieldByname('CODTIPRECDES').Asstring       := cdsRateio.fieldbyname('CODTIPRECDES').asstring;
                   cdsRat.fieldByname('RECPAG').Asstring             := 'P';
                   cdsRat.fieldByname('IDPESSOA').Asinteger          := IdPessoa;
                   cdsRat.fieldByname('VALOR').AsFloat               := cdsRateio.fieldByname('VALOR').AsFloat;
                   cdsRat.fieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
                   cdsRat.fieldByname('UNIDNEGOC').Asstring          := sUnidNegoc; 
                   cdsRat.fieldByname('CODCENTROCUSTO').Asstring     := cdsRateio.fieldByname('CODCENTROCUSTO').AsString;
                   cdsRat.fieldByname('CODCENTRORESPON').Asstring    := cdsRateio.fieldByname('CODCENTRORESPON').AsString;

                   if IdPatro > 0 then
                     cdsRat.fieldByname('IDPATRO').AsInteger         := cdsRateio.fieldByname('IDPATRO').AsInteger;
                   if IdPrograma > 0 then
                      cdsRat.fieldByname('IDPROGRAMA').AsInteger     := cdsRateio.fieldByname('IDPROGRAMA').AsInteger;
                   //Higor Nayde Ferreira SOL 185443  - KTN 1782596 INICIO
                   if (IdPlanoPrev > 0) and (cdsRateio.fieldByname('IDPLANOPREV').AsInteger > 0)then
                     cdsRat.fieldByname('IDPLANOPREV').AsInteger     := cdsRateio.fieldByname('IDPLANOPREV').AsInteger
                   else if IdPatro = 1117723 then
                     cdsRat.fieldByname('IDPLANOPREV').AsInteger     := 110
                   else
                     cdsRat.fieldByname('IDPLANOPREV').AsInteger     := -1;
                   //Higor Nayde Ferreira SOL 185443  - KTN 1782596 FIM
                   cdsRat.post;
                   cdsRateio.next;
               end;
           end
           else
           begin
               IdPatro    := -1;
               IdPrograma := -1;
               IdPlanoPrev:= -1;

               //inserir rateio
               cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
               cdsRat.Insert;
               cdsRat.fieldByname('CODTIPRECDES').Asstring       := ssCodTipRecDes;
               cdsRat.fieldByname('RECPAG').Asstring             := 'P';
               cdsRat.fieldByname('IDPESSOA').Asinteger          := IdPessoa;
               cdsRat.fieldByname('VALOR').AsFloat               := rValorDarf;
               cdsRat.fieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
               cdsRat.fieldByname('UNIDNEGOC').Asstring          := sUnidNegoc;
               cdsRat.fieldByname('CODCENTROCUSTO').Asstring     := cdsRateio.fieldByname('CODCENTROCUSTO').AsString;
               cdsRat.fieldByname('CODCENTRORESPON').Asstring    := cdsRateio.fieldByname('CODCENTRORESPON').AsString;
               cdsRat.post;
           end;
           //

           // WO10032 - Contas a Pagar - Remessa eletrônica
           // Alterado por Arnaldo Vicente Scarin em 15/07/2024
           // Quando o documento não tem conta de baixa informada,
           // e o CDS de Contas de Baixas estiver vazio deverá ser
           // utilizada a conta de baixa que está vinculada ao
           // Alterador do Imposto.
           if not CtrlDarf.GravarDocumento(cdsDoc.Data,
                                           cdsLanc.Data,
                                           cdsRat.Data,
                                           cdsCCBaixasxDocum.Data,
                                           'I',
                                           IdEspAcesso,
                                           IdUsuario,
                                           pCodDocumento,
                                           sCodNatureza) then
           begin
                Result := False;
                MessageInfo := Ctrldarf.MessageInfo;
                Exit
           end;

           if UsaPlanoPatro then
           begin
               sSQL := 'UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento);
               if IdPatro <= 0 then
                  sSQL := sSQL + ', IDPATRO = NULL'
               else
                  sSQL := sSQL + ', IDPATRO = '+IntToStr(IdPatro);
               if IdPrograma <= 0 then
                  sSQL := sSQL + ', IDPROGRAMA = NULL'
               else
                  sSQL := sSQL + ', IDPROGRAMA = '+IntToStr(IdPrograma);
               if IdPlanoPrev <= 0 then
                  sSQL := sSQL + ', IDPLANOPREV = NULL'
               else
                  sSQL := sSQL + ', IDPLANOPREV = '+IntToStr(IdPlanoPrev);
               sSQL := sSQL + ' WHERE IDDARF = '+IntToStr(iCodDarf);
               if not ExecSQL(sSQL) then
               begin
                    Result := False;
                    Exit;
               end;
           end
           else
           begin
               if not ExecSQL('UPDATE DARF SET CODDOCUMENTO = '+FloatToStr(CtrlDarf.CodDocumento)+' WHERE IDDARF = '+IntToStr(iCodDarf)) then
               begin
                    Result := False;
                    Exit;
               end;
           end;
      end;
end;



function TCtrlGeraDarf.ListCodigos: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT (0) AS IDLANCIRRF, (0) AS IDLANCREF '+
          '  FROM EMPRESAPROP '+
          ' WHERE (1 = 2)';
  Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDarf.ListLancamentoAux(IdPessoa, Imposto, iModulo: Integer;
                                         DataFim, DataIni, CodNatureza: string): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT L.FLGDOCDARFIRJUD '                        +
          ' FROM EMPRESAFORN E,'                              +
          '      PARAMIRRF L '                                +
          ' WHERE (L.IDPESSOA = ' + IntToStr(IdPessoa) + ') ' +
          '   AND (E.IDPESSOA = L.IDPESSOA) '                 +
          '   AND (E.IDFORCLI = L.IDFORCLI) ';

  cdsParamIRRF.Data := GetDataPacket(sSQL);

  if ((CodNatureza <> '7431') and  (CodNatureza <> '7416')) then
  begin // NÃO É DEP. JUDICIAL
    sSQL := 'SELECT '+
            'L.IDLANCIRRF, '+
            'L.DATALANCAMENTO, '+
            'L.IDDARF, '+
            'L.CODDOCUMENTO, '+
            'L.IDPESSOA, '+
            'L.IDBENEFIRRF, ' +
            'L.VLRBASE, '+
            'L.CODNATUREZA, '+
            'L.VLRINSS, '+
            'L.FLGDARF, '+
            'L.NUMDOCUMENTO, '+
            'L.CODTIPRECDES, '+   
            'L.PLACONTA AS PLACONTARECDES, '+
            'L.IDMODULO, '+  
            'MD.NOMEMODULO,' + 
            'L.VLRREFERENCIA, ';

    case Imposto of
      0 :sSQL := sSQL + 'L.VLRIRRF, ';
      1 :sSQL := sSQL + 'DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS) AS VLRIRRF, ';
      2 :sSQL := sSQL + 'L.VLRIOF AS VLRIRRF, ';
    end;

    sSQL := sSQL + ' L.CODCENTROCUSTO, L.CODCENTRORESPON, '+
                   ' L.PERCIRRF, '+
                   ' L.PLANO, '+
                   ' L.PLACONTA, '+
                   ' L.FLGFOLHA, '+
                   ' L.IDPATRO, '+
                   ' L.IDPLANOPREV, '+
                   ' NVL(PP.IDPLANOPREVPREV, L.IDPLANOPREV) AS IDPLANOPREVPREV, ' + 
                   ' L.IDPROGRAMA, '+
                   ' DECODE(L.FLGFOLHA,''S'', DECODE(L.IDMODULO,18, DECODE(SIGN(L.VLRIRRF), -1, P.NOME, H.HISTORICO),''FOLHA PAGTO''), P.NOME) AS RAZAOSOCIAL, '+
                   ' L.IDMOTIVO, L.IDHSTFOLHABENEF, H.HISTORICO, M.DESCRICAO, '+
                   ' PP.NOME, '+
                   ' PT.NOME AS PATRO, '+
                   ' T.DESCRICAO AS TIPODESEMBOLSO, '+
                   ' L.IDMODULO ';

    sSQL := sSQL + 'FROM '+
                   'LANCIRRF L, '+
                   'MOTIVO M, '+
                   'MODULO MD, '+
                   'HSTFOLHABENEF H, '+
                   'PESSOA P '+

                   ' , PLANPREVCONTABIL PP '+
                   ' , PESSOA PT '+
                   ' , TIPORECEBDESEMB T '+

		   ' WHERE ' +
                   ' L.DATALANCAMENTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') '+
                   ' AND TO_DATE('''+DataFim+''',''DD/MM/YYYY'') AND ';

    if (CodNatureza <> '') then
      sSQL := sSQL + ' L.CODNATUREZA = '''+CodNatureza+''' AND ';

    sSQL := sSQL + '   (L.IDPESSOA = '+IntToStr(IdPessoa)+')  AND ';

    if (iModulo > -1) then
      case iModulo of
         0 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 3 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
         1 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 4 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
         2 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 15) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
         3 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) AND (L.FLGFOLHA = ''S'') AND ';
         4 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) AND (L.FLGFOLHA = ''S'') AND ';
      end;

    sSQL := sSQL + ' ((L.FLGDARF = ''N'') OR (L.FLGDARF IS NULL)) '+
                   ' AND (L.IDMOTIVO = M.IDMOTIVO(+)) '+
                   ' AND (MD.IDMODULO = NVL(L.IDMODULORESPON,L.IDMODULO)) '+ 
                   ' AND (L.IDBENEFIRRF = P.IDPESSOA(+)) '+
                   ' AND (L.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF(+)) ';

    sSQL := sSQL + '  AND L.IDPLANOPREV  = PP.IDPLANOPREV(+) '+
                   '  AND L.IDPATRO      = PT.IDPESSOA(+)    '+
                   '  AND L.CODTIPRECDES = T.CODTIPRECDES(+) '+ 
                   '  AND T.RECPAG(+)    = ''P''             ';

    case Imposto of
      0 :sSQL := sSQL + '  AND (ROUND(L.VLRIRRF,2) <> 0) ';
      1 :sSQL := sSQL + '  AND ((ROUND(L.VLRPIS,2) <> 0) OR (ROUND(L.VLRCOFINS,2) <> 0) OR (ROUND(L.VLRCSLL,2) <> 0) OR (ROUND(L.VLRCSCOFPIS,2) <> 0))';
      2 :sSQL := sSQL + '  AND (ROUND(L.VLRIOF,2) <> 0) ';
    end;

    sSQL := sSQL + ' ORDER BY '+
                   'L.PLACONTA, '+ 
                   'L.DATALANCAMENTO, '+
                   'L.CODNATUREZA, '+
                   'L.PLACONTA, '+
                   'L.IDPLANOPREV, '+
                   'L.IDPATRO, '+
                   'L.IDPROGRAMA, '+
                   'L.CODCENTROCUSTO, '+
                   'L.IDMOTIVO, '+
                   'L.IDHSTFOLHABENEF ';
  end
  else
  begin   //É DEP. JUDICIAL
    sSQL := 'SELECT '+
            'L.IDLANCIRRF, '+
            'L.DATALANCAMENTO, '+
            'L.IDDARF, '+
            'L.CODDOCUMENTO, '+
            'L.IDPESSOA, '+
            'L.IDBENEFIRRF, '+
            'L.VLRBASE, '+
            'L.CODNATUREZA, '+
            'L.VLRINSS, '+
            'L.FLGDARF, '+

            'T.DESCRICAO AS TIPODESEMBOLSO, '+
            ' PP.NOME, '+
            ' PT.NOME AS PATRO, '+
            'L.NUMDOCUMENTO, '+
            'L.CODTIPRECDES, '+   
            'L.PLACONTA AS PLACONTARECDES, '+ 
            'L.IDMODULO, '+ 
            'MD.NOMEMODULO, '+ 
            'L.VLRREFERENCIA,';

    case Imposto of
      0 :sSQL := sSQL + ' L.VLRIRRF, ';
      1 :sSQL := sSQL + ' DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS) AS VLRIRRF, ';
      2 :sSQL := sSQL + ' L.VLRIOF AS VLRIRRF, ';
    end;

    sSQL := sSQL + 'L.CODCENTROCUSTO, L.CODCENTRORESPON, '+
                   'L.PERCIRRF, '+
                   'L.PLANO, '+
                   'L.PLACONTA, '+
                   'L.FLGFOLHA, '+
                   'L.IDPATRO, '+
                   'L.IDPLANOPREV, '+
                   'NVL(PP.IDPLANOPREVPREV, L.IDPLANOPREV) AS IDPLANOPREVPREV, ' + 
                   'L.IDPROGRAMA, '+
                   'P.NOME AS RAZAOSOCIAL, '+
                   'L.IDMOTIVO, '+
                   'L.IDHSTFOLHABENEF, '+
                   'H.HISTORICO, '+
                   'M.DESCRICAO , '+
                   'MD.NOMEMODULO , '+
                   'L.IDMODULO ';


    if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
    begin
      sSQL := sSQL + ', NVL(PJ.UFSECAO, ''99'') AS UFSECAO ' ;
    end
    else
      sSQL := sSQL + ', ''  '' As UFSECAO ' ;

    sSQL := sSQL + 'FROM '+
                   'LANCIRRF L, '+
                   'MOTIVO M, '+
                   'MODULO MD, '+
                   'HSTFOLHABENEF H, '+
                   'PESSOA P '+

                   ' , PLANPREVCONTABIL PP '+
                   ' , PESSOA PT '+

                   ',TIPORECEBDESEMB T ';

    if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
    begin
      sSQL := sSQL + ' , PROCJUD PJ ';
    end;

    sSQL := sSQL + 'WHERE ' +
                   'L.DATALANCAMENTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') '+
                   ' AND TO_DATE('''+DataFim+''',''DD/MM/YYYY'') ';
    if (CodNatureza <> '') then
      sSQL := sSQL + ' AND L.CODNATUREZA = '''+CodNatureza+''' AND ';

    sSQL := sSQL + '   (L.IDPESSOA = '+IntToStr(IdPessoa)+')  AND '+

                   '  L.CODTIPRECDES = T.CODTIPRECDES(+) AND '+
                   '  T.RECPAG(+)    = ''P''             AND ';

    if (iModulo > -1) then
      case iModulo of
           0 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 3 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
           1 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 4 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
           2 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 15) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) AND ';
           3 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) AND (L.FLGFOLHA = ''S'') AND ';
           4 : sSQL := sSQL + ' (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) AND (L.FLGFOLHA = ''S'') AND ';
      end;

    sSQL := sSQL + ' ((L.FLGDARF = ''N'') OR (L.FLGDARF IS NULL)) '+
                   ' AND (L.IDBENEFIRRF = P.IDPESSOA) '+
                   ' AND (MD.IDMODULO = NVL(L.IDMODULORESPON,L.IDMODULO)) '+ 
                   ' AND (L.IDMOTIVO = M.IDMOTIVO(+)) '+
                   ' AND (L.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF(+)) ';

    sSQL := sSQL + '  AND L.IDPLANOPREV  = PP.IDPLANOPREV(+) '+
                   '  AND L.IDPATRO      = PT.IDPESSOA(+)    ';

    case Imposto of
      0 :sSQL := sSQL + ' AND (ROUND(L.VLRIRRF,2) <> 0) ';
      1 :sSQL := sSQL + ' AND ((ROUND(L.VLRPIS,2) <> 0) OR (ROUND(L.VLRCOFINS,2) <> 0) OR (ROUND(L.VLRCSLL,2) <> 0) OR (ROUND(L.VLRCSCOFPIS,2) <> 0))';
      2 :sSQL := sSQL + ' AND (ROUND(L.VLRIOF,2) <> 0) ';
    end;

    if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
    begin
      sSQL := sSQL + ' AND ( PJ.IDPROCJUD = L.IDPROCJUD )' ; 
    end;

    sSQL := sSQL + ' ORDER BY '+
                   ' L.PLACONTA, '+ 
                   ' L.DATALANCAMENTO, '+
                   ' L.IDBENEFIRRF, '+
                   ' L.CODNATUREZA, '+
                   ' L.PLACONTA, '+
                   ' L.IDPLANOPREV, '+
                   ' L.IDPATRO, '+
                   ' L.IDPROGRAMA, '+
                   ' L.CODCENTROCUSTO, '+
                   ' L.IDMOTIVO, '+
                   ' L.IDHSTFOLHABENEF ';
  end;

  Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDarf.ListLancamentosAgrupados(IdPessoa, Imposto, iModulo : Integer; DataFim, Dataini, CodNatureza : string): OleVariant;
var
   sSQL : string;
begin
     sSQL := 'SELECT '+
             'L.IDPATRO, '+
             'L.IDPLANOPREV, '+
             'L.IDPESSOA, '+
             'DECODE(L.PLANO,NULL,P.PLANO,L.PLANO) AS PLANO, '+
             'DECODE(L.PLACONTARECDES,NULL,T.PLACONTA,L.PLACONTARECDES) AS PLACONTARECDES, ';
     case Imposto of
          0 :sSQL := sSQL + ' SUM(L.VLRIRRF) AS VLRTOTAL ';
          1 :sSQL := sSQL + ' SUM(DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS)) AS VLRTOTAL ';
          2 :sSQL := sSQL + ' SUM(L.VLRIOF) AS VLRTOTAL ';
     end;

     sSQL := sSQL +  'FROM '+
                     'LANCIRRF L, '+
                     'PARAMCONTAB P, '+
                     'PARAMIRRF PI, '+
                     'TIPORECEBDESEMB T '+
                     'WHERE '+
                     'L.DATALANCAMENTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') '+
                                         ' AND TO_DATE('''+DataFim+''',''DD/MM/YYYY'') '+
                     ' AND L.CODNATUREZA = '''+CodNatureza+''' '+
                     ' AND P.IDPESSOA = L.IDPESSOA '+
                     ' AND PI.IDPESSOA = L.IDPESSOA '+
                     ' AND T.IDPESSOA  = PI.IDPESSOA '+
                     ' AND T.RECPAG = ''P'' '+
                     ' AND T.CODTIPRECDES = L.CODTIPRECDES '+
                     ' AND (L.IDPESSOA = '+IntToStr(IdPessoa)+') ';
     if (iModulo > -1) then
        case iModulo of
                0 : sSQL := sSQL + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 3 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) ';
                1 : sSQL := sSQL + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 4 ) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) ';
                2 : sSQL := sSQL + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 15) AND ((L.FLGFOLHA = ''N'') OR (L.FLGFOLHA IS NULL)) ';
                3 : sSQL := sSQL + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 18) AND (L.FLGFOLHA = ''S'') ';
                4 : sSQL := sSQL + ' AND (NVL(L.IDMODULORESPON,L.IDMODULO) = 21) AND (L.FLGFOLHA = ''S'') ';
        end;

     sSQL := sSQL + ' AND ((L.FLGDARF = ''N'') OR (L.FLGDARF IS NULL)) ';

     case Imposto of
          0 :sSQL := sSQL + ' AND (ROUND(L.VLRIRRF,2) <> 0) ';
          1 :sSQL := sSQL + ' AND ((ROUND(L.VLRPIS,2) <> 0) OR (ROUND(L.VLRCOFINS,2) <> 0) OR (ROUND(L.VLRCSLL,2) <> 0) OR (ROUND(L.VLRCSCOFPIS,2) <> 0))';
          2 :sSQL := sSQL + ' AND (ROUND(L.VLRIOF,2) <> 0) ';
     end;

     sSQL := sSQL + 'GROUP BY '+
	            ' L.IDPATRO, '+
                    ' L.IDPLANOPREV, '+
                    ' L.IDPESSOA, '+
                    ' DECODE(L.PLANO,NULL,P.PLANO,L.PLANO), '+
                    ' DECODE(L.PLACONTARECDES,NULL,T.PLACONTA,L.PLACONTARECDES)'+
                    'ORDER BY '+
                    ' L.IDPATRO, '+
                    ' L.IDPLANOPREV, '+
                    ' L.IDPESSOA ';

     Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDarf.ListLancamentos(IdPessoa, Imposto, iModulo : Integer; DataFim, Dataini, CodNatureza : string): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT L.FLGDOCDARFIRJUD '                        +
          ' FROM EMPRESAFORN E,'                              +
          '      PARAMIRRF L '                                +
          ' WHERE (L.IDPESSOA = ' + IntToStr(IdPessoa) + ') ' +
          '   AND (E.IDPESSOA = L.IDPESSOA) '                 +
          '   AND (E.IDFORCLI = L.IDFORCLI) ';

  cdsParamIRRF.Data := GetDataPacket(sSQL);


  sSQL := 'SELECT '+
          ' L.IDLANCIRRF, '+
          ' L.DATALANCAMENTO, '+
          ' L.IDDARF, '+
          ' L.CODDOCUMENTO, '+
          ' L.IDPESSOA, '+
          ' L.IDBENEFIRRF, '+
          ' L.VLRBASE, '+
          ' L.CODNATUREZA, '+
          ' L.VLRINSS, '+
          ' L.FLGDARF, '+
          ' L.NUMDOCUMENTO, '+
          ' L.CODTIPRECDES, '+     
          ' L.PLACONTA AS PLACONTARECDES, '+ 
          ' L.IDMODULO, '+         
          ' MD.NOMEMODULO, '+       
          ' L.VLRREFERENCIA,  ';

  case Imposto of
    0 :sSQL := sSQL + ' L.VLRIRRF, ';
    1 :sSQL := sSQL + ' DECODE(L.VLRPIS,0,DECODE(L.VLRCSLL,0,DECODE(L.VLRCOFINS,0,L.VLRCSCOFPIS,L.VLRCOFINS),L.VLRCSLL),L.VLRPIS) AS VLRIRRF, ';
    2 :sSQL := sSQL + ' L.VLRIOF AS VLRIRRF, ';
  end;

  sSQL := sSQL + ' L.PERCIRRF, '+
                 ' L.PLANO, '+
                 ' L.PLACONTA, '+
                 ' L.FLGFOLHA, '+
                 ' L.IDPATRO, '+
                 ' L.IDPLANOPREV, '+
                 ' NVL(PP.IDPLANOPREVPREV, L.IDPLANOPREV) AS IDPLANOPREVPREV, ' + 
                 ' L.IDPROGRAMA, '+
                 ' P.RAZAOSOCIAL, '+
                 ' L.IDMOTIVO, '+
                 ' L.IDHSTFOLHABENEF, '+
                 ' L.CODCENTROCUSTO, '+
                 ' L.CODCENTRORESPON, '+
                 ' H.HISTORICO, '+

                 ' PP.NOME, '+
                 ' PT.NOME AS PATRO, '+
                 ' T.DESCRICAO AS TIPODESEMBOLSO, '+
                 ' M.DESCRICAO ';

  if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
  begin
    sSQL := sSQL + ', PJ.UFSECAO  ';
  end
  else
    sSQL := sSQL + ', ''  '' As UFSECAO ' ;

  sSQL := sSQL + ' FROM '+
                 ' LANCIRRF L, '+
                 ' PESSOA P, '+
                 ' MOTIVO M, '+
                 ' MODULO MD, '+
                 ' HSTFOLHABENEF H '+

                 ' , PLANPREVCONTABIL PP '+
                 ' , PESSOA PT '+
                 ' , TIPORECEBDESEMB T ';

  if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
  begin
    sSQL := sSQL + ' , PROCJUD PJ ';
  end;

  sSQL := sSQL + ' WHERE '+
                 ' (L.FLGDARF = ''N'' OR L.FLGDARF IS NULL) '+
                 ' AND (L.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                 ' AND (L.IDMOTIVO = M.IDMOTIVO(+)) '+
                 ' AND (MD.IDMODULO = L.IDMODULO) '+
                 ' AND (L.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF(+)) '+
                 ' AND L.DATALANCAMENTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') '+
                 ' AND TO_DATE('''+DataFim+''',''DD/MM/YYYY'') ';

  sSQL := sSQL + '  AND L.IDPLANOPREV  = PP.IDPLANOPREV(+) '+
                 '  AND L.IDPATRO      = PT.IDPESSOA(+) '+
                 '  AND L.CODTIPRECDES = T.CODTIPRECDES(+) '+
                 '  AND T.RECPAG       = ''P'' ';


  if (CodNatureza <> '') then
     sSQL := sSQL + ' AND L.CODNATUREZA = '''+CodNatureza+''' ';

     sSQL := sSQL + ' AND (L.IDBENEFIRRF = P.IDPESSOA) ';

  case Imposto of
    0 :sSQL := sSQL + '  AND (ROUND(L.VLRIRRF,2) <> 0) ';
    1 :sSQL := sSQL + '  AND ((ROUND(L.VLRPIS,2) <> 0) OR (ROUND(L.VLRCOFINS,2) <> 0) OR (ROUND(L.VLRCSLL,2) <> 0) OR (ROUND(L.VLRCSCOFPIS,2) <> 0))';
    2 :sSQL := sSQL + '  AND (ROUND(L.VLRIOF,2) <> 0) ';
  end;

  if cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 then
  begin
    sSQL := sSQL + '  AND ( PJ.IDPROCJUD = L.IDPROCJUD ) ';
  end;
  
  if (CodNatureza = '7431') or (CodNatureza = '7416') then
    sSQL := sSQL + ' ORDER BY '+
                   ' P.RAZAOSOCIAL, '+
                   ' L.IDBENEFIRRF, '+
                   ' L.PLACONTA, '+  
                   ' L.CODNATUREZA, '+
                   ' L.DATALANCAMENTO, '+
                   ' L.IDMODULO, '+
                   ' L.IDMOTIVO, '+
                   ' L.IDHSTFOLHABENEF '
  else
    sSQL := sSQL + ' ORDER BY '+
                   ' L.PLACONTA, '+  
                   ' L.CODNATUREZA, '+
                   ' L.DATALANCAMENTO, '+
                   ' L.IDMODULO, '+
                   ' P.RAZAOSOCIAL, '+
                   ' L.IDMOTIVO, '+
                   ' L.IDHSTFOLHABENEF ';


  Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDarf.NaturezaResidExterior(CodNaturesa: string): Boolean;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                             + #13 +
  '  COUNT(*) AS TOTAL '                + #13 +
  'FROM '                               + #13 +
  '  NATURENDIMENTO '                   + #13 +
  'WHERE '                              + #13 +
  '      LTRIM(RTRIM(CODNATUREZA))  = ' + QuotedStr(Trim(CodNaturesa))  + #13 +  
  '  AND FLGRESIDEXTERIOR           = ''S'' ';

  _Cds.Data := GetDataPacket(sSQL);

  Result := _cds.FieldByName('TOTAL').AsInteger > 0;
end;



function TCtrlGeraDarf.ListCCBaixasxDocum(piCodDocumento: Integer): OleVariant;
begin
  Result := GetDataPacket('SELECT * FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = ' + IntToStr(piCodDocumento));
end;



function TCtrlGeraDarf.BuscaRegPendenteDarf(const pdDtIniIRRF : TDateTime;
                                            const pdDtFimIRRF : TDateTime;
                                            const pdDtIniCSLL : TDateTime;
                                            const pdDtFimCSLL : TDateTime;
                                            const pdDtIniIOF  : TDateTime;
                                            const pdDtFimIOF  : TDateTime): OleVariant;
Var
  sSql : String;

begin
  sSql := ' SELECT                                                                           '+
          '   IR.VALOR AS VALOR_IRRF,                                                        '+
          '   IR.QTD AS QTD_IRRF,                                                            '+
          '   IOF.VALOR AS VALOR_IOF,                                                        '+
          '   IOF.QTD AS QTD_IOF,                                                            '+
          '   CSLL.VALOR AS VALOR_CSLL,                                                      '+
          '   CSLL.QTD AS QTD_CSLL                                                           '+
          ' FROM                                                                             '+
          '  (SELECT                                                                         '+
          '     COUNT(*) AS QTD,                                                             '+
          '     SUM(VLRIRRF) AS VALOR                                                        '+
          '   FROM LANCIRRF                                                                  '+
          '   WHERE DATALANCAMENTO BETWEEN TO_DATE('''+DateToStr(pdDtIniIRRF)+''', ''DD/MM/YYYY'') AND  '+
                                         ' TO_DATE('''+DateToStr(pdDtFimIRRF)+''', ''DD/MM/YYYY'')      '+
          '     AND VLRIRRF <> 0                                                             '+
          '     AND IDDARF IS NULL                                                           '+
          '     AND FLGDARF = ''N'') IR,                                                     '+

          '  (SELECT                                                                         '+
          '     COUNT(*) AS QTD,                                                             '+
          '     SUM(DECODE(VLRPIS,0,DECODE(VLRCSLL,0,DECODE(VLRCOFINS,0,VLRCSCOFPIS,VLRCOFINS),VLRCSLL),VLRPIS)) AS VALOR '+
          '   FROM LANCIRRF                                                                  '+
          '   WHERE DATALANCAMENTO BETWEEN TO_DATE('''+DateToStr(pdDtIniCSLL)+''', ''DD/MM/YYYY'') AND  '+
                                         ' TO_DATE('''+DateToStr(pdDtFimCSLL)+''', ''DD/MM/YYYY'')      '+
          '     AND ((ROUND(VLRPIS,2)      <> 0) OR                                          '+
          '          (ROUND(VLRCOFINS,2)   <> 0) OR                                          '+
          '          (ROUND(VLRCSLL,2)     <> 0) OR                                          '+
          '          (ROUND(VLRCSCOFPIS,2) <> 0))                                            '+
          '     AND IDDARF IS NULL                                                           '+
          '     AND FLGDARF = ''N'') CSLL,                                                   '+

          '  (SELECT                                                                         '+
          '     COUNT(*) AS QTD,                                                             '+
          '     SUM(VLRIOF) AS VALOR                                                         '+
          '   FROM LANCIRRF                                                                  '+
          '   WHERE DATALANCAMENTO BETWEEN TO_DATE('''+DateToStr(pdDtIniIOF)+''', ''DD/MM/YYYY'') AND   '+
                                         ' TO_DATE('''+DateToStr(pdDtFimIOF)+''', ''DD/MM/YYYY'')       '+
          '     AND VLRIOF      <> 0                                                         '+
          '     AND IDDARF IS NULL                                                           '+
          '     AND FLGDARF = ''N'') IOF                                                     ';


   Result := GetDataPacket(sSql);
end;



end.
