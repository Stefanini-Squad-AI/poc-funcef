unit UGeraCapCar;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, Wwtable,
  Wwquery, uDocumento, uIntegraBack;


function ValidaDadosDoc(var CodCentroRespon, sMens:string; StiPrecDes:string;
                        var UnidNegoc:integer): boolean;

function AlimentaQryDocumentos(
  QryDocumentos: TwwQuery;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sRecPag, sDebCre: string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto: string): boolean;

function DescarregaQryDocumentos(
  qryDocumentos: TwwQuery;
  iFavorecido, iTipoCli, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: boolean): LongInt;


implementation

uses uSistema, uFuncoesUteisRH, fPrincipal, uDataBase;


function AlimentaQryDocumentos (
  QryDocumentos: TwwQuery;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sRecPag, sDebCre : string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto  : string): boolean;
begin
  Result := true;

  if not(ValidaDadosDoc(CodCentroRespon, sMens, CodTipRecDes, UnidNegoc)) then
  begin
    Result := false;
    exit;
  end;

  qryDocumentos.First;
  while not(qryDocumentos.EOF) do
  begin
    if (qryDocumentos.FieldByName('CODDOCUMENTO').asInteger = CodDocumento) and
       (qryDocumentos.FieldByName('NUMLANCTO').asInteger = NumLancto) and
       (qryDocumentos.FieldByName('UNIDNEGOC').asInteger = UnidNegoc) and
       (qryDocumentos.FieldByName('CODCENTRORESPON').asString = CodCentroRespon) and
       (qryDocumentos.FieldByName('CODTIPRECDES').asString = codtiprecdes) and
       (qryDocumentos.FieldByName('PLACONTA').asString = placonta) and
       (qryDocumentos.FieldByName('CODPORTFORMA').asInteger = iUltPortForma) and
       (qryDocumentos.FieldByName('PORTFORMAPARTICIP').asInteger = iPortFormaParticip) and
       (qryDocumentos.FieldByName('CodCentroCusto').asString = sCodCentroCusto) then
    begin
      qryDocumentos.Edit;
      qryDocumentos.FieldByName('VALOR').asFloat :=
        qryDocumentos.FieldByName('VALOR').asFloat + Valor;
      qryDocumentos.Post;
      exit;
    end;
    qryDocumentos.Next
  end;

  QryDocumentos.Insert;
  qryDocumentos.FieldByName('CODDOCUMENTO').asInteger      := Coddocumento;
  qryDocumentos.FieldByName('NUMLANCTO').asInteger         := NumLancto;
  qryDocumentos.FieldByName('PLANO').asInteger             := plano;
  qryDocumentos.FieldByName('UNIDNEGOC').asInteger         := unidnegoc;
  qryDocumentos.FieldByName('PLACONTA').asString           := placonta;
  qryDocumentos.FieldByName('CODCENTRORESPON').asString    := codcentrorespon;
  qryDocumentos.FieldByName('CODTIPRECDES').asString       := codtiprecdes;
  qryDocumentos.FieldByName('VALOR').asFloat               := valor;
  qryDocumentos.FieldByName('CODPORTFORMA').asInteger      := iUltPortForma;
  qryDocumentos.FieldByName('DEBCRE').asString             := sDebCre;
  qryDocumentos.FieldByName('RECPAG').asString             := sRecPag;
  qryDocumentos.FieldByName('PORTFORMAPARTICIP').asInteger := iPortFormaParticip;
  qryDocumentos.FieldByName('CodCentroCusto').asString     := sCodCentroCusto;
  QryDocumentos.Post;
end;

function DescarregaQryDocumentos(
  qryDocumentos: TwwQuery;
  iFavorecido, iTipoCli, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: boolean): LongInt;
var
  sVarPlaconta, sVarCCusto, sCodCentroCusto,
  PlaConta, PlaContaAnt, sNoDocumento ,sCentroRespon, sTiprecDes{, sDebCre}: string;
  Plano, iPrograma, iVarCodDoc, iVarSubConta, iVarPlano,
  iOrdem, iCodLancCAPCAR,iNumLancto,iUnidNegoc: integer;
  rValor: double;
  qryAux: TwwQuery;
