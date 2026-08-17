unit uCtrlGeraDARM;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : (nova) ListDocPendentes
Data      : 05/07/2007
Autor     : André Pontes
Pendencia : 25721
Descrição : Criada função para listagem baseada nos documentos, natureza e codgps - "fechada" por
            documento em vez de listar LancIRRF ("aberta")
            O processamento permanece baseado na LancIRRF. A listagem de documentos é apenas para
            exibição ao usuário
----------------------------------------------------------------------------------------------------
Rotina    : GeraGuia, GravaRateio, GravaCaP
Data      : 23/04/2007
Autor     : André Pontes
Pendencia : 22346
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : GeraGuia
Data      : 17/04/2007
Autor     : André Pontes
Pendencia : 23882
Descrição : Gravação de Centro de Responsabilidade sobrescrevendo o rateio dos documentos originais
----------------------------------------------------------------------------------------------------
Rotina    : GeraGuia e GravaCaP 
Data      : 17/04/2007
Autor     : André Pontes
Pendencia : 22657
Descrição : Gravação do campo "Competência"
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 23/03/2007 a 26/03/2007
Autor     : André Pontes
Pendencia : 24837
Descrição : Ctrl completamente reescrita, baseada na CtrlGeraGPS
---------------------------------------------------------------------------------------------------}

interface


uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
  uCtrlParamIntegra, uCMMath, uCMFileUtils, ShellAPI, Windows, Classes, Forms, uDBDocISS,
  uCtrlDARF, uCtrlGeraGPS, uCtrlDocumento, uCtrlSegregacao, uCtrlUtil,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlGeraDARM = class(TCmControlObject)

    private

      CtrlSegregacao    : TCtrlSegregacao;
      Documento         : TCtrlDocumento;
      CtrlDARF          : TCtrlDARF;
      CtrlUtil          : TCtrlUtil;
      CtrlGeraGPS       : TCtrlGeraGPS;

      DBDocISS          : TDBDocISS;

      cdsRateio         : TCMClientDataSet;
      cdsCCBaixasxDocum : TCMClientDataSet;
      cdsDoc            : TCMClientDataSet;
      cdsRat            : TCMClientDataSet;
      cdsLancInsert     : TCMClientDataSet;
      cdsAtuLancIRRF    : TCMClientDataSet;

      FcdsLancIRRF      : TCMClientDataSet;
      FcdsDocISS        : TCMClientDataSet;

      FcdsAlteradores   : TCMClientDataSet;
      FcdsDocLancIRRF: TCMClientDataSet;

      procedure SetCdsLancIRRF(const Value: TCMClientDataSet);
      procedure SetcdsDocISS(const Value: TCMClientDataSet);
      procedure SetCdsAlteradores(const Value: TCMClientDataSet);
      procedure SetCdsDocLancIRRF(const Value: TCMClientDataSet);


    protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


    public

      constructor Create; override;
      destructor Destroy; override;

      property cdsDocLancIRRF : TCMClientDataSet  read FcdsDocLancIRRF  write SetCdsDocLancIRRF;
      property cdsLancIRRF    : TCMClientDataSet  read FcdsLancIRRF     write SetCdsLancIRRF;
      property cdsDocISS      : TCMClientDataSet  read FcdsDocISS       write SetCdsDocISS;
      property cdsAlteradores : TCMClientDataSet  read FcdsAlteradores  write SetCdsAlteradores;



      // -------------------------------------------------------------------------------------------
      // Lookups
      // -------------------------------------------------------------------------------------------

      function BuscaGuia(piCodDocumento, pIDDocISS: Integer): OleVariant;

      function AlteraGuia: Boolean;

      function ExcluiGuia(const pIDDocISS: Integer): Boolean;

      function ListLancPendentes(const pdDataIni   : TDateTime;
                                 const pdDataFim   : TDateTime;
                                 const piOrdenacao : Integer;
                                 const pbPF        : Boolean;
                                 const pbPJ        : Boolean
                                ): OleVariant;

      function ListDocPendentes(const pdDataIni    : TDateTime;
                                const pdDataFim    : TDateTime;
                                const piOrdenacao  : Integer;
                                const pbPF         : Boolean;
                                const pbPJ         : Boolean
                               ): OleVariant;

      function GravaCAP(const prTotalRateio   : Currency;
                        const pfValor         : Currency;
                        const psDataLanc      : string;
                        const psContaC        : string;
                        const psCentroCusto   : string;
                        const pdDataVenc      : TDateTime;
                        const piFavorecido    : Integer;
                        const piSubConta      : Integer;
                        const piFormaPagto    : Integer;
                        const pIDModulo       : Integer;
                        const pIDUsuario      : Integer;
                        const pIDPessoa       : Integer;
                        const piTipoDoc       : Integer;
                        const EspAcesso       : Integer;
                        const piPlano         : Integer;
                        const piCodDocumento  : Integer;
                        const piCodGuia       : Integer;
                        const piBeneficiario  : Integer;
                        const psCompetencia   : string    
                       ): Boolean;

      function GeraGuia(const pIDPessoa        : Integer;
                        const piAgrupamento    : Integer;
                        const piFavorecido     : Integer;
                        const piSubConta       : Integer;
                        const piFormaPagto     : Integer;
                        const pIDModulo        : Integer;
                        const pIDUsuario       : Integer;
                        const piTipoDoc        : Integer;
                        const EspAcesso        : Integer;
                        const piPlano          : Integer;
                        const psCentroCusto    : string;
                        const pdDataVenc       : TDateTime;
                        const psCompetencia    : string;     
                        const psCentroRespon   : string      
                       ): Boolean;

      // -------------------------------------------------------------------------------------------
      // Gravação das chaves estrangeiras
      // -------------------------------------------------------------------------------------------

      function AtualizaDocISS(pIDDocISS : Integer; CodDocumento : Integer = 0): Boolean;

      function AtualizaLanc(pIDDocISS, piCodDocumento: Integer; cOperacao : Char = 'I'): Boolean;

      function PreencheDocISSnaLancIRRF(const pIDLancIRRF  : Integer;
                                         const pIDDocISS   : Integer
                                        ): Boolean;

      // -------------------------------------------------------------------------------------------
      // Funções de integração com CaP

      procedure GravaRateio(const piUnidNegoc       : Integer;
                            const piIDPlanoPrev     : Integer;
                            const piIDPatro         : Integer;
                            const piIDPrograma      : Integer;
                            const psCodCentroCusto  : string;
                            const psCodCentroRespon : string;
                            const psCodTipRecDes    : string;
                            const prValor           : Double
                           );

      procedure GravaCCBaixasxDocum(const piIDPlanoPrev   : Integer;
                                    const piIDPatro       : Integer;
                                    const piIDPessoa      : Integer;
                                    const piPlano         : Integer;
                                    const piUnidNegoc     : Integer;
                                    const psPlaConta      : string;
                                    const pfValor         : Currency
                                   );

      // -------------------------------------------------------------------------------------------

    end;



