{
Nº SOL......: 202782
Nº KINTANA..: 1959852
Data........: 14/03/2013
Responsável.: Xavier
Descrição...: retirado o DESC do order by incluido no SOL 200778
--------------------------------------------------------------------------------
Nº SOL......: 200778
Nº KINTANA..: 1953121
Data........: 04/03/2013
Responsável.: Otacilio
Descrição...: Valor do campo Sub-Despesa estava duplicado.
--------------------------------------------------------------------------------
Rotina............: GetContasTabelaAranha
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
}

//Autor: andré tavares - 19/01/2007 - Esta Ctrl centraliza to negócio de buscas de placontas para lançamento de documentos
unit uCtrlPlacontasCapCar;

interface
uses
   classes, sysUtils, dbclient, uCmDbObject, uCmControlObject, uCtrlDocumento,
   DImpostoObj, uCtrlLancamento, uDiasUteis, uCMSqlParams, uCMClientDataset, ucmFileUtils, uCtrlSegregacao;

Type

  TOperacaoLancDocCapCar = (opldEfetivo, opldAdiantamento, opldContratoPrevisao, opRegAdiantamento, opldAgrupaParcela);

  TPlacontas = Record
                 iPlano: integer;
                 sPlaconta, sPlacontaPass : string;
                 iSubConta, iSubContaPass : integer;
                 iIdSegregaCriter: integer;
                 scodCentroCusto: string;
               end;


  TCtrlPlacontasCapCar = Class(TCmControlObject)
  private

    function GetParamPlaconta(const idempresa: integer; const recpag: string): Olevariant;

    // Ricardo A. SOL 122623 KTN 603580
    procedure GetContasTabelaAranha(var placontas: TPlacontas; const recpag: string; const codtiporecdes: string = ''; const codcentrocusto: string = '';
                                    const idempresa: integer = 0; const idPlano: integer = 0; const idprograma: integer = 0);

    procedure getContaTiporecdes(var placontas: TPlacontas;
                                 const idempresa: integer;
                                 const codtiporecdes, recpag: string);

    function GetContasForCli(var placontas: TPlacontas;
                              const idforcli, idempresa: integer;
                              const RecPag: string; const bAdiantamento: boolean): boolean;

    function getContasPortForma(var placontas: TPlacontas;
                                 const codportforma: integer): boolean;


  protected
  //
  public

    Constructor Create; Override;
    Destructor Destroy; Override;

    // Ricardo A. SOL 122623 KTN 603580
    function GetPlacontas(const codPortForma, idforcli, idempresa, idprog, idPlanoPrev: integer;
                          const codcentrocusto, codtiporecdes: string; const recpag: string;
                          const operLancto: TOperacaoLancDocCapCar;
                          const blanceBaixa: Boolean;
                          var   PlaContas: TPlacontas;
                          const bIntegraContab: boolean;
                          const plano: integer
                          ): boolean;

    function DeterminaSegregacao(var CdsRateio: TClientDataSet; const idempresa: integer): boolean;
    function LancaMultiplasContasBaixa (const cdsRateio: TClientDataSet;
                                        var CdsCCBaixasXDocum: TClientDataSet;
                                        var iPlanoDoc: integer;
                                        var sPlacontaDoc : string;
                                        var sCentroCustoDoc : string;
                                        var iIdSegregaCriter: integer): boolean;

end;

implementation




//busca as placontas para contabilização
function TCtrlPlacontasCapCar.GetPlacontas(const codPortForma, idforcli, idempresa, idprog, idPlanoPrev: integer;
                                         const codcentrocusto, codtiporecdes: string; const recpag: string;
                                         const operLancto: TOperacaoLancDocCapCar;
                                         const blanceBaixa: boolean;
                                         var   PlaContas: TPlacontas;
                                         const bIntegraContab: boolean;
                                         const plano: integer): boolean;

var cdsParamPlaconta : TClientDataset;
    ssql : string;

    function ObrigaSubconta(sPlaconta: string): boolean;
    begin
      Result := False;
      if ( bIntegraContab ) AND ( sPlaconta <> '' )  then
      begin
        with TClientDataset.Create(nil) do
        begin
          try
            data := getDataPacket('SELECT PLASUBCONTA FROM PLANOCONTA WHERE RTRIM(PLACONTA) = RTRIM('+ sPlaconta +') AND PLANO = '+ intTostr(Plano));
            if not IsEmpty then
              Result := (FieldByName('PLASUBCONTA').AsString = 'S');
          finally
            free;
          end;//try
        end;//with
      end; //if
    end;//function