begin
  Result := -3;

  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';

  qryAux.SQL.Add('SELECT IDCBANCARIA FROM CONTABANCARIA WHERE IDPESSOA = ' +
    IntToStr(iFavorecido) + ' AND FLGCONTAPREF = 1');
  qryAux.Open;
  if not(qryAux.IsEmpty) then
    Documento.IdContaBancaria := qryAux.FieldByName('IDCBANCARIA').asInteger;

  qryAux.Close;
  qryAux.SQL.Clear;

  qryDocumentos.First;
  while not(qryDocumentos.EOF) do
  begin
    // Pego a Conta Contábil do Favorecido
    PlaConta := qryDocumentos.FieldByName('PLACONTA').asString;
    Plano    := qryDocumentos.FieldByName('PLANO').asInteger;
    if (PlaConta = '') then
    begin
      qryAux.Close;
      with (qryAux.SQL) do
      begin
        Clear;
        Add('SELECT CONTACFORN, PLANO FROM EMPRESAFORN WHERE');
        Add('  (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+') AND');
        Add('  (IDFORCLI = ' +IntToStr(iFavorecido)+ ')');
      end;
      qryAux.Open;
      PlaConta := qryAux.FieldByName('CONTACFORN').asString;

      if (Plano = -1) and (qryAux.FieldByName('PLANO').asInteger <> 0) then
        Plano := qryAux.FieldByName('PLANO').asInteger;

      qryAux.Close;
    end;

    iCodLancCAPCAR := Documento.GetCodigo(qryAux);
    Inc(iOrdem);
    sNoDocumento := IntToStr(iFavorecido) + IntToStr(iOrdem);

    while (Documento.ValidaNumDoc(qryAux, qryDocumentos.FieldByName('RECPAG').asString,
           iFavorecido, StrToFloat(sNoDocumento),
           '', iVarCodDoc, iVarSubConta, iVarPlano, sVarPlaconta, sVarCCusto)) do
    begin
      Inc(iOrdem);
      sNoDocumento := IntToStr(iFavorecido) + IntToStr(iOrdem);
    end;

    if qryDocumentos.FieldByName('RECPAG').asString = 'P' then
      FazQuery(qryAux,'SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = '+ inttoStr(iFavorecido))
    else
      FazQuery(qryAux,'SELECT IDPESSOA FROM EMPRESACLIENTE WHERE IDFORCLI = '+ inttoStr(iFavorecido));
    if (qryAux.Eof) then
      Documento.ForCli.Inserir(iFavorecido,
        -1,
        -1,
        -1{iPlano},
        iTipoCli, //IdTipoCliente
        Sistema.IdEmpresa,
        '',
        '',
        '',
        '',
        iff(qryDocumentos.FieldByName('RECPAG').asString = 'P','F','C'),
        true);

    qryAux.Close;
    qryAux.SQL.Clear;


    Documento.Inserir(
      qryAux,
      iCodLancCAPCAR,
      IntToStr(Sistema.IdModulo),
      IntToStr(Plano),
      PlaConta,
      '',
      -1, // iMoeCodigo (nao é em outra moeda)
      -1,
      Sistema.IdEmpresa,
      iFavorecido,
      StrToInt(FrmPrincipal.prmCodTipDoc),
      StrToInt(sCodPortForma),
      qryDocumentos.FieldByName('RECPAG').asString, // Contas a Pagar ou Receber
      StrToFloat(sNoDocumento),
      '',
      DateToStr(Date), // Data de Emissao
      DateToStr(dtRecebimento),
      DateToStr(dtRecebimento),
      '0', // sStatus
      -1,  // iNumFatura
      '2', // sOperacao
      Sistema.IdUsuario,
      -1,
      -1,
      '',
      '',
      false,
      0,
      0,
      0);

    Result     := -2;
    iNumLancto := Documento.GerarNumLancto(qryAux, iCodLancCAPCAR);
    Result     := -1;

    if (iNumLancto <= 0) then
      exit;

    Documento.CriarLanctoDoc(
      qryAux,
      iCodLancCAPCAR,
      iNumLancto,
      -1,
      PlnCodigo,
      DateToStr(Date),
      Abs(valor),
      0,
      -1,
      iff(qryDocumentos.FieldByName('RECPAG').asString = 'P','D','C'), // DebCred
      '2', // sOperacao
      '',
      Sistema.IdUsuario,
      false,
      qryDocumentos.FieldByName('CODPORTFORMA').asInteger,
      '');

    //Documento.Informa_Planilha(); Registrar a planilha contábil no CAP

    PlaContaAnt := qryDocumentos.FieldByName('PLACONTA').asString;
    Result      := 0;
    while (qryDocumentos.FieldByName('PLACONTA').asString = PlaContaAnt) and
          (not qryDocumentos.EOF) do
    begin
      iUnidNegoc      := qryDocumentos.FieldByName('UNIDNEGOC').asInteger;
      sCentroRespon   := qryDocumentos.FieldByName('CODCENTRORESPON').asString;
      sTiprecDes      := qryDocumentos.FieldByName('CODTIPRECDES').asString;
      sCodCentroCusto := qryDocumentos.FieldByName('CODCENTROCUSTO').asString;
      rValor          := 0;

      if (bRateio) and (Sistema.UsaPlanoPatro) then
      begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT '+
                       'IDPROGRAMA '+
                       'FROM '+
                       'CENTCUST '+
                       'WHERE '+
                       '(CODCENTROCUSTO = ' +QuotedStr(sCodCentroCusto)+ ') AND '+
                       '(IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ') AND '+
                       '(IDPROGRAMA IS NOT NULL AND IDPROGRAMA > 0)');
        qryAux.Open;

        if (qryAux.FieldByName('IDPROGRAMA').asInteger > 0) then
          iPrograma := qryAux.FieldByName('IDPROGRAMA').asInteger
        else
          iPrograma := -1;
      end
      else
        iPrograma := -1;

      if (bRateio) then
      begin
        while (PlaContaAnt   = qryDocumentos.FieldByName('PLACONTA').asString)         and
              (iUnidNegoc    = qryDocumentos.FieldByName('UNIDNEGOC').asInteger)       and
              (sCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').asString)  and
              (sTiprecDes    = qryDocumentos.FieldByName('CODTIPRECDES').asString)     and
              (sCodCentroCusto = qryDocumentos.FieldByName('CODCENTROCUSTO').asString) and
              (not qryDocumentos.EOF) do
        begin
          if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
            rValor := rValor + qryDocumentos.FieldByName('VALOR').asFloat
          else
            rValor := rValor - qryDocumentos.FieldByName('VALOR').asFloat;
          qryDocumentos.Next;
        end;
      end
      else
      begin
        while (PlaContaAnt   = qryDocumentos.FieldByName('PLACONTA').asString)         and
              (iUnidNegoc    = qryDocumentos.FieldByName('UNIDNEGOC').asInteger)       and
              (sCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').asString)  and
              (sTiprecDes    = qryDocumentos.FieldByName('CODTIPRECDES').asString)     and
              (not qryDocumentos.EOF) do
        begin
          if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
            rValor := rValor + qryDocumentos.FieldByName('VALOR').asFloat
          else
            rValor := rValor - qryDocumentos.FieldByName('VALOR').asFloat;
          qryDocumentos.Next;
        end;
      end;

      Documento.Rateio.Inserir(
        iCodLancCAPCAR,
        sTipRecDes,
        qryDocumentos.FieldByName('RECPAG').asString, // Contas a Pagar ou Receber
        IFF(sCentroRespon = '','0',sCentroRespon),
        Sistema.IdEmpresa,
        Abs(rValor),
        0,
        Sistema.IdUsuario,
        IFF(iUnidNegoc = 0,-1,iUnidNegoc),
        -1,
        IFF(bRateio,sCodCentroCusto,''),
        IFF(Sistema.UsaPlanoPatro,IntegraBack.PatroGlobal,-1),
        iPrograma,
        IFF(Sistema.UsaPlanoPatro,IntegraBack.PlanoPrevGlobal,-1));
    end;
  end;

  Result := StrToInt(sNoDocumento);
  qryAux.Free;
end;

function ValidaDadosDoc(var CodCentroRespon, sMens:string; sTipRecDes:string;
                        var UnidNegoc:integer): boolean;
begin
  sMens:=''; Result:=true;

  if (IntegraBack.ObrigaAbc = 'S') and (unidnegoc = 0) then
  begin
    sMens  := sMens + ' - Atividade / Projeto não cadastrada';
    Result := false;
  end;

  if (IntegraBack.ObrigaCRespon = 'S') and (codcentrorespon = '') then
  begin
    sMens  := sMens + ' - Centro de Responsabilidade não cadastrado';
    Result := false;
  end;

  if (sTipRecDes = '') then
  begin
    sMens  := sMens + ' - Tipo de Recebimento/Desembolso não cadastrado';
    Result := false;
  end;
end;

end.