implementation
{ TCtrlGeraDARM }



// -------------------------------------------------------------------------------------------------
// Create / Initializa / Destroy
// -------------------------------------------------------------------------------------------------

constructor TCtrlGeraDARM.Create;
begin
  inherited;

  cdsLancIRRF       := TCMClientDataSet.Create(nil);
  cdsRateio         := TCMClientDataSet.Create(nil);
  cdsCCBaixasxDocum := TCMClientDataSet.Create(nil);
  cdsDoc            := TCMClientDataSet.Create(nil);
  cdsRat            := TCMClientDataSet.Create(nil);
  cdsLancInsert     := TCMClientDataSet.Create(nil);
  cdsAtuLancIRRF    := TCMClientDataSet.Create(nil);
  cdsAlteradores    := TCMClientDataSet.Create(nil);

  CtrlDARF          := TCtrlDARF.Create;
  CtrlUtil          := TCtrlUtil.Create;
  CtrlGeraGPS       := TCtrlGeraGPS.Create;
  Documento         := TCtrlDocumento.Create;

  DBDocISS          := TDBDocISS.Create(self);
end;



destructor TCtrlGeraDARM.Destroy;
begin
  DBDocISS.Free;
  CtrlDARF.Free;
  CtrlUtil.Free;
  CtrlGeraGPS.Free;
  Documento.Free;

  cdsLancIRRF.Free;
  cdsRateio.Free;
  cdsDoc.Free;
  cdsRat.Free;
  cdsLancInsert.Free;
  cdsAtuLancIRRF.Free;
  cdsAlteradores.Free;
  cdsCCBaixasxDocum.Free;

  inherited;
end;



procedure TCtrlGeraDARM.DoChangeDataBase;
begin
  inherited;
  DBDocISS.DataBaseName := DataBaseName;
end;



procedure TCtrlGeraDARM.AfterInitialize;
begin
  inherited;

  CtrlDARF.InitializeAs(self);
  CtrlGeraGPS.InitializeAs(self);
  CtrlUtil.InitializeAs(Self);
  Documento.InitializeAs(self);

  CtrlDARF.OpenTransaction  := False;
  Documento.OpenTransaction := False;
end;

// -------------------------------------------------------------------------------------------------
// FIM Create / Initializa / Destroy
// -------------------------------------------------------------------------------------------------



// -------------------------------------------------------------------------------------------------
// Gravação das chaves estrangeiras
// -------------------------------------------------------------------------------------------------

function TCtrlGeraDARM.AtualizaDocISS(pIDDocISS : Integer; CodDocumento : Integer = 0): Boolean;
var
  sSQL : string;
begin
  Result := True;

  if CodDocumento = 0 then
  begin
   sSQL := 'UPDATE DOCISS SET CODDOCISS = NULL WHERE IDDOCISS = '+IntToStr(pIDDocISS);

    if not(ExecSQL(sSQL)) then Result := False;
  end
  else  // if CodDocumento = 0
  begin
    sSQL := 'UPDATE DOCISS SET CODDOCISS = ' + IntToStr(CodDocumento) + ' WHERE IDDOCISS = '+IntToStr(pIDDocISS);

    if not(ExecSQL(sSQL)) then Result := False;
  end;  // if CodDocumento = 0
end;



function TCtrlGeraDARM.AtualizaLanc(pIDDocISS, piCodDocumento: Integer; cOperacao : Char = 'I'): Boolean;
var
  sSQL : string;