begin
  result := true;

  PlaContas.sPlaconta       := '';
  PlaContas.iSubConta       := 0;
  PlaContas.sPlacontaPass   := '';
  PlaContas.iSubContaPass   := 0;
  PlaContas.iPlano          := Plano;

  cdsParamPlaconta := TClientDataset.Create(nil);
  sSql := '';
  try
    try

      // Adiantamento
      // CAP - D - conta adiantamento Fornecedor
      // CAR - C - conta adiantamento Cliente
      if ( operLancto = opldAdiantamento ) then
        if not GetContasForCli(PlaContas, idforcli, idempresa, recpag, true) then
          raise exception.create(messageinfo);

      // Lança e baixa simultânea
      // CAP - C - conta do Portador Forma
      // CAR - D - conta do Portador Forma
      if blanceBaixa then
        if not GetContasPortForma(PlaContas, codPortForma) then
          raise exception.create(messageinfo);

      cdsParamPlaconta.Data := GetParamPlaconta(idempresa, recpag);

      //buscas na tabela aranha
      if trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPRPA').asString) = 'S' then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, idPlanoPrev, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPR').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, 0, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECC').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, 0, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPR').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, 0, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, idPlanoPrev, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPRPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, idPlanoPrev, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, idPlanoPrev, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDE').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, 0, 0);

      //se não achou na tabela aranha entao busca na tabela tiporecebdesemb OU se achou a conta e a mesma obriga subconta
      if (trim(PlaContas.sPlaconta) = '') or
         (trim(PlaContas.sPlacontaPass) = '') or
         (ObrigaSubconta(PlaContas.sPlaconta)) or
         (ObrigaSubconta(PlaContas.sPlacontaPass)) then

        getContaTiporecdes(PlaContas, idempresa, codtiporecdes, recpag);

      //se não achou na tabela aranha entao busca na tabela tiporecebdesemb OU se achou a conta e a mesma obriga subconta
      // busca a conta no fornecedor ou cliente
      if ( (trim(PlaContas.sPlaconta) = '') or (trim(PlaContas.sPlacontaPass) = '') ) or
         (
           ((Placontas.iSubConta = 0) or (Placontas.iSubContaPass = 0)) and
           (ObrigaSubconta(PlaContas.sPlaconta) or ObrigaSubconta(PlaContas.sPlacontaPass)
          )) then
        GetContasForCli(PlaContas, idforcli, idempresa, recpag, false);

    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false
      end;
    end;

  finally
    cdsParamPlaconta.Free;
  end;
end;


function TCtrlPlacontasCapCar.GetParamPlaconta(const idempresa: integer; const recpag: string): Olevariant;
begin
  try
    result := getdataPacket(' SELECT NVL(FLGPCPDECCPRPA, ''N'') AS FLGPCPDECCPRPA, NVL(FLGPCPDECCPR, ''N'') AS FLGPCPDECCPR, '+
                            '        NVL(FLGPCPDECC, ''N'')     AS FLGPCPDECC,     NVL(FLGPCPDEPR, ''N'')   AS FLGPCPDEPR,   '+
                            '        NVL(FLGPCPDECCPA, ''N'')   AS FLGPCPDECCPA,   NVL(FLGPCPDEPRPA, ''N'') AS FLGPCPDEPRPA, '+
                            '        NVL(FLGPCPDEPA, ''N'')     AS FLGPCPDEPA,     NVL(FLGPCPDE, ''N'')     AS FLGPCPDE      '+
                            ' FROM PARAMCAP WHERE IDPESSOA = '+ intTostr(idempresa) +' AND RECPAG = '+ quotedStr(recpag) );
  except
    on e: Exception do
      self.messageInfo := e.Message;
  end;
end;



procedure TCtrlPlacontasCapCar.GetContasTabelaAranha(var placontas: TPlacontas; const recpag: string; const codtiporecdes, codcentrocusto: string; const idempresa, idPlano, idprograma: integer);
var ssql: string;
    cds: TClientDataset;
