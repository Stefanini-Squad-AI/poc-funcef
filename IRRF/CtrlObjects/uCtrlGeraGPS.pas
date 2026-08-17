unit uCtrlGeraGPS;

// Alterações:
{ ---------------------------------------------------------------------------------------------------
N. Chamado....: WO15127
Dt Alterações.: 12/12/2024
Responsável...: Paulo Nobre
Descrição.....: Descomentado a condição que impede de trazer 
                o movimento caso já tenha sido gerado o GPS.
-----------------------------------------------------------------------------------------------------
N. Chamado....: WO13769
Dt Alterações.: 30/08/2024
Responsável...: Paulo Nobre
Descrição.....: Ajustado o SQL da função "ListDocPendentes" para quando for uma pessoa "F" ele não
                sumarizar o valor base, caso contrario, como pessoa "J" ele sumariza. Este efeito só
                tem importância na apresentação na grid. Para a geração da GPS, função "GeraGPS" ele
                usa a função "ListLancPendentes" que carrega o cdsLancIRRF analiticamente e processa
                com outras regras.
-----------------------------------------------------------------------------------------------------
Rotina    : BuscaGuia
Data      : 11/12/2007
Autor     : Bruno Bastos
Pendencia : 27055
Descrição : Trazer na query os campos COMPETENCIA, IDBENEFINSS e FLGIMPRESSO para serem usados no
            caso de uma alteração de GPS.
----------------------------------------------------------------------------------------------------
Rotina    : GeraGuia
Data      : 13/08/2007
Autor     : Bruno Bastos
Pendencia : 26066
Descrição : Utilizar o código da gps para grupar a geração do documento e não tipo da pessoa.
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
Data      : 19/04/2007
Autor     : André Pontes
Pendencia : 22699 / 22657
Descrição : Alteração do critério de rateio, de PF/PJ para CódigoGPS
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
Rotina    :
Data      : 29/03/2007
Autor     : André Pontes
Pendencia : 22346
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 22/03/2007
Autor     : André Pontes
Pendencia : -
Descrição : Retirada da ListTipoDoc (passou a ser usada a da uCtrlUtil, para evitar duplicação)
            Retirada da ListFormaPagamento (passou a ser usada a da uCtrlUtil, para evitar duplicação)
            Retirada da ListDesembolso (passou a ser usada a da uCtrlUtil, para evitar duplicação)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 19/03/2007
Autor     : André Pontes
Pendencia : 22699
Descrição : Criação da função AlteraDocumento (replicação de parte da GravarDocumento da uCtrlDARF)
----------------------------------------------------------------------------------------------------
Rotina    : várias
Data      : até 16/03/2007
Autor     : André Pontes
Pendencia : 22699
Descrição : Alterações nas funções de gravação de GPS, para a tela de alteração manual de GPS
----------------------------------------------------------------------------------------------------
Rotina    : GeraGPS
Data      : 27/02/2007
Autor     : André Pontes
Pendencia : 24490
Descrição : Corrigida atribuição da variável do critério de agrupamento
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 26/02/2007 a 27/02/2007
Autor     : André Pontes
Pendencia : -
Descrição : Arrumação geral no código, segundo padronização vigente
---------------------------------------------------------------------------------------------------}

interface


uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
  uCtrlParamIntegra, uCMMath, uCMFileUtils, ShellAPI, Windows, Classes, Forms, uDBDocINSS,
  uCtrlDARF, uCtrlDocumento, uCtrlSegregacao, uCtrlUtil,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


  Type
    TCtrlGeraGPS = class(TCmControlObject)

    private

      CtrlSegregacao    : TCtrlSegregacao;
      Documento         : TCtrlDocumento;
      CtrlDARF          : TCtrlDARF;
      CtrlUtil          : TCtrlUtil;
      DBDocINSS         : TDBDocINSS;

      cdsDocumento      : TCMClientDataSet;
      cdsLancamentos    : TCMClientDataSet;
      cdsRateio         : TCMClientDataSet;
      cdsCCBaixasxDocum : TCMClientDataSet;
      cdsDoc            : TCMClientDataSet;
      cdsRat            : TCMClientDataSet;
      cdsLancInsert     : TCMClientDataSet;
      cdsAtuLancIRRF    : TCMClientDataSet;

      FcdsLancIRRF      : TCMClientDataSet;
      FcdsDocINSS       : TCMClientDataSet;

      FCodGeradorINSS   : Integer;
      FcdsAlteradores   : TCMClientDataSet;
      FcdsDocLancIRRF   : TCMClientDataSet;

      procedure SetCdsLancIRRF(const Value: TCMClientDataSet);
      procedure SetcdsDocINSS(const Value: TCMClientDataSet);
      procedure SetCdsAlteradores(const Value: TCMClientDataSet);

      procedure SetCodGeradorINSS(const Value: Integer);
      procedure SetCdsDocLancIRRF(const Value: TCMClientDataSet);


    protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


    public

      constructor Create; override;
      destructor Destroy; override;

      property cdsDocLancIRRF : TCMClientDataSet  read FcdsDocLancIRRF  write SetCdsDocLancIRRF;
      property cdsLancIRRF    : TCMClientDataSet  read FcdsLancIRRF     write SetCdsLancIRRF;
      property cdsDocINSS     : TCMClientDataSet  read FcdsDocINSS      write SetCdsDocINSS;
      property cdsAlteradores : TCMClientDataSet  read FcdsAlteradores  write SetCdsAlteradores;

      property CodGeradorINSS : Integer           read FCodGeradorINSS  write SetCodGeradorINSS;


      // -------------------------------------------------------------------------------------------
      // Lookups
      // -------------------------------------------------------------------------------------------

      function BuscaGuia(piCodDocumento, pIDDocINSS: Integer): OleVariant;

      function AlteraGuia: Boolean;

      function ExcluiGuia(const pIDDocINSS: Integer): Boolean;

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

      function AtualizaDocInss(pIDDocINSS : Integer; CodDocumento : Integer = 0): Boolean;

      function AtualizaLanc(pIDDocINSS, piCodDocumento: Integer; cOperacao : Char = 'I'): Boolean;

      function PreencheDocINSSnaLancIRRF(const pIDLancIRRF  : Integer;
                                         const pIDDocINSS   : Integer
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

      function  AlteraDocumento(const DataDocumento       : OleVariant;
                                const DataLancamentos     : OleVariant;
                                const DataRateios         : OleVariant;
                                const DataCCBaixasxDocum  : OleVariant;
                                const EspAcesso           : Integer;
                                const IdUsuario           : Integer
                               ): Boolean;

      // -------------------------------------------------------------------------------------------

      function  LancaAlterador(const pIDUsuario       : Integer;
                               const pIDEmpresa       : Integer;
                               const pIDModulo        : Integer;
                               const pIDPlanoConta    : Integer;
                               const EspAcesso        : Integer;
                               const pbUsaPlanoPatro  : Boolean;
                               const pbPartidaDobrada : Boolean
                              ): Integer;

      function  ExcluiAlterador(const pCodDocumento    : Integer;
                                const pNumLancto       : Integer;
                                const pIDModulo        : Integer;
                                const EspAcesso        : Integer;
                                const pIDUsuario       : Integer;
                                const pbUsaPlanoPatro  : Boolean;
                                const pbPartidaDobrada : Boolean
                               ): Boolean;

      // -------------------------------------------------------------------------------------------

    end;



implementation
{ TCtrlGeraGPS }



// -------------------------------------------------------------------------------------------------
// Create / Initializa / Destroy
// -------------------------------------------------------------------------------------------------

constructor TCtrlGeraGPS.Create;
begin
  inherited;

  cdsDocumento      := TCMClientDataSet.Create(nil);
  cdsLancamentos    := TCMClientDataSet.Create(nil);
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
  Documento         := TCtrlDocumento.Create;

  DBDocINSS         := TDBDocINSS.Create(Self);
end;



destructor TCtrlGeraGPS.Destroy;
begin
  DBDocINSS.Free;
  CtrlDARF.Free;
  CtrlUtil.Free;
  Documento.Free;

  cdsDocumento.Free;
  cdsLancamentos.Free;
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



procedure TCtrlGeraGPS.DoChangeDataBase;
begin
  inherited;
  DBDocINSS.DataBaseName := DataBaseName;
end;



procedure TCtrlGeraGPS.AfterInitialize;
begin
  inherited;

  CtrlDARF.InitializeAs(Self);
  CtrlUtil.InitializeAs(Self);
  Documento.InitializeAs(Self);

  CtrlDARF.OpenTransaction  := False;
  Documento.OpenTransaction := False;
end;

// -------------------------------------------------------------------------------------------------
// FIM Create / Initializa / Destroy
// -------------------------------------------------------------------------------------------------



// -------------------------------------------------------------------------------------------------
// Gravação das chaves estrangeiras
// -------------------------------------------------------------------------------------------------

function TCtrlGeraGPS.AtualizaDocInss(pIDDocINSS : Integer; CodDocumento : Integer = 0): Boolean;
var
  sSQL : string;
begin
  Result := True;

  if CodDocumento = 0 then
  begin
   sSQL := 'UPDATE DOCINSS SET CODDOCINSS = NULL WHERE IDDOCINSS = ' + IntToStr(pIDDocINSS);

    if not(ExecSQL(sSQL)) then Result := False;
  end
  else  // if CodDocumento = 0
  begin
    sSQL := 'UPDATE DOCINSS SET CODDOCINSS = ' + IntToStr(CodDocumento) + ' WHERE IDDOCINSS = ' + IntToStr(pIDDocINSS);

    if not(ExecSQL(sSQL)) then Result := False;
  end;  // if CodDocumento = 0
end;



function TCtrlGeraGPS.AtualizaLanc(pIDDocINSS, piCodDocumento: Integer; cOperacao : Char = 'I'): Boolean;
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
      '  IDDOCINSS        = ' + IntToStr(pIDDocINSS)        + #13 +
      'WHERE '                                              + #13 +
      '      CODDOCUMENTO = ' + IntToStr(piCodDocumento)    + #13 +
      '  AND VLRINSS      > 0 ';
    end
    else
    begin
      sSQL :=
      'UPDATE '             + #13 +
      '  LANCIRRF '         + #13 +
      'SET '                + #13 +
      '  IDDOCINSS = NULL ' + #13 +
      'WHERE '              + #13 +
      '  IDDOCINSS = '      + IntToStr(pIDDocINSS);
    end;

    ExecSQL(sSQL);
    Result := True;
  except
    on E:Exception do
    begin
      Rollback;
      Result      := False;
      MessageInfo := 'Erro ao atualizar o lançamento de INSS'
    end;
  end;
end;



function TCtrlGeraGPS.PreencheDocINSSnaLancIRRF(const pIDLancIRRF  : Integer;
                                                const pIDDocINSS   : Integer
                                               ): Boolean;
var
  sSQL : string;
begin
  Result := True;

  sSQL :=
  'UPDATE LANCIRRF '                                        + #13 +
  'SET    IDDOCINSS   = ' + FormatFloat('#0', pIDDocINSS)   + #13 +
  'WHERE  IDLANCIRRF  = ' + FormatFloat('#0', pIDLancIRRF);

  if not(ExecSQL(sSQL, True)) then Result := False;
end;

// -------------------------------------------------------------------------------------------------
// FIM Gravação das chaves estrangeiras
// -------------------------------------------------------------------------------------------------



function TCtrlGeraGPS.BuscaGuia(piCodDocumento, pIDDocINSS: Integer): OleVariant;
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

  '  PES.NOME,          PES.IDPESSOA,     BEN.NOME AS BENEF, '          + #13 +

  '  DIN.CODIGOPGTO,    DIN.CODDOCINSS, '                               + #13 +
  '  DIN.IDDOCINSS,     DIN.VLRJUROS,     DIN.VLRINSS, '                + #13 +
  '  DIN.VLRMULTA,      DIN.VLRDESCONTO,  DIN.VLRTOTAL, '               + #13 +
  '  DIN.NUMLANCJUROS,  DIN.NUMLANCMULTA, DIN.NUMLANCDESCONTO, '        + #13 +

  //CPREV - Pend. 27055
  '  DIN.FLGIMPRESSO,   DIN.IDBENEFINSS,  DIN.COMPETENCIA '             + #13 +

  'FROM '                                                               + #13 +
  '  DOCUMENTO   DOC, '                                                 + #13 +
  '  PESSOA      PES, '                                                 + #13 +
  '  PESSOA      BEN, '                                                 + #13 +
  '  DOCINSS     DIN  '                                                 + #13 +

  'WHERE '                                                              + #13 +
  '      DOC.CODDOCUMENTO  = DIN.CODDOCINSS '                           + #13 +
  '  AND DOC.IDFORCLI      = PES.IDPESSOA '                             + #13 +
  '  AND DIN.IDBENEFINSS   = BEN.IDPESSOA(+) '                          + #13 +
  '  AND DIN.CODDOCINSS    = ' + IntToStr(piCodDocumento)               + #13 +
  '  AND DIN.IDDOCINSS     = ' + IntToStr(pIDDocINSS);

  Result := GetDataPacket(sSQL);
end;



function TCtrlGeraGPS.AlteraGuia: Boolean;
begin
  try
    Result := ApplyCds(FcdsDocINSS, DBDocINSS, [], []);
    
    if not(Result) then raise Exception.Create(DBDocINSS.MessageInfo);
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;



function TCtrlGeraGPS.ExcluiGuia(const pIDDocINSS: Integer): Boolean;
var
  sSQL : string;
begin
  sSQL := 'DELETE FROM DOCINSS WHERE IDDOCINSS = ' + FormatFloat('#0', pIDDocINSS);

  if ExecSQL(sSQL, True) then
  begin
    Result := True;
  end
  else
  begin
    Result      := False;
    MessageInfo := 'Erro ao excluir DocINSS.';
  end;
end;



function TCtrlGeraGPS.GeraGuia(const pIDPessoa       : Integer;
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

      if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('CODIGOGPS').AsString = '2100') then sCondForn := '0';

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

      sCondAnt  := sCondAtu;
      sDataLanc := cdsLancIRRF.FieldByName('DATALANCTO').AsString;
      sContaC   := cdsLancIRRF.FieldByName('PLACONTA').AsString;
      fValor    := 0;

      while not(cdsLancIRRF.EOF) and (sCondAnt = sCondAtu) do
      begin
        if cdsLancIRRF.FieldByName('FLAG').AsString = 'S' then
        begin
          // Beneficiário da GPS (se for pessoa física, usar a própria Fundação)
          IDBenefGuia     := cdsLancIRRF.FieldByName('IDFORCLI').AsInteger;
          if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('CODIGOGPS').AsString = '2100') then IDBenefGuia := pIDPessoa;

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

        if (piAgrupamento = 3) and (cdsLancIRRF.FieldByName('CODIGOGPS').AsString = '2100') then sCondForn := '0'; 

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