begin
  try
    Result := False;

    if cOperacao = 'I' then
    begin
      sSQL :=
      'UPDATE '                                             + #13 +
      '  LANCIRRF '                                         + #13 +
      'SET '                                                + #13 +
      '  IDDOCISS        = ' + IntToStr(pIDDocISS)        + #13 +
      'WHERE '                                              + #13 +
      '      CODDOCUMENTO = ' + IntToStr(piCodDocumento)    + #13 +
      '  AND VLRISS      > 0 ';
    end
    else
    begin
      sSQL :=
      'UPDATE '             + #13 +
      '  LANCIRRF '         + #13 +
      'SET '                + #13 +
      '  IDDOCISS = NULL ' + #13 +
      'WHERE '              + #13 +
      '  IDDOCISS = '      + IntToStr(pIDDocISS);
    end;

    ExecSQL(sSQL);
    Result := True;
  except
    on E:Exception do
    begin
      Rollback;
      Result      := False;
      MessageInfo := 'Erro ao atualizar o lançamento de ISS'
    end;
  end;
end;



function TCtrlGeraDARM.PreencheDocISSnaLancIRRF(const pIDLancIRRF  : Integer;
                                                const pIDDocISS   : Integer
                                               ): Boolean;
var
  sSQL : string;
begin
  Result := True;

  sSQL :=
  'UPDATE LANCIRRF '                                        + #13 +
  'SET    IDDOCISS   = ' + FormatFloat('#0', pIDDocISS)   + #13 +
  'WHERE  IDLANCIRRF  = ' + FormatFloat('#0', pIDLancIRRF);

  if not(ExecSQL(sSQL, True)) then Result := False;
end;

// -------------------------------------------------------------------------------------------------
// FIM Gravação das chaves estrangeiras
// -------------------------------------------------------------------------------------------------