begin

  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PLACONTA, PLACONTAPASS FROM TIPORDXCCXCONTA ' +
              ' WHERE IDPESSOA            = '+ intToStr(idempresa)   +
              ' AND RECPAG                = '+ quotedStr(recpag)     +
              ' AND IDEMPRESA             = '+ intToStr(idempresa);

              if trim(codtiporecdes) <> '' then
                ssql := ssql + ' AND RTRIM(CODTIPRECDES)   = '+ quotedStr(codtiporecdes)
              else
                ssql := ssql + ' AND CODTIPRECDES IS NULL ';

              if trim(codcentrocusto) <> '' then
                ssql := ssql + ' AND RTRIM(CODCENTROCUSTO) = '+ quotedStr(codcentrocusto)
              else
                ssql := ssql + ' AND CODCENTROCUSTO IS NULL ';

              if idPlano > 0 then
                ssql := ssql + ' AND IDPLANOPREV               = '+ intToStr(idPlano)
              else
                ssql := ssql + ' AND IDPLANOPREV IS NULL ';

              if idprograma > 0 then
                ssql := ssql + ' AND IDPROGRAMA            = '+ intToStr(idprograma)
              else
                ssql := ssql + ' AND IDPROGRAMA IS NULL ';

              // SOL 200778 KTN 1953121 Otacilio
              //ssql := ssql + ' ORDER BY SUBSTR(PLACONTA, 4, 1) DESC ';

              // SOL 202782 KTN 1959852 Xavier
              ssql := ssql + ' ORDER BY SUBSTR(PLACONTA, 4, 1) ';

      cds.Data := getDataPacket(ssql);

      if not cds.IsEmpty then
      begin
        if trim(placontas.sPlaconta) = '' then
          placontas.sPlaconta     := cds.fieldByName('PLACONTA').asString;

        if trim(placontas.sPlacontaPass) = '' then
          placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;
      end;

    except
      on e: Exception do
        self.messageInfo := e.Message;
    end;

  finally
    cds.Free;
  end;
end;



procedure TCtrlPlacontasCapCar.getContaTiporecdes(var placontas: TPlacontas; const idempresa: integer; const codtiporecdes, recpag: string);
var ssql: string;
    cds : TClientDataset;
begin
  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PLACONTA, PLACONTACREDITO AS PLACONTAPASS, CODSUBCONTA, CODSUBCONTACRE AS CODSUBCONTAPASS '+
              ' FROM TIPORECEBDESEMB '+
              ' WHERE IDPESSOA            = '+ intToStr(idempresa)      +
              ' AND RECPAG                = '+ quotedStr(recpag)        +
              ' AND RTRIM(CODTIPRECDES)   = '+ quotedStr(codtiporecdes);

      cds.Data := getDataPacket(ssql);

      if not cds.IsEmpty then
      begin
        if trim(placontas.sPlaconta) = '' then
          placontas.sPlaconta     := cds.fieldByName('PLACONTA').asString;

        if trim(placontas.sPlacontaPass) = '' then
          placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;

        if placontas.iSubConta = 0 then
          placontas.iSubConta := cds.fieldByName('CODSUBCONTA').asInteger;

        if placontas.iSubContaPass = 0 then
          placontas.iSubContaPass := cds.fieldByName('CODSUBCONTAPASS').asInteger;

      end;

    except
      on e: Exception do
        self.messageInfo := e.Message;
    end;

  finally
    cds.Free;
  end;
end;



function TCtrlPlacontasCapCar.GetContasForCli(var placontas: TPlacontas;
                                             const idforcli, idempresa: integer;
                                             const RecPag: string; const bAdiantamento: boolean): boolean;
var ssql: string;
    cds: TclientDataset;
begin
  result := true;
  cds := TclientDataset.Create(nil);
  try
    try
      if RecPag = 'R' then
        cds.Data := getDataPacket(' SELECT C.CONTACADIANTAMENTO AS CADIANTAMENTO, C.CONTACCLIENTE AS PLACONTAPASS, C.CODSUBCONTA AS SUBCONTA, C.CONTACRECEITA AS PLACONTA '+
                                ' FROM EMPRESACLIENTE C WHERE (C.IDFORCLI = '+ intToStr(idforcli) + ') AND (C.IDPESSOA = '+ intToStr(idempresa) +')' )
      else
        cds.Data := getDataPacket(' SELECT F.CONTACADIANTAMENTO AS CADIANTAMENTO, F.CONTACFORN AS PLACONTAPASS, F.CODSUBCONTA AS SUBCONTA, F.CONTACDESPESA AS PLACONTA '+
                                  ' FROM EMPRESAFORN F WHERE (F.IDFORCLI = '+ intToStr(idforcli) +') AND (F.IDPESSOA = '+ intToStr(idempresa) +')' );


      if bAdiantamento then
      begin
        placontas.sPlacontaPass := cds.fieldByName('CADIANTAMENTO').asString;

        if placontas.sPlacontaPass = '' then
          raise exception.create ('A conta de adiantamento do Fornecedor/Cliente não foi preenchida');
      end;

      if trim(placontas.sPlacontaPass) = '' then
        placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;

      if trim(placontas.sPlaconta) = '' then
        placontas.sPlaconta := cds.fieldByName('PLACONTA').asString;

      if placontas.iSubContaPass = 0 then
        placontas.iSubContaPass := cds.fieldByName('SUBCONTA').asInteger;

    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false;
      end;
    end;
  finally
    cds.Free;
  end;