function TCtrlGeraGPS.GravaCAP(const prTotalRateio   : Currency;
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
  iCodForn      : Integer;
  iNumLancto    : Integer;
  PlnCodigo     : Integer;
  iCodForma     : Integer;
  sValor        : string;
  sSQL          : string;
  fTotValorRat  : Currency;
  iTotRecRateio : Integer;
begin
  Result := True;

  cdsDoc.Data         := CtrlDARF.ProcurarDocumento(-1);
  cdsLancInsert.Data  := CtrlDARF.ProcurarLancamentos(-1);
  cdsRat.Data         := CtrlDARF.ProcurarRateio(-1);
  iCodForma           := piFormaPagto;

  // inserir na tabela documento
  cdsDoc.Insert;
  cdsDoc.FieldByName('IDMODULO').AsInteger            := pIDModulo;

  //verifica se o sistema é integrado com a contabilidade.
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
  cdsLancInsert.FieldByName('HISTORICOCOMPL').AsString     := 'INSS';
  cdsLancInsert.FieldByName('IDUSUARIOINCLUSAO').AsInteger := pIDUsuario;
  cdsLancInsert.Post;

  fTotValorRat := 0;
  iTotRecRateio:= 1;

  cdsRateio.First;
  while not(cdsRateio.EOF) do
  begin
    // -------------------------------------------------------------------------------------------
    // inserir rateio

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
  //insere o documento na DocINSS como não impresso

  DBDocINSS.CodigoPgto.AsInteger  := piCodGuia;
  DBDocINSS.CodDocINSS.AsInteger  := Trunc(CtrlDARF.CodDocumento);
  DBDocINSS.Competencia.AsString  := psCompetencia; 
  DBDocINSS.FlgImpresso.AsString  := 'N';
  DBDocINSS.DataVencto.AsDateTime := pdDataVenc;
  DBDocINSS.VlrTotal.AsFloat      := pfValor;
  DBDocINSS.VlrINSS.AsFloat       := pfValor;

  DBDocINSS.IDBenefINSS.AsFloat   := piBeneficiario;

  if not(DBDocINSS.Insert) then
  begin
    Result := False;
    MessageInfo := 'Erro ao inserir na tabela DOCINSS';
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  cdsAtuLancIRRF.First;
  while not(cdsAtuLancIRRF.EOF) do
  begin
    if not(PreencheDocINSSnaLancIRRF(cdsAtuLancIRRF.FieldByName('IDLANCIRRF').AsInteger,
                                     DBDocINSS.IDDocINSS.AsInteger
                                    )) then
    begin
      Result := False;
      MessageInfo := 'Erro ao atualizar o código do documento de INSS na tabela LancIRRF';
      Exit;
    end;

    cdsAtuLancIRRF.Next;
  end;

  // -----------------------------------------------------------------------------------------------
end;



procedure TCtrlGeraGPS.GravaRateio(const piUnidNegoc       : Integer;
                                   const piIDPlanoPrev     : Integer;
                                   const piIDPatro         : Integer;
                                   const piIDPrograma      : Integer;
                                   const psCodCentroCusto  : string;
                                   const psCodCentroRespon : string;
                                   const psCodTipRecDes    : string;
                                   const prValor           : Double
                                  );
begin
  if cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODCENTRORESPON;IDPROGRAMA;UNIDNEGOC',
                      VarArrayOf([piIDPatro, piIDPlanoPrev, psCodCentroCusto, psCodCentroRespon, piIDPrograma, piUnidNegoc]),
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



procedure TCtrlGeraGPS.GravaCCBaixasxDocum(const piIDPlanoPrev   : Integer;
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



function TCtrlGeraGPS.ListLancPendentes(const pdDataIni    : TDateTime;
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
  '  L.IDLANCIRRF, L.VLRBASE, L.VLRINSS AS VALOR, '                                     + #13 +
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
  '      L.DATALANCAMENTO                   BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13 +
  '  AND NVL(L.IDMODULORESPON, L.IDMODULO)  = 3 '                                       + #13 +
  '  AND L.CODDOCUMENTO                     IS NOT NULL '                               + #13 +
  '  AND L.IDBENEFIRRF                      = P.IDPESSOA '                              + #13 +
  '  AND ROUND(L.VLRINSS, 2)               <> 0 '                                       + #13 +
  '  AND NVL(L.IDDOCINSS, 0)                = 0 '                                       + #13 +
  '  AND NVL(L.CODIGOGPS, 0)               <> 0 '                                       + #13;

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
    3:  sSQL := sSQL + 'L.CODIGOGPS, P.TIPO, L.IDBENEFIRRF ';
  end;

  Result := GetdataPacket(sSQL);
end;

// Paulo Nobre - WO13769 - Inicio

{function TCtrlGeraGPS.ListDocPendentes(const pdDataIni    : TDateTime;
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
  '  SUM(LIR.VLRBASE) AS VLRBASE, '                                                         + #13 +
  '  SUM(LIR.VLRINSS) AS VALOR, '                                                           + #13 +
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
  '  AND ROUND(LIR.VLRINSS, 2)                <> 0 '                                        + #13 +
  '  AND NVL(LIR.IDDOCINSS, 0)                 = 0 '                                        + #13 +
  '  AND NVL(LIR.CODIGOGPS, 0)                <> 0 '                                        + #13;

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
  '  LIR.CODDOCUMENTO,'                                                                     + #13 +
  '  DOC.NODOCUMENTO, '                                                                     + #13 +
  '  LIR.DATALANCAMENTO, '                                                                  + #13 +
  '  LIR.CODNATUREZA, '                                                                     + #13 +
  '  LIR.CODIGOGPS, '                                                                       + #13 +
  '  LIR.IDBENEFIRRF,'                                                                      + #13 +
  '  PES.TIPO, '                                                                            + #13 +
  '  PES.NOME '                                                                             + #13;

  sSQL := sSQL +
  'ORDER BY '                                                                               + #13;

  case piOrdenacao of
    0:  sSQL := sSQL + 'LIR.CODDOCUMENTO, LIR.DATALANCAMENTO ';
    1:  sSQL := sSQL + 'LIR.DATALANCAMENTO, LIR.IDBENEFIRRF, LIR.CODDOCUMENTO ';
    2:  sSQL := sSQL + 'LIR.IDBENEFIRRF, LIR.DATALANCAMENTO, LIR.CODDOCUMENTO ';
    3:  sSQL := sSQL + 'PES.TIPO, LIR.IDBENEFIRRF, LIR.DATALANCAMENTO, LIR.CODDOCUMENTO ';
  end;

  Result := GetdataPacket(sSQL);
end;        }

function TCtrlGeraGPS.ListDocPendentes(const pdDataIni    : TDateTime;
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
  'SELECT * FROM ( '                                                                          + #13;

  // Paulo Nobre - WO15127 - Inicio
  if (pbPF) then
  begin
    sSQL := sSQL + 'SELECT '                                                                  + #13 +
    '  ''S'' AS FLAG, '                                                                       + #13 +
    '  PES.TIPO, '                                                                            + #13 +
    '  (''P'' || PES.TIPO) AS TIPO_PES, '                                                     + #13 +
    '  PES.NOME, '                                                                            + #13 +
    '  LIR.VLRBASE, '                                                                         + #13 +
    '  SUM(LIR.VLRINSS) AS VALOR, '                                                           + #13 +
    '  LIR.CODDOCUMENTO, '                                                                    + #13 +
    '  DOC.NODOCUMENTO, '                                                                     + #13 +
    '  LIR.DATALANCAMENTO, '                                                                  + #13 +
    '  LIR.IDBENEFIRRF, '                                                                     + #13 +
    '  LIR.CODNATUREZA, '                                                                     + #13 +
    '  LIR.CODIGOGPS '                                                                        + #13 +
    'FROM '                                                                                   + #13 +
    '  LANCIRRF  LIR, '                                                                       + #13 +
    '  PESSOA    PES, '                                                                       + #13 +
    '  DOCUMENTO DOC  '                                                                       + #13 +
    'WHERE '                                                                                  + #13 +
    '      LIR.IDBENEFIRRF                       = PES.IDPESSOA '                             + #13 +
    '  AND LIR.CODDOCUMENTO                      = DOC.CODDOCUMENTO '                         + #13 +
    '  AND LIR.DATALANCAMENTO                    BETWEEN ' + sDataIni + ' AND ' + sDataFim    + #13 +
    '  AND NVL(LIR.IDMODULORESPON, LIR.IDMODULO) = 3 '                                        + #13 +    // Contas a Pagar
    '  AND ROUND(LIR.VLRINSS, 2)                <> 0 '                                        + #13 +
    '  AND NVL(LIR.IDDOCINSS, 0)                 = 0 '                                        + #13 +    // Paulo Nobre - WO15127
    '  AND NVL(LIR.CODIGOGPS, 0)                <> 0 '                                        + #13 +
    '  AND PES.TIPO                              = ''F'' '                                    + #13 +   // Pessoa Fisica
    'GROUP BY '                                                                               + #13 +
    '  PES.TIPO, '                                                                            + #13 +
    '  PES.NOME, '                                                                            + #13 +
    '  LIR.VLRBASE,'                                                                          + #13 +
    '  LIR.CODDOCUMENTO,'                                                                     + #13 +
    '  DOC.NODOCUMENTO, '                                                                     + #13 +
    '  LIR.DATALANCAMENTO, '                                                                  + #13 +
    '  LIR.CODNATUREZA, '                                                                     + #13 +
    '  LIR.CODIGOGPS, '                                                                       + #13 +
    '  LIR.IDBENEFIRRF'                                                                       + #13;
  end;

  if (pbPF and pbPJ) then
  begin
    sSQL := sSQL + '--    '                                                                   + #13;
    sSQL := sSQL +'UNION'                                                                     + #13;
    sSQL := sSQL + '--    '                                                                   + #13;
  end;

  if (pbPJ) Then
  begin
    sSQL := sSQL + 'SELECT '                                                                  + #13 +
    '  ''S'' AS FLAG, '                                                                       + #13 +
    '  PES.TIPO, '                                                                            + #13 +
    '  (''P'' || PES.TIPO) AS TIPO_PES, '                                                     + #13 +
    '  PES.NOME, '                                                                            + #13 +
    '  SUM(LIR.VLRBASE) AS VLRBASE, '                                                         + #13 +
    '  SUM(LIR.VLRINSS) AS VALOR, '                                                           + #13 +
    '  LIR.CODDOCUMENTO, '                                                                    + #13 +
    '  DOC.NODOCUMENTO, '                                                                     + #13 +
    '  LIR.DATALANCAMENTO, '                                                                  + #13 +
    '  LIR.IDBENEFIRRF, '                                                                     + #13 +
    '  LIR.CODNATUREZA, '                                                                     + #13 +
    '  LIR.CODIGOGPS '                                                                        + #13 +
    'FROM '                                                                                   + #13 +
    '  LANCIRRF  LIR, '                                                                       + #13 +
    '  PESSOA    PES, '                                                                       + #13 +
    '  DOCUMENTO DOC  '                                                                       + #13 +
    'WHERE '                                                                                  + #13 +
    '      LIR.IDBENEFIRRF                       = PES.IDPESSOA '                             + #13 +
    '  AND LIR.CODDOCUMENTO                      = DOC.CODDOCUMENTO '                         + #13 +
    '  AND LIR.DATALANCAMENTO                    BETWEEN ' + sDataIni + ' AND ' + sDataFim    + #13 +
    '  AND NVL(LIR.IDMODULORESPON, LIR.IDMODULO) = 3 '                                        + #13 +      // Contas a Pagar
    '  AND ROUND(LIR.VLRINSS, 2)                <> 0 '                                        + #13 +
    '  AND NVL(LIR.IDDOCINSS, 0)                 = 0 '                                        + #13 +      // Paulo Nobre - WO15127
    '  AND NVL(LIR.CODIGOGPS, 0)                <> 0 '                                        + #13 +
    '  AND PES.TIPO                              = ''J'' '                                    + #13 +      // Pessoa Juridica
    'GROUP BY '                                                                               + #13 +
    '  PES.TIPO, '                                                                            + #13 +
    '  PES.NOME, '                                                                            + #13 +
    '  LIR.CODDOCUMENTO,'                                                                     + #13 +
    '  DOC.NODOCUMENTO, '                                                                     + #13 +
    '  LIR.DATALANCAMENTO, '                                                                  + #13 +
    '  LIR.CODNATUREZA, '                                                                     + #13 +
    '  LIR.CODIGOGPS, '                                                                       + #13 +
    '  LIR.IDBENEFIRRF'                                                                       + #13;
  end;

  // Paulo Nobre - WO15127 - Fim

  sSQL := sSQL +'  ) '                                                                      + #13 +
  '    '                                                                                    + #13 +
  'ORDER BY '                                                                               + #13;

  case piOrdenacao of
    0:  sSQL := sSQL + 'CODDOCUMENTO, DATALANCAMENTO ';
    1:  sSQL := sSQL + 'DATALANCAMENTO, IDBENEFIRRF, CODDOCUMENTO ';
    2:  sSQL := sSQL + 'IDBENEFIRRF, DATALANCAMENTO, CODDOCUMENTO ';
    3:  sSQL := sSQL + 'TIPO, IDBENEFIRRF, DATALANCAMENTO, CODDOCUMENTO ';
  end;

  Result := GetdataPacket(sSQL);
end;
// Paulo Nobre - WO13769 - Fim

function TCtrlGeraGPS.AlteraDocumento(const DataDocumento       : OleVariant;
                                      const DataLancamentos     : OleVariant;
                                      const DataRateios         : OleVariant;
                                      const DataCCBaixasxDocum  : OleVariant;
                                      const EspAcesso           : Integer;
                                      const IdUsuario           : Integer
                                     ): Boolean;
var
  iNumdocumento       : Integer;
  iIdSegregaCriter    : Integer;
  sContaSegregaCriter : string;
  sUltConta           : string;
  iContConta          : Integer;
  iUltIdSegregaCriter : Integer;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.AlteraDocumento(DataDocumento,
                                                   DataLancamentos,
                                                   DataRateios,
                                                   DataCCBaixasxDocum,
                                                   EspAcesso,
                                                   IdUsuario
                                                  );
    if not(Result) then
    begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end
  else
  begin
    try
      Result := True;

      Documento.Prepare(OpDocumento, odlEfetivo);

      Documento.IdEspAcesso   := EspAcesso;
      Documento.IdUsuario     := IdUsuario;

      cdsDocumento.Data       := DataDocumento;
      cdsLancamentos.Data     := DataLancamentos;
      cdsRateio.Data          := DataRateios;
      cdsCCBaixasxDocum.Data  := DataCCBaixasxDocum;

      iIdSegregaCriter        := -1;
      iContConta              := 0;

      // -------------------------------------------------------------------------------------------
      // Alteração do Documento
      // -------------------------------------------------------------------------------------------

      // Preenche os campos do documento que serão alterados
      Documento.CodDocumento := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;

      Documento.SetValues(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                          cdsDocumento.FieldByName('NODOCUMENTO').AsInteger,
                          cdsDocumento.FieldByName('COMPLDOCUMENTO').AsString,
                          cdsDocumento.FieldByName('STATUS').AsString,
                          cdsDocumento.FieldByName('RECPAG').AsString,
                          cdsDocumento.FieldByName('OPERACAO').AsString,
                          cdsDocumento.FieldByName('NUMSLIP').AsString,
                          cdsDocumento.FieldByName('NUMLEITCODBARRAS').AsString,
                          cdsDocumento.FieldByName('PLACONTA').AsString,
                          cdsDocumento.FieldByName('CODCENTROCUSTO').AsString,
                          cdsDocumento.FieldByName('NOSSONUMERO').AsString,
                          cdsDocumento.FieldByName('NUMDIGCODBARRAS').AsString,
                          cdsDocumento.FieldByName('GRUPODOC').AsString,
                          '',
                          '',
                          cdsDocumento.FieldByName('EMISBLOQ').AsString,
                          cdsDocumento.FieldByName('REFERENCIA').AsString,
                          cdsDocumento.FieldByName('OBS').AsString,
                          cdsDocumento.FieldByName('DATAVENCTO').AsDateTime,
                          cdsDocumento.FieldByName('DATAEMISSAO').AsDateTime,
                          cdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime,
                          cdsDocumento.FieldByName('DATAREMESSA').AsDateTime,
                          cdsDocumento.FieldByName('DATALIMITE').AsDateTime,
                          cdsDocumento.FieldByName('DATACORRECAO').AsDateTime,
                          cdsDocumento.FieldByName('VLRMULTA').AsFloat,
                          cdsDocumento.FieldByName('VALORJUROS').AsFloat,
                          cdsDocumento.FieldByName('VALORDESCONTO').AsFloat,
                          cdsDocumento.FieldByName('PERCJUROSSIMPLES').AsFloat,
                          cdsDocumento.FieldByName('PERCJUROSATUARIAL').AsFloat,
                          cdsDocumento.FieldByName('CODTIPDOC').AsInteger,
                          cdsDocumento.FieldByName('IDPESSOA').AsInteger,
                          cdsDocumento.FieldByName('IDMODULO').AsInteger,
                          cdsDocumento.FieldByName('IDFORCLI').AsInteger,
                          cdsDocumento.FieldByName('NUMFATURA').AsInteger,
                          cdsDocumento.FieldByName('IDCBANCARIA').AsInteger,
                          cdsDocumento.FieldByName('UNIDNEGOC').AsInteger,
                          cdsDocumento.FieldByName('PLANO').AsInteger,
                          cdsDocumento.FieldByName('NUMCPBAIXA').AsInteger,
                          cdsDocumento.FieldByName('NUMAPGR').AsInteger,
                          cdsDocumento.FieldByName('MOECODIGO').AsInteger,
                          cdsDocumento.FieldByName('LOTETRANSMISSAO').AsInteger,
                          cdsDocumento.FieldByName('INDICECORRECAO').AsInteger,
                          cdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                          cdsDocumento.FieldByName('IDEMPRESA').AsInteger, 0,
                          cdsDocumento.FieldByName('CONTROLEREMESSA').AsInteger,
                          cdsDocumento.FieldByName('CODSUBCONTA').AsInteger,
                          cdsDocumento.FieldByName('CODPORTFORMA').AsInteger,
                          cdsDocumento.FieldByName('CODGRUPOCNAB').AsInteger,
                          cdsDocumento.FieldByName('CODGERADORINSS').AsInteger,
                          cdsDocumento.FieldByName('CODFORMA').AsInteger
                         );

      // -------------------------------------------------------------------------------------------

      // LanctoDocum
      cdsLancamentos.First;
      while not(cdsLancamentos.EOF) do
      begin
        if cdsLancamentos.FieldByName('OPERACAO').AsString = '2' then
        begin
          Documento.Lanctodocum.SetValues(CdsLancamentos.FieldByName('DATALANCTO').AsDateTime,
                                          cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger,
                                          cdsLancamentos.FieldByName('NUMLANCTO').AsInteger,
                                          cdsLancamentos.FieldByName('VLRLIQUIDO').AsFloat,
                                          cdsLancamentos.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                          cdsLancamentos.FieldByName('VALOR').AsFloat,
                                          cdsLancamentos.FieldByName('UNIDNEGOC').AsInteger,
                                          cdsLancamentos.FieldByName('PLNCODIGO').AsInteger,
                                          cdsLancamentos.FieldByName('NUMLOTEMANUAL').AsInteger,
                                          cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                          cdsLancamentos.FieldByName('IDPESSOA').AsInteger,
                                          0,
                                          cdsLancamentos.FieldByName('ESTORNO').AsInteger,
                                          cdsLancamentos.FieldByName('CODTIPDOC').AsInteger,
                                          cdsLancamentos.FieldByName('CODDOCINSS').AsInteger,
                                          cdsLancamentos.FieldByName('CODALTERADOR').AsInteger,
                                          cdsLancamentos.FieldByName('OPERACAO').AsString,
                                          cdsLancamentos.FieldByName('NUMRECIBO').AsString,
                                          cdsLancamentos.FieldByName('NUMNF').AsString,
                                          cdsLancamentos.FieldByName('NUMFATURA').AsString,
                                          cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString,
                                          '',
                                          '',
                                          '',
                                          cdsLancamentos.FieldByName('DEBCRE').AsString,
                                          cdsDocumento.FieldByName('IDMODULO').AsInteger,
                                          cdsDocumento.FieldByName('PLANO').AsInteger,
                                          Sistema.UsaPlanoPatro
                                         );
        end;
        cdsLancamentos.Next;
      end;

      // -------------------------------------------------------------------------------------------

      // RateioDocum
      if not(cdsRateio.IsEmpty) then cdsRateio.First;
      while not(cdsRateio.EOF) do
      begin
        Documento.Rateiodocum.SetValues(cdsRateio.FieldByName('VALOR').AsFloat, cdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                        cdsRateio.FieldByName('VLRRESORCAMEN').AsFloat, cdsRateio.FieldByName('idrateiodocum').AsInteger, cdsRateio.FieldByName('IDPESSOA').AsInteger,
                                        cdsRateio.FieldByName('CODDOCUMENTO').AsInteger, cdsRateio.FieldByName('UNIDNEGOC').AsInteger, cdsRateio.FieldByName('MOECODIGO').AsInteger,
                                        cdsRateio.FieldByName('IDUSUARIOINCLUSAO').AsInteger, cdsRateio.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                        cdsRateio.FieldByName('PLANO').AsInteger, cdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                                        cdsRateio.FieldByName('IDPATRO').AsInteger, cdsRateio.FieldByName('IDPROGRAMA').AsInteger,
                                        cdsRateio.FieldByName('IDPROCESSO').AsInteger, cdsRateio.FieldByName('IDPESSOA').AsInteger,
                                        cdsRateio.FieldByName('CODTIPRECDES').AsString, cdsRateio.FieldByName('RECPAG').AsString,
                                        cdsRateio.FieldByName('CODCENTRORESPON').AsString, cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                        cdsRateio.FieldByName('NUMIMOVEL').AsString
                                       );
        cdsRateio.Next;
      end;  // while not(cdsRateio.EOF)

      // -------------------------------------------------------------------------------------------

      // CCBaixasXDocum
      cdsCCBaixasxDocum.First;
      while not(cdsCCBaixasxDocum.EOF) do
      begin
        Documento.CCBAIXASXDOCUM.SetValues(cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat,
                                           0,
                                           cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger,
                                           iNumDocumento,
                                           cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsInteger,
                                           cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger,
                                           cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger,
                                           cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger,
                                           iIDSegregaCriter,
                                           cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString);
        cdsCCBaixasxDocum.Next;
      end;

      // -------------------------------------------------------------------------------------------

      if not(Documento.Update) then
      begin
        Result      := False;
        MessageInfo := Documento.MessageInfo;
      end
      else  // if not(Documento.Update)
      begin
        Result      := True;
      end;  // if not(Documento.Update)

      // -------------------------------------------------------------------------------------------
      // FIM Alteração do Documento
      // -------------------------------------------------------------------------------------------

    except
      MessageInfo := Documento.MessageInfo;
      Result      := False;
    end;
  end;
end;



function TCtrlGeraGPS.LancaAlterador(const pIDUsuario       : Integer;
                                     const pIDEmpresa       : Integer;
                                     const pIDModulo        : Integer;
                                     const pIDPlanoConta    : Integer;
                                     const EspAcesso        : Integer;
                                     const pbUsaPlanoPatro  : Boolean;
                                     const pbPartidaDobrada : Boolean
                                    ): Integer;
var
  bErro : Boolean;
begin
  Documento.Prepare(OpLanctoDocum, odlAlterador);

  Documento.IDEspAcesso     := EspAcesso;
  Documento.IDUsuario       := PIDUsuario;
  Documento.PartidaDobrada  := pbPartidaDobrada;

  Documento.Lanctodocum.SetValues(cdsAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                  cdsAlteradores.FieldByName('CODDOCUMENTO').AsInteger,
                                  0,
                                  cdsAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                  cdsAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                  cdsAlteradores.FieldByName('VALOR').AsFloat,
                                  cdsAlteradores.FieldByName('UNIDNEGOC').AsInteger,
                                  cdsAlteradores.FieldByName('PLNCODIGO').AsInteger,
                                  0,
                                  pIDUsuario,
                                  pIDEmpresa,
                                  0,
                                  cdsAlteradores.FieldByName('ESTORNO').AsInteger,
                                  0,
                                  0,
                                  cdsAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                  '4',
                                  '',
                                  '',
                                  '',
                                  cdsAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                  '',
                                  '',
                                  '',
                                  cdsAlteradores.FieldByName('DEBCRE').AsString,
                                  pIDModulo,
                                  PIDPlanoConta,
                                  pbUsaPlanoPatro,
                                  True
                                 );

  bErro := not(Documento.Insert);

  if bErro then
  begin
    Result := -1;
  end
  else
  begin
    Result := Documento.Lanctodocum.NumLancto;
  end;
end;



function TCtrlGeraGPS.ExcluiAlterador(const pCodDocumento    : Integer;
                                      const pNumLancto       : Integer;
                                      const pIDModulo        : Integer;
                                      const EspAcesso        : Integer;
                                      const pIDUsuario       : Integer;
                                      const pbUsaPlanoPatro  : Boolean;
                                      const pbPartidaDobrada : Boolean
                                     ): Boolean;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.ExcluiAlterador(pCodDocumento,
                                                   pNumLancto,
                                                   pIDModulo,
                                                   EspAcesso,
                                                   pIDUsuario,
                                                   pbUsaPlanoPatro,
                                                   pbPartidaDobrada
                                                  );
    if not(Result) then
    begin
      MessageInfo := Connection.AppServer.MessageInfo;
    end;
  end
  else
  begin
    try
      // -------------------------------------------------------------------------------------------

      Documento.Prepare(OpLanctoDocum, odlAlterador);

      Documento.IdEspAcesso     := EspAcesso;
      Documento.IdUsuario       := pIDUsuario;
      Documento.PartidaDobrada  := pbPartidaDobrada;
      Documento.UsaPlanoPatro   := pbUsaPlanoPatro;
      Documento.IDModulo        := pIDModulo;

      Documento.CodDocumento    := pCodDocumento;

      Documento.LanctoDocum.CodDocumento  := pCodDocumento;
      Documento.LanctoDocum.NumLancto     := pNumLancto;
      Documento.LanctoDocum.IDModulo      := pIDModulo;

      // -------------------------------------------------------------------------------------------

      if not(Documento.Delete) then
      begin
        Result := False;
        MessageInfo := Documento.MessageInfo;
      end
      else  // if not(Documento.Update)
      begin
        Result := True;
      end;  // if not(Documento.Update)

      // -------------------------------------------------------------------------------------------

    except
      MessageInfo := Documento.MessageInfo;
      Result := False;
    end;
  end;
end;



// -------------------------------------------------------------------------------------------------

procedure TCtrlGeraGPS.SetcdsDocINSS(const Value: TCMClientDataSet);
begin
  FcdsDocINSS := Value;
end;

procedure TCtrlGeraGPS.SetCdsLancIRRF(const Value: TCMClientDataSet);
begin
  FcdsLancIRRF := Value;
end;

procedure TCtrlGeraGPS.SetCodGeradorINSS(const Value: Integer);
begin
  FCodGeradorINSS := Value;
end;

procedure TCtrlGeraGPS.SetCdsAlteradores(const Value: TCMClientDataSet);
begin
  FcdsAlteradores := Value;
end;

procedure TCtrlGeraGPS.SetCdsDocLancIRRF(const Value: TCMClientDataSet);
begin
  FcdsDocLancIRRF := Value;
end;

// -------------------------------------------------------------------------------------------------



end.