function TCtrlGeraDARM.BuscaGuia(piCodDocumento, pIDDocISS: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                             + #13 +
  '  DOC.DATAEMISSAO,   DOC.DATAVENCTO,   DOC.DATAPROGRAMADA, '         + #13 +
  '  DOC.DATADISPONIB,  DOC.CODDOCUMENTO, '                             + #13 +
  '  DOC.PLACONTA,      DOC.CODTIPDOC,    DOC.NODOCUMENTO, '            + #13 +
  '  DOC.CODFORMA, '                                                    + #13 +
  '  DOC.NODOCUMENTO || '' / '' || DOC.COMPLDOCUMENTO AS NOCOMPLDOC, '  + #13 +

  '  PES.NOME,          PES.IDPESSOA, '                                 + #13 +

  '  DIS.CODIGOPGTO,    DIS.CODDOCISS, '                                + #13 +
  '  DIS.IDDOCISS,      DIS.VLRJUROS,     DIS.VLRISS, '                 + #13 +
  '  DIS.VLRMULTA,      DIS.VLRDESCONTO,  DIS.VLRTOTAL, '               + #13 +
  '  DIS.NUMLANCJUROS,  DIS.NUMLANCMULTA, DIS.NUMLANCDESCONTO  '        + #13 +

  'FROM '                                                               + #13 +
  '  DOCUMENTO   DOC, '                                                 + #13 +
  '  PESSOA      PES, '                                                 + #13 +
  '  DOCISS      DIS  '                                                 + #13 +

  'WHERE '                                                              + #13 +
  '      DOC.CODDOCUMENTO  = DIS.CODDOCISS '                            + #13 +
  '  AND DOC.IDFORCLI      = PES.IDPESSOA '                             + #13 +
  '  AND DIS.CODDOCISS    = ' + IntToStr(piCodDocumento)                + #13 +
  '  AND DIS.IDDOCISS     = ' + IntToStr(pIDDocISS);

  Result := GetDataPacket(sSQL);
end;



function TCtrlGeraDARM.AlteraGuia: Boolean;
begin
  try
    Result := ApplyCds(FcdsDocISS, DBDocISS, [], []);
    
    if not(Result) then raise Exception.Create(DBDocISS.MessageInfo);
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;



function TCtrlGeraDARM.ExcluiGuia(const pIDDocISS: Integer): Boolean;
var
  sSQL : string;
begin
  sSQL := 'DELETE FROM DOCISS WHERE IDDOCISS = ' + FormatFloat('#0', pIDDocISS);

  if ExecSQL(sSQL, True) then
  begin
    Result := True;
  end
  else
  begin
    Result      := False;
    MessageInfo := 'Erro ao excluir DocISS.';
  end;
end;



function TCtrlGeraDARM.GeraGuia(const pIDPessoa       : Integer;
                                const piAgrupamento   : Integer;
                                const piFavorecido    : Integer;
                                const piSubConta      : Integer;
                                const piFormaPagto    : Integer;
                                const pIDModulo       : Integer;
                                const pIDUsuario      : Integer;
                                const piTipoDoc       : Integer;
                                const EspAcesso       : Integer;
                                const piPlano         : Integer;
                                const psCentroCusto   : string;
                                const pdDataVenc      : TDateTime;
                                const psCompetencia   : string;   
                                const psCentroRespon  : string    
                               ): Boolean;
var
  iCodigoGuia   : Integer;
  iUnidNegoc    : Integer;
  iCodDocumento : Integer;

  IDBenefGuia   : Integer;

  rTotalRateio  : Currency;
  fValor        : Currency;
  sDataLanc     : string;
  sContaC       : string;
  sCRGravacao   : string;

  sCondAtu      : string;
  sCondAnt      : string;
  sCondDoc      : string;
  sCondData     : string;
  sCondForn     : string;
  sCondCodPag   : string;
begin
  try
    Result := True;

    StartTransaction;

    cdsLancIRRF.First;
    while not(cdsLancIRRF.EOF) do
    begin
      // -------------------------------------------------------------------------------------------

      sCondDoc      := cdsLancIRRF.FieldByName('CODDOCUMENTO').AsString;
      sCondData     := cdsLancIRRF.FieldByName('DATALANCTO').AsString;
      sCondForn     := cdsLancIRRF.FieldByName('IDFORCLI').AsString;
      sCondCodPag   := cdsLancIRRF.FieldByName('CODIGOGPS').AsString;

      if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('TIPO').AsString = 'F') then sCondForn := '0';

      // -------------------------------------------------------------------------------------------
      // O critério de agrupamento estava errado: havia 4 opções, e a 3ª estava por data, que era
      // bem antiga, e já havia sido retirada da tela
      case piAgrupamento of
        0:    sCondAtu := sCondDoc   + sCondCodPag;
        1:    sCondAtu := sCondData  + sCondForn     + sCondCodPag;
        2, 3: sCondAtu := sCondForn  + sCondCodPag;
      end;
      // -------------------------------------------------------------------------------------------

      cdsAtuLancIRRF.Close;
      cdsAtuLancIRRF.Data     := GetDataPacket('SELECT 0 AS IDLANCIRRF FROM DUAL WHERE 1 = 2');
      cdsRateio.Data          := CtrlDarf.ProcurarRateio(-1);
      cdsCCBaixasxDocum.Data  := CtrlUtil.DadosCCBaixaXDocum(-1);

      sCondAnt    := sCondAtu;
      sDataLanc   := cdsLancIRRF.FieldByName('DATALANCTO').AsString;
      sContaC     := cdsLancIRRF.FieldByName('PLACONTA').AsString;
      fValor      := 0;


      while not(cdsLancIRRF.EOF) and (sCondAnt = sCondAtu) do
      begin
        if cdsLancIRRF.FieldByName('FLAG').AsString = 'S' then
        begin
          // Beneficiário da GPS (se for pessoa física, usar a própria Fundação)
          IDBenefGuia     := cdsLancIRRF.FieldByName('IDFORCLI').AsInteger;
          if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('TIPO').AsString = 'F') then IDBenefGuia := pIDPessoa;

          fValor          := fValor + cdsLancIRRF.FieldByName('VALOR').AsFloat;
          sContaC         := cdsLancIRRF.FieldByName('PLACONTA').AsString;
          iCodDocumento   := cdsLancIRRF.FieldByName('CODDOCUMENTO').AsInteger;
          iCodigoGuia     := cdsLancIRRF.FieldByName('CODIGOGPS').AsInteger;

          cdsAtuLancIRRF.Insert;
          cdsAtuLancIRRF.FieldByName('IDLANCIRRF').AsInteger := cdsLancIRRF.FieldByName('IDLANCIRRF').AsInteger;
          cdsAtuLancIRRF.Post;

          // Rateio
          try
            sCRGravacao := cdsLancIRRF.FieldByName('CODCENTRORESPON').AsString;
            if psCentroRespon <> '' then sCRGravacao := psCentroRespon;

            GravaRateio(cdsLancIRRF.FieldByName('UNIDNEGOC').AsInteger,
                        cdsLancIRRF.FieldByName('IDPLANOPREV').AsInteger,
                        cdsLancIRRF.FieldByName('IDPATRO').AsInteger,
                        cdsLancIRRF.FieldByName('IDPROGRAMA').AsInteger,
                        cdsLancIRRF.FieldByName('CODCENTROCUSTO').AsString,
                        sCRGravacao,   
                        cdsLancIRRF.FieldByName('CODTIPRECDES').AsString,
                        cdsLancIRRF.FieldByName('VALOR').AsCurrency
                       );
          except
            on E: exception do
            begin
              Result      := False;
              MessageInfo := E.message;
            end;
          end;

          // Contas de Baixa
          try
            GravaCCBaixasxDocum(cdsLancIRRF.FieldByName('IDPLANOPREV').AsInteger,
                                cdsLancIRRF.FieldByName('IDPATRO').AsInteger,
                                pIDPessoa,
                                piPlano,
                                cdsLancIRRF.FieldByName('UNIDNEGOC').AsInteger,
                                cdsLancIRRF.FieldByName('PLACONTA').AsString,
                                cdsLancIRRF.FieldByName('VALOR').AsCurrency
                               );
          except
            on E: exception do
            begin
              Result      := False;
              MessageInfo := E.message;
            end;
          end;
        end;  // if cdsLancIRRF.FieldByName('FLAG').AsString = 'S'

        cdsLancIRRF.Next;

        // -----------------------------------------------------------------------------------------

        sCondDoc      := cdsLancIRRF.FieldByName('CODDOCUMENTO').AsString;
        sCondData     := cdsLancIRRF.FieldByName('DATALANCTO').AsString;
        sCondCodPag   := cdsLancIRRF.FieldByName('CODIGOGPS').AsString;
        sCondForn     := cdsLancIRRF.FieldByName('IDFORCLI').AsString;

        if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('TIPO').AsString = 'F') then sCondForn := '0';

        // -----------------------------------------------------------------------------------------
        // O critério de agrupamento estava errado: havia 4 opções, e a 3ª estava por data, que era
        // bem antiga, e já havia sido retirada da tela
        case piAgrupamento of
          0:    sCondAtu := sCondDoc   + sCondCodPag;
          1:    sCondAtu := sCondData  + sCondForn     + sCondCodPag;
          2, 3: sCondAtu := sCondForn  + sCondCodPag;
        end;
        // -----------------------------------------------------------------------------------------
      end;  // while not(cdsLancIRRF.EOF) and (sCondAnt = sCondAtu)

      // -------------------------------------------------------------------------------------------
      if fValor <> 0 then
      begin
        if not(GravaCAP(fValor,
                        fValor,
                        sDataLanc,
                        sContaC,
                        psCentroCusto,
                        pdDataVenc,
                        piFavorecido,
                        piSubConta,
                        piFormaPagto,
                        pIDModulo,
                        pIDUsuario,
                        pIDPessoa,
                        piTipoDoc,
                        EspAcesso,
                        piPlano,
                        iCodDocumento,
                        iCodigoGuia,
                        IDBenefGuia,
                        psCompetencia
                       )) then
        begin
          Result := False;
          Raise Exception.Create(messageinfo);
        end;

      end;  // if rValor <> 0
      // -------------------------------------------------------------------------------------------

    end;  // while not(cdsLancIRRF.EOF)

  except
    on E:Exception do
    begin
      Rollback;
      Result      := False;
      MessageInfo := E.Message + CtrlDARF.MessageInfo;
    end;
  end;

  if InTransaction then Commit;