end;


function TCtrlPlacontasCapCar.getContasPortForma(var placontas: TPlacontas; const codportforma: integer): boolean;
var ssql: string;
    cds: TclientDataset;
begin
  Result := true;
  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PF.CODPORTFORMA, '+
              '        NVL(PF.PLACONTA, PC.PLACONTA) AS PLACONTAPASS, '+
              '        NVL(PF.CODSUBCONTA, PC.CODSUBCONTA) AS CODSUBCONTAPASS '+
              ' FROM PORTADORFORMA PF, PORTADORCONTA PC '+
              ' WHERE PF.CODPORTFORMA = '+ intToStr(codportforma) +' AND '+
              '       PF.CODPORTADOR = PC.CODPORTADOR ';

      cds.Data := getDataPacket(ssql);

      if cds.fieldByName('PLACONTAPASS').asString <> '' then begin
        placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;
        placontas.iSubContaPass := cds.fieldByName('CODSUBCONTAPASS').asInteger;
      end else
        raise exception.create ('Não foi encontrada a conta contábil nem no Portador/Forma nem no Portador/Conta!')

    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false
      end;
    end;

  finally
    cds.Free;
  end;
end;


function TCtrlPlacontasCapCar.DeterminaSegregacao(var CdsRateio: TClientDataSet; const idempresa: integer): boolean;
var
  iIdSegregaCriter: integer;
  sContaSegregar: string;
  _Segregacao: TCtrlSegregacao;
  pplacontas: TPlacontas;
begin
  result := true;
  _Segregacao := TCtrlSegregacao.Create;
  _Segregacao.Initializeas(self);
  _Segregacao.GetParams(IdEmpresa);

  try
    try
      CdsRateio.First;
      while not CdsRateio.Eof do
      begin
        iIdSegregaCriter := _Segregacao.RetornaSegregaCriter (CdsRateio.FieldByName('PLANO').AsInteger,
                                 CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                                 CdsRateio.FieldByName('IDPATRO').AsInteger,
                                 CdsRateio.FieldByName('PLACONTA').AsString,
                                 sContaSegregar);

        if iIdSegregaCriter = -1 then
          iIdSegregaCriter := _Segregacao.RetornaSegregaCriter (CdsRateio.FieldByName('PLANO').AsInteger,
                                 CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                                 CdsRateio.FieldByName('IDPATRO').AsInteger,
                                 CdsRateio.FieldByName('PLACONTAPASS').AsString,
                                 sContaSegregar);

        CdsRateio.Edit;
        CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
        CdsRateio.Post;
        CdsRateio.Next;
      end;
    except
      on e:Exception do
      begin
        messageinfo := e.message;
        result := false;
      end;
    end;
  finally
    _Segregacao.free;
  end;
end;



// se no somatório das contas contábeis, tiver mais de um conjunto
// PLACONTA / IDSEGREGACRITER abrir múltiplas contas de baixa
function TCtrlPlacontasCapCar.LancaMultiplasContasBaixa (
                              const cdsRateio: TClientDataSet;
                              var CdsCCBaixasXDocum: TClientDataSet;
                              var iPlanoDoc: integer;
                              var sPlacontaDoc : string;
                              var sCentroCustoDoc : string;
                              var iIdSegregaCriter: integer): boolean;

var
  iSegregaCriter, iSegrega, iConta: integer;
  sPlaconta: string;
  bAchou: boolean;
begin;

  result := true;
  try
    sPlaconta := '';
    iSegregaCriter := -1;
    iSegrega := 0;
    iConta := 0;
    CdsRateio.First;
    // este somatório pode dar errado devido a falta de ordenação da query,
    // a conta pode se repetir, mas se possuir mais de uma conta diferente de baixa
    // é obrigatório a utilização de múltiplas conta de baixa
    while not CdsRateio.Eof do begin
      if (sPlaconta <> CdsRateio.FieldByName('PLACONTAPASS').AsString) then
      begin
        sPlaconta := CdsRateio.FieldByName('PLACONTAPASS').AsString;
        inc(iConta);
      end;
      if (iSegregaCriter <> CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger) then
      begin
        iSegregaCriter := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
        inc(iSegrega);
      end;
      CdsRateio.Next;
    end;


    // necessário múltiplas contas de baixa
    CdsCCBaixasXDocum.Data := getDataPacket(' SELECT PT.NOME AS PATROCINADORA, PL.NOME AS PLANPREVCONTABIL, S.DESCRICAO AS SEGREGACRITER, '+
                                            '        CC.PLACONTA, CC.VALOR, CC.IDPATRO, CC.IDPLANOPREV, CC.IDSEGREGACRITER, CC.PLANO, CC.UNIDNEGOC, CC.IDPESSOA '+
                                            ' FROM CCBAIXASXDOCUM CC, PESSOA PT, PATRO PA, PLANPREVCONTABIL PL, SEGREGACRITER S '+
                                            ' WHERE CC.CODDOCUMENTO = -1 AND ( CC.IDPATRO = PA.IDPESSOA )  AND ( PA.IDPESSOA = PT.IDPESSOA ) '+
                                            '       AND ( CC.IDPLANOPREV = PL.IDPLANOPREV ) '+
                                            '       AND ( CC.IDSEGREGACRITER = S.IDSEGREGACRITER(+) ) ');



    CdsCCBaixasXDocum.EmptyDataSet;  // apaga o clientdataset para gravar tudo de novo, ou não
    if (iConta > 1) or (iSegrega > 1) then begin
      CdsRateio.First;
      while not CdsRateio.Eof do begin
        CdsCCBaixasXDocum.First;
        bAchou := False;
        while (not CdsCCBaixasXDocum.Eof) and (not bAchou) do begin
          // verificar a chave da tabela ccbaixasxdocum para somar o valor
          if (CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger         = CdsRateio.FieldByName('IDPATRO').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger     = CdsRateio.FieldByName('IDPLANOPREV').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger = CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString         = CdsRateio.FieldByName('PLACONTAPASS').AsString) and
             (CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger       = CdsRateio.FieldByName('UNIDNEGOC').AsInteger) then begin

            CdsCCBaixasXDocum.Edit;
            //andre tavares - 300/08/2006 - estava dando erro na valia com um rateio específico
            CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat := CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat + CdsRateio.FieldByName('VALOR').AsFloat;
            CdsCCBaixasXDocum.Post;

            bAchou := true;
          end;
          CdsCCBaixasXDocum.Next;
        end;

        if (not bAchou) then begin
          // não foi encontrada a conta de baixa acima
          CdsCCBaixasXDocum.Insert;
          CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger         := CdsRateio.FieldByName('IDPATRO').AsInteger;
          CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger     := CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
          CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
          CdsCCBaixasXDocum.FieldByName('PLANO').AsInteger           := CdsRateio.FieldByName('PLANO').AsInteger;
          CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString         := CdsRateio.FieldByName('PLACONTAPASS').AsString;
          CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger       := CdsRateio.FieldByName('UNIDNEGOC').AsInteger;

          CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat      := CdsRateio.FieldByName('VALOR').AsFloat;
          CdsCCBaixasXDocum.FieldByName('IDPESSOA').AsInteger := cdsRateio.fieldByName('IDPESSOA').asInteger;
          CdsCCBaixasXDocum.Post;
        end;

        CdsRateio.Next;
      end;
    end else begin  // não é múltiplas contas de baixa
       iPlanoDoc        := CdsRateio.FieldByName('PLANO').AsInteger;
       sPlacontaDoc     := CdsRateio.FieldByName('PLACONTAPASS').AsString;;
       sCentroCustoDoc  := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
       iIdSegregaCriter := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
    end;

  except
    on e:exception do
    begin
      messageInfo := e.message;
      result := false;
    end;
  end;
end;







constructor TCtrlPlacontasCapCar.Create;
begin
  inherited;

end;

destructor TCtrlPlacontasCapCar.Destroy;
begin


  inherited;
end;

end.