end;



function TCtrlGeraDARM.GravaCAP(const prTotalRateio   : Currency;
                                const pfValor         : Currency;
                                const psDataLanc      : string;
                                const psContaC        : string;
                                const psCentroCusto   : string;
                                const pdDataVenc      : TDateTime;
                                const piFavorecido    : Integer;
                                const piSubConta      : Integer;
                                const piFormaPagto    : Integer;
                                const pIDModulo       : Integer;
                                const pIDUsuario      : Integer;
                                const pIDPessoa       : Integer;
                                const piTipoDoc       : Integer;
                                const EspAcesso       : Integer;
                                const piPlano         : Integer;
                                const piCodDocumento  : Integer;
                                const piCodGuia       : Integer;
                                const piBeneficiario  : Integer;
                                const psCompetencia   : string   
                               ): Boolean;
var
  iCodForn       : Integer;
  iNumLancto     : Integer;
  PlnCodigo      : Integer;
  iCodForma      : Integer;
  sValor         : string;
  sSQL           : string;
  fTotValorRat   : Currency;
  iTotRecRateio  : Integer;
begin
  Result := True;

  cdsDoc.Data         := CtrlDARF.ProcurarDocumento(-1);
  cdsLancInsert.Data  := CtrlDARF.ProcurarLancamentos(-1);
  cdsRat.Data         := CtrlDARF.ProcurarRateio(-1);
  iCodForma           := piFormaPagto;

  // inserir na tabela documento
  cdsDoc.Insert;
  cdsDoc.FieldByName('IDMODULO').AsInteger            := pIDModulo;

  // verifica se o sistema é integrado com a contabilidade.
  if piPlano  > 0 then
    cdsDoc.FieldByName('PLANO').AsInteger             := piPlano;

  cdsDoc.FieldByName('PLACONTA').AsString             := psContaC;
  cdsDoc.FieldByName('CODCENTROCUSTO').AsString       := psCentroCusto;
  cdsDoc.FieldByName('IDPESSOA').AsInteger            := pIDPessoa;
  cdsDoc.FieldByName('IDEMPRESA').AsInteger           := pIDPessoa;

  cdsDoc.FieldByName('IDFORCLI').AsInteger            := piFavorecido;

  cdsDoc.FieldByName('CODTIPDOC').AsInteger           := piTipoDoc;
  cdsDoc.FieldByName('RECPAG').AsString               := 'P';

  cdsDoc.FieldByName('DATAEMISSAO').AsDateTime        := Date;
  cdsDoc.FieldByName('DATAVENCTO').AsDateTime         := pdDataVenc;
  cdsDoc.FieldByName('DATAPROGRAMADA').AsDateTime     := pdDataVenc;
  cdsDoc.FieldByName('OPERACAO').AsString             := '2';
  cdsDoc.FieldByName('IDUSUARIOINCLUSAO').AsInteger   := pIDUsuario;
  cdsDoc.FieldByName('CODSUBCONTA').AsInteger         := piSubConta;

  if iCodForma > 0 then
    cdsDoc.FieldByName('CODFORMA').AsInteger          := iCodForma;

  cdsDoc.FieldByName('EMISBLOQ').AsString             := 'N';
  cdsDoc.Post;

  PlnCodigo := -1;

  // cria lancamento na tabela lanctodocum
  cdsLancInsert.Insert;
  cdsLancInsert.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
  cdsLancInsert.FieldByName('DATALANCTO').AsString         := psDataLanc;
  cdsLancInsert.FieldByName('VALOR').AsFloat               := pfValor;
  cdsLancInsert.FieldByName('DEBCRE').AsString             := 'C';
  cdsLancInsert.FieldByName('OPERACAO').AsString           := '2';
  cdsLancInsert.FieldByName('HISTORICOCOMPL').AsString     := 'ISS';
  cdsLancInsert.FieldByName('IDUSUARIOINCLUSAO').AsInteger := pIDUsuario;
  cdsLancInsert.Post;

  fTotValorRat := 0;
  iTotRecRateio:= 1;

  cdsRateio.First;
  while not(cdsRateio.EOF) do
  begin
    // -------------------------------------------------------------------------------------------
    //inserir rateio

    cdsRat.Insert;
    cdsRat.FieldByName('CODTIPRECDES').AsString       := cdsRateio.FieldByName('CODTIPRECDES').AsString;
    cdsRat.FieldByName('RECPAG').AsString             := 'P';
    cdsRat.FieldByName('CODCENTRORESPON').AsString    := cdsRateio.FieldByName('CODCENTRORESPON').AsString;
    cdsRat.FieldByName('IDPESSOA').AsInteger          := pIDPessoa;
    cdsRat.FieldByName('VALOR').AsFloat               := cdsRateio.FieldByName('VALOR').AsFloat;
    cdsRat.FieldByName('IDUSUARIOINCLUSAO').AsInteger := pIDUsuario;
    cdsRat.FieldByName('UNIDNEGOC').AsString          := cdsRateio.FieldByName('UNIDNEGOC').AsString;
    cdsRat.FieldByName('CODCENTROCUSTO').AsString     := cdsRateio.FieldByName('CODCENTROCUSTO').AsString;
    cdsRat.FieldByName('PLANO').AsInteger             := piPlano;

    if cdsRateio.FieldByName('IDPATRO').AsInteger > 0 then
      cdsRat.FieldByName('IDPATRO').AsInteger         := cdsRateio.FieldByName('IDPATRO').AsInteger;

    if cdsRateio.FieldByName('IDPROGRAMA').AsInteger > 0 then
      cdsRat.FieldByName('IDPROGRAMA').AsInteger      := cdsRateio.FieldByName('IDPROGRAMA').AsInteger;

    if cdsRateio.FieldByName('IDPLANOPREV').AsInteger > 0 then
      cdsRat.FieldByName('IDPLANOPREV').AsInteger     := cdsRateio.FieldByName('IDPLANOPREV').AsInteger;

    cdsRat.post;
    cdsRateio.Next;

    inc(iTotRecRateio);
  end;

  // ---------------------------------------------------------------------------------------------

  if not(CtrlDARF.GravarDocumento(cdsDoc.Data,
                                  cdsLancInsert.Data,
                                  cdsRat.Data,
                                  cdsCCBaixasxDocum.Data,
                                  'I',
                                  EspAcesso,
                                  pIDUsuario
                                 )) then
  begin
    Result := False;
    MessageInfo := CtrlDARF.MessageInfo;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------
  // insere o documento na DocISS como não impresso

  DBDocISS.CodigoPgto.AsInteger   := piCodGuia;
  DBDocISS.CodDocISS.AsInteger    := Trunc(CtrlDARF.CodDocumento);
  DBDocISS.Competencia.AsString   := psCompetencia; 
  DBDocISS.FlgImpresso.AsString   := 'N';
  DBDocISS.DataVencto.AsDateTime  := pdDataVenc;
  DBDocISS.VlrTotal.AsFloat       := pfValor;
  DBDocISS.VlrISS.AsFloat         := pfValor;

  if not(DBDocISS.Insert) then
  begin
    Result := False;
    MessageInfo := 'Erro ao inserir na tabela DOCISS';
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  AtualizaLanc(DBDocISS.IDDocISS.AsInteger, piCodDocumento);

  cdsAtuLancIRRF.First;
  while not(cdsAtuLancIRRF.EOF) do
  begin
    if not(PreencheDocISSnaLancIRRF(cdsAtuLancIRRF.FieldByName('IDLANCIRRF').AsInteger,
                                    DBDocISS.IDDocISS.AsInteger
                                   )) then
    begin
      Result := False;
      MessageInfo := 'Erro ao atualizar o código do documento de ISS na tabela LancIRRF';
      Exit;
    end;

    cdsAtuLancIRRF.Next;
  end;

  // -----------------------------------------------------------------------------------------------
end;



procedure TCtrlGeraDARM.GravaRateio(const piUnidNegoc       : Integer;
                                    const piIDPlanoPrev     : Integer;
                                    const piIDPatro         : Integer;
                                    const piIDPrograma      : Integer;
                                    const psCodCentroCusto  : string;
                                    const psCodCentroRespon : string;
                                    const psCodTipRecDes    : string;
                                    const prValor           : Double
                                   );
begin
  if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODCENTRORESPON;CODTIPRECDES;IDPROGRAMA;UNIDNEGOC',
                      VarArrayOf([piIDPatro, piIDPlanoPrev, psCodCentroCusto, psCodCentroRespon, psCodTipRecDes, piIDPrograma, piUnidNegoc]),
                      []
                     ) then
  begin
    cdsRateio.Edit;
    cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + prValor;
    cdsRateio.Post;
  end
  else
  begin
    cdsRateio.Insert;
    cdsRateio.FieldByName('VALOR').AsFloat            := prValor;
    cdsRateio.FieldByName('IDPATRO').AsInteger        := piIDPatro;
    cdsRateio.FieldByName('IDPLANOPREV').AsInteger    := piIDPlanoPrev;
    cdsRateio.FieldByName('CODCENTROCUSTO').AsString  := psCodCentroCusto;
    cdsRateio.FieldByName('CODCENTRORESPON').AsString := psCodCentroRespon;
    cdsRateio.FieldByName('CODTIPRECDES').AsString    := psCodTipRecDes;
    cdsRateio.FieldByName('IDPROGRAMA').AsInteger     := piIDPrograma;
    cdsRateio.FieldByName('UNIDNEGOC').AsInteger      := piUnidNegoc;
    cdsRateio.Post;
  end;
end;



procedure TCtrlGeraDARM.GravaCCBaixasxDocum(const piIDPlanoPrev   : Integer;
                                            const piIDPatro       : Integer;
                                            const piIDPessoa      : Integer;
                                            const piPlano         : Integer;
                                            const piUnidNegoc     : Integer;
                                            const psPlaConta      : string;
                                            const pfValor         : Currency
                                           );
begin
  if cdsCCBaixasxDocum.Locate('IDPATRO;IDPLANOPREV;PLACONTA;UNIDNEGOC',
                              VarArrayOf([piIDPatro, piIDPlanoPrev, psPlaConta, piUnidNegoc]), []) then
  begin
    cdsCCBaixasxDocum.Edit;
    cdsCCBaixasxDocum.FieldByName('VALOR').AsCurrency := cdsCCBaixasxDocum.FieldByName('VALOR').AsCurrency + pfValor;
    cdsCCBaixasxDocum.Post;
  end
  else
  begin
    cdsCCBaixasxDocum.Insert;
    cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger     := piIDPlanoPrev;
    cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger         := piIDPatro;
    cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger        := piIDPessoa;
    cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString         := psPlaConta;
    cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsInteger       := piUnidNegoc;
    cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger           := piPlano;
    cdsCCBaixasxDocum.FieldByName('VALOR').AsCurrency          := pfValor;
    cdsCCBaixasxDocum.Post;
  end;
end;



function TCtrlGeraDARM.ListLancPendentes(const pdDataIni    : TDateTime;
                                         const pdDataFim    : TDateTime;
                                         const piOrdenacao  : Integer;
                                         const pbPF         : Boolean;
                                         const pbPJ         : Boolean
                                        ): OleVariant;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataFim)) + ', ''DD/MM/YYYY'')';

  sSQL :=
  'SELECT '                                                                             + #13 +
  '  ''S'' AS FLAG, '                                                                   + #13 +
  '  L.IDLANCIRRF, L.VLRBASE, L.VLRISS AS VALOR, '                                      + #13 +
  '  L.DATALANCAMENTO, L.DATALANCAMENTO AS DATALANCTO, '                                + #13 +
  '  L.CODDOCUMENTO, L.IDPESSOA, L.IDBENEFIRRF, L.IDBENEFIRRF AS IDFORCLI, '            + #13 +
  '  L.CODNATUREZA, L.PLANO, L.PLACONTA, '                                              + #13 +
  '  L.IDPLANOPREV, L.IDPATRO, L.UNIDNEGOC, L.IDPROGRAMA, '                             + #13 +
  '  L.CODCENTROCUSTO, L.CODCENTRORESPON, L.CODTIPRECDES, '                             + #13 +
  '  P.TIPO, '                                                                          + #13 +
  '  P.NOME AS RAZAOSOCIAL, L.CODIGOGPS '                                               + #13 +

  'FROM '                                                                               + #13 +
  '  LANCIRRF  L, '                                                                     + #13 +
  '  PESSOA    P  '                                                                     + #13 +

  'WHERE '                                                                              + #13 +
  '      L.DATALANCAMENTO                  BETWEEN ' + sDataIni + ' AND ' + sDataFim    + #13 +
  '  AND NVL(L.IDMODULORESPON, L.IDMODULO) = 3 '                                        + #13 +
  '  AND L.CODDOCUMENTO                     IS NOT NULL '                               + #13 +
  '  AND L.IDBENEFIRRF                     = P.IDPESSOA '                               + #13 +
  '  AND ROUND(L.VLRISS, 2)               <> 0 '                                        + #13 +
  '  AND NVL(L.IDDOCISS, 0)                = 0 '                                        + #13;

  if pbPF xor pbPJ then
  begin
    if pbPF then sSQL := sSQL +
  '  AND P.TIPO                             = ''F'' '                                   + #13;
    if pbPJ then sSQL := sSQL +
  '  AND P.TIPO                             = ''J'' '                                   + #13;
  end;

  sSQL := sSQL +
  'ORDER BY '                                                                           + #13;

  case piOrdenacao of
    0:  sSQL := sSQL + 'L.CODDOCUMENTO ';
    1:  sSQL := sSQL + 'L.DATALANCAMENTO, L.IDBENEFIRRF, L.CODIGOGPS ';
    2:  sSQL := sSQL + 'L.IDBENEFIRRF, L.DATALANCAMENTO, L.CODIGOGPS ';
    3:  sSQL := sSQL + 'P.TIPO, L.CODIGOGPS, L.IDBENEFIRRF ';
  end;

  Result := GetdataPacket(sSQL);
end;



function TCtrlGeraDARM.ListDocPendentes(const pdDataIni    : TDateTime;
                                       const pdDataFim    : TDateTime;
                                       const piOrdenacao  : Integer;
                                       const pbPF         : Boolean;
                                       const pbPJ         : Boolean
                                      ): OleVariant;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataFim)) + ', ''DD/MM/YYYY'')';

  sSQL :=
  'SELECT '                                                                                 + #13 +
  '  ''S'' AS FLAG, '                                                                       + #13 +

  '  SUM(LIR.VLRBASE) AS VLRBASE, SUM(LIR.VLRISS) AS VALOR, '                               + #13 +

  '  LIR.CODDOCUMENTO, DOC.NODOCUMENTO, '                                                   + #13 +
  '  LIR.DATALANCAMENTO, '                                                                  + #13 +
  '  LIR.IDBENEFIRRF, '                                                                     + #13 +

  '  LIR.CODNATUREZA, LIR.CODIGOGPS, '                                                      + #13 +

  '  PES.TIPO, (''P'' || PES.TIPO) AS TIPO_PES, '                                           + #13 +
  '  PES.NOME '                                                                             + #13 +

  'FROM '                                                                                   + #13 +
  '  LANCIRRF  LIR, '                                                                       + #13 +
  '  PESSOA    PES, '                                                                       + #13 +
  '  DOCUMENTO DOC  '                                                                       + #13 +

  'WHERE '                                                                                  + #13 +
  '      LIR.DATALANCAMENTO                    BETWEEN ' + sDataIni + ' AND ' + sDataFim    + #13 +
  '  AND NVL(LIR.IDMODULORESPON, LIR.IDMODULO) = 3 '                                        + #13 +
  '  AND ROUND(LIR.VLRISS, 2)                 <> 0 '                                        + #13 +
  '  AND NVL(LIR.IDDOCISS, 0)                  = 0 '                                        + #13;

  if pbPF xor pbPJ then
  begin
    if pbPF then sSQL := sSQL +
  '  AND PES.TIPO                             = ''F'' '                                     + #13;
    if pbPJ then sSQL := sSQL +
  '  AND PES.TIPO                             = ''J'' '                                     + #13;
  end;

  sSQL := sSQL +
  '  AND LIR.IDBENEFIRRF                       = PES.IDPESSOA '                             + #13 +
  '  AND LIR.CODDOCUMENTO                      = DOC.CODDOCUMENTO '                         + #13 +

  'GROUP BY '                                                                               + #13 +
  '  LIR.CODDOCUMENTO, DOC.NODOCUMENTO, '                                                   + #13 +
  '  LIR.DATALANCAMENTO, '                                                                  + #13 +
  '  LIR.CODNATUREZA, LIR.CODIGOGPS, '                                                      + #13 +
  '  LIR.IDBENEFIRRF, PES.TIPO, PES.NOME '                                                  + #13;

  sSQL := sSQL +
  'ORDER BY '                                                                               + #13;

  case piOrdenacao of
    0:  sSQL := sSQL + 'LIR.CODDOCUMENTO, LIR.DATALANCAMENTO ';
    1:  sSQL := sSQL + 'LIR.DATALANCAMENTO, LIR.IDBENEFIRRF, LIR.CODDOCUMENTO ';
    2:  sSQL := sSQL + 'LIR.IDBENEFIRRF, LIR.DATALANCAMENTO, LIR.CODDOCUMENTO ';
    3:  sSQL := sSQL + 'PES.TIPO, LIR.IDBENEFIRRF, LIR.DATALANCAMENTO, LIR.CODDOCUMENTO ';
  end;

  Result := GetdataPacket(sSQL);
end;



// -------------------------------------------------------------------------------------------------

procedure TCtrlGeraDARM.SetcdsDocISS(const Value: TCMClientDataSet);
begin
  FcdsDocISS := Value;
end;

procedure TCtrlGeraDARM.SetCdsLancIRRF(const Value: TCMClientDataSet);
begin
  FcdsLancIRRF := Value;
end;

procedure TCtrlGeraDARM.SetCdsAlteradores(const Value: TCMClientDataSet);
begin
  FcdsAlteradores := Value;
end;

procedure TCtrlGeraDARM.SetCdsDocLancIRRF(const Value: TCMClientDataSet);
begin
  FcdsDocLancIRRF := Value;
end;

// -------------------------------------------------------------------------------------------------



end.
