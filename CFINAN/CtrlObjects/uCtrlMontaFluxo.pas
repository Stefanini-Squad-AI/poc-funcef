unit uCtrlMontaFluxo;

{-------------------------------------------------------------------------------
Rotina......: MontaConsultaPeriodos, GetSqlFluxoPrevisto, GetSqlFluxoReal
Nº SIG......: 96575
Data........: 23/07/2021
Responsável.: Cássio Florencio Rovaroto
Decrição....: Inclusão de parâmetro para verificação de fluxo de caixa anual. 
--------------------------------------------------------------------------------
Nº SIG......: 46608/88515
Data........: 08/07/2019
Responsável.: Everson Cunha
Descrição...: Inclusão de coluna com totalizador por linha
--------------------------------------------------------------------------------
Rotina......: MontaConsultaDadosFluxo
Nº SIG......: 88013
Data........: 03/07/2019
Responsável.: Darivaldo Alencar
Descrição...: Colunas invertidas devido ordenação do tíbero
--------------------------------------------------------------------------------
Rotina......: MontaConsultaDadosFluxo
Nº SIG......: 87164
Data........: 10/06/2019
Responsável.: Darivaldo Alencar
Descrição...: Colunas com valores incorretos
--------------------------------------------------------------------------------
Rotina......: MontaConsultaPeriodos
Nº SIG......: 80692
Data........: 14/01/2018
Responsável.: Everson Cunha
Descrição...: Aleração na query devido a problemas com a ordenação no TIBERO
--------------------------------------------------------------------------------
Rotina......: TParamRel = record (adicionado parametro), GetSqlFluxoPrevisto,
              MontaConsultaPrevCompara
Nº SIG......: 22407
Data........: 15/09/2016
Responsável.: William Santana
Descrição...: Implementação de exibição sintética do relatório comparativo
--------------------------------------------------------------------------------
Rotina: GetDocumentosCompara
SIG: 21842
Data: 06/06/2016
Responsável: Peterson Victor
Descrição: Alteração da query
--------------------------------------------------------------------------------
Rotina......: GetDocumentosCompara
Nº SOL......: 270229
Nº PPM......: 1377167
Data........: 15/04/2016
Responsável.: Peterson Victor
Descrição...: desconsiderar as baixas sem financeiro
--------------------------------------------------------------------------------
Rotina......: GetSqlFluxoPrevisto
Nº SOL......: 269329
Nº PPM......: 1298760
Data........: 24/02/2016
Responsável.: Peterson Victor
Descrição...: Alterado a Query para atender o filtro diretoria que não estava
              filtrando corretamente
--------------------------------------------------------------------------------
Rotina......: MontaConsultaRealCompara
Nº SOL......: 266236
Nº PPM......: 1210745
Data........: 22/12/2015
Responsável.: Fernando Xavier
Descrição...: O Relatório comparativo exibe as informações de acordo com a data
              de lançamento quando deveria ser data de disponibilidade.
--------------------------------------------------------------------------------
Rotina......: MontaConsultaDadosFluxo, MontaConsultaRealCompara
Nº SOL......: 250388
Nº KINTANA..: 722851
Data........: 20/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: incluir lançamentos não vinculados a documentos
--------------------------------------------------------------------------------
Rotina......: MontaConsultaRealCompara
Nº SOL......: 250317
Nº PPM......: 713526
Data........: 17/03/2015
Responsável.: Edilaine Ferraresi
Descrição...: Divergencia entre o fluxo realizado e o comparativo para
              c. respon GECOR
--------------------------------------------------------------------------------
Rotina......: ListMontaFluxo, ListCompFluxo, ListMapaFluxo
Nº SOL......: 247104
Nº PPM......: 693475
Data........: 13/03/2015
Responsável.: Marcio Sanches Spinosa SOL 247104 PPM 693475
Descrição...: Ajuste na query para retornar dados mais rapido.
--------------------------------------------------------------------------------
Rotina......: ListMontaFluxo, ListCompFluxo, ListMapaFluxo
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa (incluir campo Grau)
--------------------------------------------------------------------------------}



interface

uses sysutils, uCmControlObject, uCmDbObject, DB, DbClient, classes,
     uCMClientDataSet, uCtrlPadroes, uCMTypes, uCmSqlParams,
     uDbCompFluxo, uDbMontaFluxo, uDbFluxoCaixa;

type
   // edilaine - SOL 136203 / KTN 813205 - inicio
   TTpOrientacao = (opRetrato, opPaisagem);
   TTpPeriodo = (tpDiario, tpSemanal, tpMensal, tpAnual, tpNone); //Cássio Rovaroto - SIG Nº 96575
   TTpRelatorio = (trPrevisto, trRealizado, trPrevxReal, trCompara, trNone);
   TTpColunaCompara = (tcTipoDesembRecebe, tcEspecificaDoc);

   TParamRel = record
      iIdFluxo      : integer;
      tipoDoc       : string;
      sGrau         : string;
      Quebra        : string;
      nomeQuebra    : string;
      sLinhaIni     : string;
      sLinhaFim     : string;
      sDataIni      : string;
      sDataFim      : string;
      CodDiretoria  : string;
      iAtividade    : integer;
      iCentroResp   : integer;
      iCentCusto    : integer;
      iPatro        : integer;
      iPlano        : integer;
      iColuna       : byte;
      TipoRelat     : TTpRelatorio;
      Agrupa        : TTpPeriodo;
      OrientaImp    : TTpOrientacao;
      bSintetico    : Boolean; //William Santana - SIG 22407
   end;
   // edilaine - SOL 136203 / KTN 813205 - fim

   TCtrlMontaFluxo = Class(TCmControlObject)

   private

      FDbFluxoCaixa  : TDbFluxoCaixa;
      FCdsFluxoCaixa : TCMClientDataSet;
      FDbMontaFluxo  : TDbMontaFluxo;
      FCdsMontaFluxo : TCMClientDataSet;
      FDbCompFluxo   : TDbCompFluxo;
      FCdsCompFluxo  : TCMClientDataSet;
      CtrlPadroes    : TCtrlPadroes;

      F_rIDPessoa    : Double;
      F_rIDModulo    : Double;
      F_rIDUsuario   : Double;

      // edilaine - SOL 136203 / KTN 813205 - inicio
      {monta sql que traz as linhas sintéticas e analíticas cadastradas na montagem do fluxo}
      function  GetSqlLinhasFluxo(iIdFluxoCaixa: integer; bLinAnalitica, bLinSintetica, bIncluiOrderby : boolean): string;
      {monta sql para trazer dados do fluxo previsto cadastrado no Fluxo > Previsto}
      function  GetSqlFluxoPrevisto(sParams : TParamRel) : string;
      {monta sql para trazer dados do fluxo realizado que são as baixas financeiras de documentos}
      function  GetSqlFluxoReal(sParams : TParamRel) : string;
      {monta sql para trazer dados de fluxo previsto para relatorio comparativo}
      function  MontaConsultaPrevCompara(sParams : TParamRel) : string;
      {monta sql para trazer dados de fluxo realizado para relatorio comparativo}
      function  MontaConsultaRealCompara(sParams : TParamRel;
                                         const bUsaDtDisponibilidade : boolean = false) : String;  // edilaine - SOL 250388 / PPM 722851

      {monta tabela virtual de períodos de acordo com o agrupamento escolhido: diario/semanal/mensal}
      function  MontaConsultaPeriodos(sParams : TParamRel) : String;
      {monta consulta que retornará os dados para os relatorios de fluxo previsto/realizado/previstoxrealizado/comparativo}
      function  MontaConsultaDadosFluxo(sParams : TParamRel;
                                        _cdsPeriodo : TCMClientDataSet;
                                        const bDadosExporta : boolean  = false;
                                        const bUsaDtDisponibilidade : boolean = false) : String;  // edilaine - SOL 250388 / PPM 722851
      // edilaine - SOL 136203 / KTN 813205 - fim

   public

      property CdsFluxoCaixa : TCMClientDataSet read FCdsFluxoCaixa write FCdsFluxoCaixa;
      property CdsMontaFluxo : TCMClientDataSet read FCdsMontaFluxo write FCdsMontaFluxo;
      property CdsCompFluxo  : TCMClientDataSet read FCdsCompFluxo  write FCdsCompFluxo;
      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double); reintroduce;
      destructor Destroy; override;

      function IncluiAlteraFluxo: Boolean;
      function ExcluiFluxo: Boolean;
      function GravaOrdenacao(const LinhasFluxo: OleVariant): Boolean;

      function ListFluxoCaixa(rIDFluxoCaixa: Double): OleVariant;
      function ListMontaFluxo(rIDFluxoCaixa,rCodLinhaFluxo: Double; bSoFaltantes: Boolean): OleVariant;
      function ListCompFluxo(rIDFluxoCaixa, rCodLinhaFluxo: Double): OleVariant;
      function ListMapaFluxo: OleVariant;
      function ListFaltantes: OleVariant;

      function ValidaTipoCalculo(iIdFluxoCaixa: integer; sTipoCalculo: string): boolean;

      function ListaCompLinhaFluxo(iIdPessoa,iIdFluxocaixa,iCodLinhaFluxo: integer): OleVariant;

      procedure OnCreateAppServer; override;

      // edilaine - SOL 136203 / KTN 813205 - inicio
      {verifica se a linha é sintetica}
      function  VerificaLinhaSintetica(iCodLinha : integer) : boolean;
      {cria estrutura do cds de filtros usados nos cabeçalhos dos relatorios}
      function  ListCamposFiltro : OleVariant;
      {cria estrutura do cds para relatorio comparativo e quadro/grafico comparativo}
      function  GetEstruturaQuadro : OleVariant;
      function  GetEstruturaCompara : OleVariant;
      {retorna o ID do fluxo de caixa casdastrado}
      function  GetIdFluxoCaixa : byte;
      {retorna linhas sintéticas do fluxo - totalizadoras}
      function  GetLinhasSinteticas(iIdFluxo : integer) : OleVariant;
      {retorna tabela virtual de períodos de acordo com o agrupamento escolhido}
      function  GetPeriodoFluxo(sParams : TParamRel) : OleVariant;
      {retorna total de valores por dia para fluxo previsto e realizado}
      function  GetTotalCompara(tipo : TTpRelatorio; sParams : TParamRel) : OleVariant;
      {retorna total de valores por dia e linha de fluxo para fluxo previsto, realizado, previsto x realizado}
      function  GetTotalDados(sParams : TParamRel;
                              _cdsPeriodo : TCMClientDataSet;
                              bDadosExporta : boolean) : OleVariant;
      {retorna lançamentos de valores para fluxo previsto, realizado e previsto x realizado }
      function  GetDadosFluxo(sParams : TParamRel;
                              _cdsPeriodo : TCMClientDataSet;
                              const bDadosExporta : boolean = false;
                              const bUsaDtDisponibilidade : boolean = false) : OleVariant;  // edilaine - SOL 250388 / PPM 722851

      {retorna lançamentos de fluxo previsto para relatorio comparativo}
      function  GetDadosComparaPrevisto(sParams : TParamrel) : OleVariant;
      {retorna todos os documentos baixados de um período}
      function  GetDocumentosCompara(sParams: TParamrel; sDia, sDesembRec : string): OleVariant;
      {retorna todos os documentos baixados com seus respectivos desembolsos/recebimentos}
      function  GetDocumentosxDesembReceb(sParams: TParamrel; sDia : string): OleVariant;
      // edilaine - SOL 136203 / KTN 813205 - fim

   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;


{ TCtrlMontaFluxo }
implementation


function iff(condicao : boolean; strT, strF : string) : string;
begin
  if condicao then result := StrT
              else result := StrF;
end;


constructor TCtrlMontaFluxo.Create(rIDPessoa,rIDModulo,rIDUsuario: Double);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;

   FDbFluxoCaixa:=TDbFluxoCaixa.Create(Self);
   FDbMontaFluxo:=TDbMontafluxo.Create(Self);
   FDbCompFluxo:=TDbCompFluxo.Create(Self);
   CtrlPadroes:=TCtrlPadroes.Create;
end;



destructor TCtrlMontaFluxo.Destroy;
begin
   FDbFluxoCaixa.Free;
   FDbMontaFluxo.Free;
   FDbCompFluxo.Free;
   CtrlPadroes.Free;

   if IsAppServer then
    begin
       CdsFluxoCaixa.Free;
       CdsMontaFluxo.Free;
       CdsCompFluxo.Free;
    end;

   inherited;
end;



procedure TCtrlMontaFluxo.OnCreateAppServer;
begin
   inherited;
   CdsFluxoCaixa:=TCMClientDataSet.Create(nil);
   CdsMontaFluxo:=TCMClientDataSet.Create(nil);
   CdsCompFluxo:=TCMClientDataSet.Create(nil);
end;



procedure TCtrlMontaFluxo.AfterInitialize;
begin
   inherited;
   CtrlPadroes.InitializeAs(Self);
end;



procedure TCtrlMontaFluxo.DoChangeDataBase;
begin
   inherited;
   FDbFluxoCaixa.DataBaseName:=DataBaseName;
   FDbMontaFluxo.DataBaseName:=DataBaseName;
   FDbCompFluxo.DataBaseName:=DataBaseName;
end;



function TCtrlMontaFluxo.IncluiAlteraFluxo: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.IncluiAlteraFluxo(FCdsFluxoCaixa.Data,
                                                        FCdsMontaFluxo.Data,
                                                        FCdsCompFluxo.Data,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario);
       if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsFluxoCaixa,FDbFluxoCaixa,[],[]);
          if not(Result) then
          begin
             MessageInfo:=FDbFluxoCaixa.MessageInfo;
             Rollback;
          end
          else
          begin
             Result:=ApplyCds(FCdsMontaFluxo,FDbMontaFluxo,[],[]);
             if not(Result) then
             begin
                MessageInfo:=FDbMontaFluxo.MessageInfo;
                Rollback;
             end
             else
             begin
                if (FDbMontaFluxo.Tipocalculo.AsString<>'T') then
                begin
                   Result:=ApplyCds(FCdsCompFluxo,FDbCompFluxo,
                                    [FDbMontaFluxo.Codlinhafluxo],
                                    [FDbCompFluxo.Codlinhafluxo]);
                   if not Result then
                    begin
                       MessageInfo:=FDbCompFluxo.MessageInfo;
                       Rollback;
                    end;
                end;

                if Result then
                begin
                   //Grava LOG
                   Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                           'Inclusão/Alteração da Montagem do Fluxo de Caixa',False);
                   if not(Result) then
                   begin
                      MessageInfo:=CtrlPadroes.MessageInfo;
                      Rollback;
                   end
                   else
                    Commit;
                end;
             end;
          end;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlMontaFluxo.ExcluiFluxo: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiFluxo(FCdsFluxoCaixa.Data,
                                                  FCdsMontaFluxo.Data,
                                                  FCdsCompFluxo.Data,
                                                  F_rIDPessoa,F_rIDModulo,F_rIDUsuario);
       if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result := ApplyCds(FCdsCompFluxo,FDbCompFluxo,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbCompFluxo.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=ApplyCds(FCdsMontaFluxo,FDbMontaFluxo,[],[]);
              if not Result then
               begin
                  MessageInfo:=FDbMontaFluxo.MessageInfo;
                  Rollback;
               end
              else
               begin
                  Result:=ApplyCds(FCdsFluxoCaixa,FDbFluxoCaixa,[],[]);
                  if not Result then
                   begin
                      MessageInfo:=FDbFluxoCaixa.MessageInfo;
                      Rollback;
                   end
                  else
                   begin
                      //Grava LOG
                      Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                           'Exclusão da Montagem do Fluxo de Caixa',False);
                      if not(Result) then
                       begin
                          MessageInfo:=CtrlPadroes.MessageInfo;
                          Rollback;
                       end
                      else
                       Commit;
                   end;
                end;
           end;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlMontaFluxo.GravaOrdenacao(const LinhasFluxo: OleVariant): Boolean;
var
   cdsAux : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.GravaOrdenacao(LinhasFluxo,F_rIDPessoa,
                                                     F_rIDModulo,F_rIDUsuario);
       if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          cdsAux:=TCMClientDataSet.Create(nil);
          try
             StartTransaction;

             cdsAux.Data:=LinhasFluxo;
             Result:=ApplyCds(cdsAux,FDbMontaFluxo,[],[]);

             if not(Result) then
              begin
                 MessageInfo:=FDbMontaFluxo.MessageInfo;
                 Rollback;
              end
             else
              Commit;
          finally
             cdsAux.Free;
          end;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;



function TCtrlMontaFluxo.ListMontaFluxo(rIDFluxoCaixa,rCodLinhaFluxo: Double;
                                        bSoFaltantes: Boolean): OleVariant;
var
   sSql    : TCMSqlParams;
begin
   sSql:=TCMSqlParams.Create(nil);
   with sSql.SQL do
   try
      Clear;
      Add(' SELECT ');
      Add('    M.IDFLUXOCAIXA, ');
      Add('    M.CODLINHAFLUXO, ');
      Add('    M.DESCRICAO, ');
      Add('    M.ORDEM, ');
      Add('    M.TIPOCALCULO, ');
      Add('    M.FLGACUMULA, ');
      Add('    M.FLGDISPBASE, ');
      Add('    M.IDPESSOA, ');
      Add('    M.POSICAOTOTAL, ');
      Add('    M.FLGIMPRIMELINHA, ');
      Add('    M.FLGGRAU ');                // edilaine - SOL 136203 / KTN 813205
      Add(' FROM ');
      Add('    MONTAFLUXO M ');
      Add(' WHERE ');
      Add('    (M.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

      if bSoFaltantes then
       begin
          Add('    AND (M.CODLINHAFLUXO <> '+FloatToStr(rCodLinhaFluxo)+') AND ');
          Add('        (NOT Exists(SELECT CF.CODLINHAFLUXO ');
          Add('                    FROM COMPFLUXO CF ');
          Add('                    WHERE (CF.CODCOMPLINHA=M.CODLINHAFLUXO) AND ');
          Add('                          (CF.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+') AND ');
          Add('                          (CF.IDFLUXOCAIXA = '+FloatToStr(rIDFluxoCaixa)+' ))) ');
       end
      else
        if (rCodLinhaFluxo<>0) then
            Add('    AND (M.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+') ');

      if (rIDFluxoCaixa<>0) then
          Add('    AND (M.IDFLUXOCAIXA = '+FloatToStr(rIDFluxoCaixa)+') ');

      Add(' ORDER BY M.DESCRICAO');

      sSql.ControlObject:=Self;
      Result:=sSql.Data;
   finally
      sSql.Free;
   end;
end;

function TCtrlMontaFluxo.ListFluxoCaixa(rIDFluxoCaixa: Double): OleVariant;
var
   sSql : TCMSqlParams;
begin
   sSql:=TCMSqlParams.Create(nil);
   with sSql.SQL do
   try
      Clear;
      Add(' SELECT * ');
      Add('FROM FLUXOCAIXA ');
      Add('WHERE ');
      Add('   (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

      if (rIDFluxoCaixa<>0) then
          Add('   AND (IDFLUXOCAIXA = '+FloatToStr(rIDFluxoCaixa)+') ');

      Add(' ORDER BY IDFLUXOCAIXA ');
      sSql.ControlObject:=Self;
      Result:=sSql.Data;
   finally
      sSql.Free;
   end;
end;



function TCtrlMontaFluxo.ListCompFluxo(rIDFluxoCaixa,rCodLinhaFluxo: Double): OleVariant;
begin
   with TStringList.Create do
   try
      Add(' SELECT ');
      Add('    C.IDFLUXOCAIXA, ');
      Add('    C.IDSEQUENCIA, ');
      Add('    C.CODLINHAFLUXO, ');
      Add('    C.CODTIPRECDES, ');
      Add('    C.RECPAG, ');
      Add('    C.IDPESSOA, ');
      Add('    C.CODCOMPLINHA, ');
      Add('    C.CODTIPDOC, ');
      Add('    '' '' AS FLGDISPBASE, ');
      Add('    DECODE(M.TIPOCALCULO,''R'',trim(T.CODTIPRECDES),');
      Add('                         ''P'',trim(T.CODTIPRECDES), ');
      Add('                         ''C'',trim(D.CODTIPDOC), ');
      Add('                         ''D'',trim(D.CODTIPDOC), ');
      Add('                         NULL) AS DESCCODIGO, ');
      Add('    DECODE(M.TIPOCALCULO,''R'',T.DESCRICAO,');
      Add('                         ''P'',T.DESCRICAO, ');
      Add('                         ''C'',D.DESCRICAO, ');
      Add('                         ''D'',D.DESCRICAO, ');
      Add('                         ''L'',M1.DESCRICAO,null) AS DESCLINHA, ');
      Add('    M.FLGGRAU ');  // edilaine - SOL 136203 / KTN 813205
      Add(' FROM ');
      Add('    COMPFLUXO C, ');
      Add('    MONTAFLUXO M, ');
      Add('    MONTAFLUXO M1, ');
      Add('    TIPORECEBDESEMB T, ');
      Add('    TIPODOCRECPAG D ');
      Add(' WHERE ');
      Add('    (C.IDPESSOA      = M1.IDPESSOA(+)) AND ');
      Add('    (C.CODCOMPLINHA  = M1.CODLINHAFLUXO(+)) AND ');
      Add('    (C.IDPESSOA      = M.IDPESSOA(+)) AND ');
      Add('    (C.CODLINHAFLUXO = M.CODLINHAFLUXO(+)) AND ');
      Add('    (C.CODTIPRECDES  = T.CODTIPRECDES(+)) AND ');
      Add('    (C.RECPAG        = T.RECPAG(+)) AND ');
      Add('    (C.IDPESSOA      = T.IDPESSOA(+)) AND ');
      Add('    (C.CODTIPDOC     = D.CODTIPDOC(+)) AND ');
      Add('    (C.RECPAG        = D.RECPAG(+)) AND ');
      Add('    (C.IDPESSOA      = ' + FloatToStr(F_rIDPessoa)+') ');

      if (rCodLinhaFluxo<>0) then Add('    AND (C.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+') ');
      if (rIDFluxoCaixa<>0) then  Add('    AND (C.IDFLUXOCAIXA = '+FloatToStr(rIDFluxoCaixa)+') ');

      Add(' ORDER BY DESCCODIGO ');

      Result:= GetDataPacket(Text);
   finally
      Free;
   end;
end;




function TCtrlMontaFluxo.ListMapaFluxo: OleVariant;
var
   sSql : TStringList;
begin
   sSql := TStringList.Create;
   with sSql do
   try
      Add(' SELECT ');
      Add('    FLX.IDFLUXOCAIXA, ');
      Add('    FLX.DESCRICAO AS NOMEFLUXO, ');
      Add('    MF.CODLINHAFLUXO, ');
      Add('    MF.DESCRICAO AS LINHAFLUXO, ');
      Add('    MF.TIPOCALCULO, ');
      Add('    CFTRD.ANASINT,');
      Add('    CFTRD.CODTIPRECDES, ');
      Add('    DECODE(CF.CODCOMPLINHA,MF.CODLINHAFLUXO, CFTRD.DESCRICAO, LS.DESCRICAO) AS TIPORECDES, ');
      Add('    DECODE(TO_CHAR(CF.CODCOMPLINHA),TO_CHAR(MF.CODLINHAFLUXO),NVL(CFTRD.RECPAG,LS.TIPOCALCULO),NVL(LS.TIPOCALCULO,MF.TIPOCALCULO)) AS RECPAG,');
      Add('    CF.CODTIPDOC, ');
      Add('    CF.CODCOMPLINHA, ');
      Add('    TDC.DESCRICAO AS TIPODOC, ');
      Add('    TDC.RECPAG AS RECPAGDOC, ');
      Add('    DECODE(RTRIM(CF.CODTIPDOC),NULL,0,1) AS TIPOLINHA, ');
      Add('    MF.ORDEM, ');
      Add('    MF.FLGGRAU, ');  // edilaine - SOL 136203 / KTN 813205 - inicio
      Add('    LENGTH(MF.ITEM) - LENGTH(REPLACE(MF.ITEM, ''.'')) AS NIVEL ');
      Add(' FROM ');
      Add('    FLUXOCAIXA FLX, ');
      //Add('    MONTAFLUXO MF, ');
      Add('    (SELECT substr(m.descricao, 1, instr(m.descricao, ''. '')) AS ITEM, M.* ');
      Add('      FROM MONTAFLUXO M ');
      Add('    ) MF, ');
      // edilaine - SOL 136203 / KTN 813205 - fim
      Add('    COMPFLUXO CF, ');
      Add('    TIPODOCRECPAG TDC, ');
      Add('   (SELECT ');
      Add('       CF.IDFLUXOCAIXA, ');
      Add('       CF.CODTIPRECDES AS CODJOIN, ');
      Add('       TRD.ANASINT,');
      Add('       TRD.DESCRICAO, ');
      Add('       TRD.CODTIPRECDES, ');
      Add('       TRD.RECPAG, ');
      Add('       TRD.IDPESSOA ');
      Add('    FROM ');
      Add('       COMPFLUXO CF, ');
      Add('       TIPORECEBDESEMB TRD ');
      Add('    WHERE ');
      Add('      (TRD.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('      (CF.RECPAG=TRD.RECPAG) AND ');
      Add('      (CF.IDPESSOA=TRD.IDPESSOA) AND ');
      Add('      (RTRIM(CF.CODTIPRECDES) = ' + 'SUBSTR(TRD.CODTIPRECDES,1,LENGTH(RTRIM(CF.CODTIPRECDES))))) CFTRD, ');
      Add('   (SELECT ');
      Add('       CODLINHAFLUXO, ');
      Add('       TIPOCALCULO, ');
      Add('       DESCRICAO ');
      Add('    FROM ');
      Add('       MONTAFLUXO ');
      Add('    WHERE ');
      Add('      (IDPESSOA= '+FloatToStr(F_rIDPessoa)+')) LS ');
      Add(' WHERE ');
      Add('    (CF.CODCOMPLINHA = LS.CODLINHAFLUXO(+)) AND ');
      Add('    (CF.RECPAG = CFTRD.RECPAG(+)) AND ');
      Add('    (CF.IDPESSOA = CFTRD.IDPESSOA(+)) AND ');
      Add('    (CF.CODTIPDOC = TDC.CODTIPDOC(+)) AND ');
      Add('    (CF.CODTIPRECDES = CFTRD.CODJOIN(+)) AND ');
      Add('    (CF.IDFLUXOCAIXA = CFTRD.IDFLUXOCAIXA(+)) AND ');
      Add('    (CF.IDFLUXOCAIXA(+) = MF.IDFLUXOCAIXA) AND ');
      Add('    (CF.CODLINHAFLUXO(+) = MF.CODLINHAFLUXO) AND ');
      Add('    (CF.IDPESSOA(+) = MF.IDPESSOA) AND ');
      Add('    (MF.IDPESSOA(+) = FLX.IDPESSOA) AND ');
      Add('    (MF.IDFLUXOCAIXA(+) = FLX.IDFLUXOCAIXA) AND ');
      Add('    (FLX.IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ') ');
      Add('GROUP BY');
      Add('    FLX.IDFLUXOCAIXA, FLX.DESCRICAO, MF.CODLINHAFLUXO,');
      Add('    MF.DESCRICAO,MF.TIPOCALCULO, CFTRD.ANASINT, CFTRD.CODTIPRECDES,');
      Add('    CF.CODCOMPLINHA,MF.CODLINHAFLUXO, CFTRD.DESCRICAO, LS.DESCRICAO,');
      Add('    CFTRD.RECPAG, LS.TIPOCALCULO,');
      Add('    CF.CODTIPDOC,TDC.DESCRICAO,TDC.RECPAG,');
      Add('    CF.CODTIPDOC,MF.ORDEM,MF.FLGGRAU,MF.ITEM'); // edilaine - SOL 136203 / KTN 813205

      Add(' ORDER BY FLX.IDFLUXOCAIXA,MF.ORDEM,CFTRD.CODTIPRECDES,CF.CODTIPDOC ');

      Result := GetDataPacket(sSql);
   finally
      sSql.Free;
   end;
end;




function TCtrlMontaFluxo.ListFaltantes: OleVariant;
var
   sSql : TCMSqlParams;
begin
   sSql:=TCMSqlParams.Create(nil);
   with sSql.SQL do
   try
      Clear;
      Add(' SELECT ');
      Add('    ''123456789012345'' AS CODIGO, ');
      Add('    ''12345678901234567890123456789012345'' AS DESCRICAO, ');
      Add('    ''X'' AS RECPAG ');
      Add(' FROM DUAL ');
      Add(' WHERE (1=2) /*+OPTIMIZER_MODE RULE*/ ');

      sSql.ControlObject:=Self;
      Result:=sSql.Data;
   finally
      sSql.Free;
   end;
end;



function TCtrlMontaFluxo.ValidaTipoCalculo(iIdFluxoCaixa: integer; sTipoCalculo: string): boolean;
begin
   _Cds.Data := GetDataPacket('SELECT CODLINHAFLUXO ' +
                              'FROM MONTAFLUXO ' +
                              'WHERE IDFLUXOCAIXA = ' + IntToStr(iIdFluxoCaixa) + ' AND ' +
                              '      TIPOCALCULO  IN (' + sTipoCalculo +')');
   Result := _Cds.IsEmpty;
end;



function TCtrlMontaFluxo.ListaCompLinhaFluxo(iIdPessoa, iIdFluxocaixa,
  iCodLinhaFluxo: integer): OleVariant;
begin
    Result := GetDataPacket('SELECT CODTIPRECDES, FLGDISPBASE ' +
                            'FROM COMPFLUXO ' +
                            'WHERE IDFLUXOCAIXA  = ' + IntToStr(iIdFluxocaixa) +
                            '  AND CODLINHAFLUXO = ' + IntToStr(iCodLinhaFluxo) +
                            '  AND IDPESSOA      = ' + IntToStr(iIdPessoa));
end;



// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetIdFluxoCaixa: byte;
begin
  _cds.data := ListFluxoCaixa(0);
  if not _cds.IsEmpty then
     result := _cds.FieldByName('IDFLUXOCAIXA').AsInteger
  else
     result := 0;
end;

// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetPeriodoFluxo(sParams : TParamRel) : OleVariant;
var
  sSQL : string;
begin
  sSQL := MontaConsultaPeriodos(sParams);
  
  Result := GetDataPacket( sSQL );
end;

// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.ListCamposFiltro: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT '+
          '       ''          '' AS DATAINI, '+
          '       ''          '' AS DATAFIM, '+
          '       ''                                                            '' AS FILTRO1,  '+
          '       ''                                                            '' AS FILTRO2,  '+
          '       ''                                                            '' AS FILTRO3,  '+
          '       ''                                                            '' AS FILTRO4,  '+
          '       ''                                                            '' AS FILTRO5,  '+
          '       ''                                                            '' AS FILTRO6,  '+
          '       ''                                                            '' AS LINHAINI, '+
          '       ''                                                            '' AS LINHAFIM, '+
          '       ''                                                            '' AS NOMEREL   '+
          '  FROM DUAL ';

  Result := GetDataPacket( sSQL );
end;


// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetEstruturaCompara : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT '+
          '       0  AS ORDEM, '+
          '       ''                                                            '' AS QUEBRA, '+
          '       ''          '' AS PERIODO, '+
          '       ''        '' AS BUSCA, '+
          '       ''                    '' AS USUARIO, '+
          '       ''                                                            '' AS TIPORECDES, '+
          '       0 AS GRUPODOC, '+
          '       ''               '' AS CODTIPRECDES, '+
          '       0 AS VALOR, '+
          '       ''                                                            '' AS DESEMBOLSO, '+
          '       0 AS VLRBAIXA, '+
          '       ''               '' AS CODDOCUMENTO, '+
          '       ''                                                            '' AS FORCLI, '+
          '       0 AS VLRRATEIO '+
          '  FROM DUAL ';

  Result := GetDataPacket( sSQL );
end;


function TCtrlMontaFluxo.GetEstruturaQuadro : OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT '+
          '       ''  '' AS PERIODO, '+
          '       ''          '' AS DATA, '+
          '       ''        '' AS BUSCA, '+
          '       0 AS PREVISTO, '+
          '       0 AS REALIZADO, '+
          '       0 AS PERCENTUAL, '+
          '       100 AS REFERENCIA, '+
          '       110 AS FXLIMITESUP, '+
          '       90  AS FXLIMITEINF '+
          '  FROM DUAL ';

  Result := GetDataPacket( sSQL );
end;



// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetDadosFluxo(sParams : TParamRel;
                                       _cdsPeriodo : TCMClientDataSet;
                                       const bDadosExporta : boolean;
                                       const bUsaDtDisponibilidade : boolean ) : OleVariant;  // edilaine - SOL 250388 / PPM 722851
var
  sSQLDados : string;
begin
  sSQLDados := MontaConsultaDadosFluxo(sParams, _cdsPeriodo, bDadosExporta, bUsaDtDisponibilidade);

  Result := GetDataPacket( sSQLDados );

end;


// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetSqlLinhasFluxo(iIdFluxoCaixa: integer;
  bLinAnalitica, bLinSintetica, bIncluiOrderby: boolean): string;
var
  sSQL : string;
begin
  sSQL := '';

  if bLinAnalitica then
  begin
    sSQL := 'select la.ordem, substr(la.descricao, 1, instr(la.descricao, ''. '')) AS ITEM, 5 as flggrau, '+#13+
            '       ca.codlinhafluxo, la.DESCRICAO as LINHAFLUXO,   '+#13+
            '       NVL(ta.RECPAG, la.TIPOCALCULO) AS RECPAG,       '+#13+
            '       ca.CODCOMPLINHA, '+#13+
            '       ta.descricao as TIPORECDES, ta.codtiprecdes     '+#13+
            '  from compfluxo ca, montafluxo la, tiporecebdesemb ta '+#13+
            ' where ca.codlinhafluxo = la.codlinhafluxo '+#13+
            '   and ca.codtiprecdes = ta.codtiprecdes   '+#13+
            '   and ca.RECPAG = ta.RECPAG '+#13+
            '   and ca.idfluxocaixa = '+IntToStr(iIdFluxoCaixa);
  end;

  if bLinSintetica then
  begin
    if sSQL <> EmptyStr then
       sSQL := sSQL + ' UNION ';

    sSQL := sSQL +
            'select distinct ls.ordem, ms.item, ls.flggrau, '+#13+
            '       cs.codlinhafluxo, ls.DESCRICAO as LINHAFLUXO,  '+#13+
            '       NVL(ls.TIPOCALCULO, ms.TIPOCALCULO) AS RECPAG, '+#13+
            '       decode(cs.codlinhafluxo, ms.codlinhafluxo,0, cs.CODCOMPLINHA) CODCOMPLINHA, '+#13+
            '       decode(cs.codlinhafluxo, ms.codlinhafluxo, ms.item||'' - Somatório'', ms.descricao) as TIPORECDES, '' '' as codtiprecdes '+#13+
            '  from compfluxo cs, montafluxo ls, '+#13+
            '       (SELECT substr(m.descricao, 1, instr(m.descricao, ''. '')) AS ITEM, M.* '+#13+
            '          FROM MONTAFLUXO M) ms '+#13+
            ' where cs.codlinhafluxo = ls.codlinhafluxo '+#13+
            '   and cs.codcomplinha = ms.codlinhafluxo  '+#13+
            '   and cs.idfluxocaixa = '+IntToStr(iIdFluxoCaixa);
  end;

  if (bIncluiOrderby) and (sSQL <> EmptyStr) then
     sSQL := sSQL + ' order by 1,4 ';

  Result := sSQL;

end;


// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.MontaConsultaDadosFluxo(sParams: TParamRel;
                                                 _cdsPeriodo: TCMClientDataSet;
                                                 const bDadosExporta : boolean;
                                                 const bUsaDtDisponibilidade : boolean) : String;  // edilaine - SOL 250388 / PPM 722851
var
   sSQL      : TStringList;
   iCampo, i : integer;
   bWehre    : boolean;
   sFiltro   : string;

begin
  try
    _cdsPeriodo.first;

    // MONTA FILTRO
    if sParams.tipoDoc <> '' then
       sFiltro := sFiltro + ' AND (FC.RECPAG = '+Quotedstr(sParams.tipoDoc)+')';
    // centro de custo e diretoria
    if sParams.iCentCusto > -1 then
       sFiltro := sFiltro + ' AND (FC.CODCENTROCUSTO = '+IntToStr(sParams.iCentCusto)+')'
    else if sParams.CodDiretoria <> EmptyStr then
       sFiltro := sFiltro + ' AND (FC.DIRETORIA = '+Quotedstr(sParams.CodDiretoria)+')';
    // atividade de projeto
    if sParams.iAtividade <> 0 then
       sFiltro := sFiltro + ' AND (FC.UNIDNEGOC = '+IntToStr(sParams.iAtividade)+')';
    // centro de responsabilidade
    if sParams.iCentroResp > -1 then
       sFiltro := sFiltro + ' AND (FC.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp)+')';
    // patrocinadora
    if sParams.iPatro > -1 then
       sFiltro := sFiltro + ' AND (FC.IDPATRO = '+IntToStr(sParams.iPatro)+')';
    // plano previdenciario
    if sParams.iPlano > -1 then
       sFiltro := sFiltro + ' AND (FC.IDPLANOPREV = '+IntToStr(sParams.iPlano)+')';


    sSQL := TStringList.create;
    case sParams.TipoRelat of
      trPrevisto,
      trRealizado : begin
                      //SIG88013 -Inicio
                      if not(bDadosExporta) and (sParams.TipoRelat = trRealizado)then
                      begin
                        sSQL.Add('with dias as ');
                        sSQL.Add('(' + MontaConsultaPeriodos(sParams) + ')');
                      end;
                      //SIG88013 -Fim

                      // formando campos para agrupar inverter tabela - C1
                      sSQL.Add('SELECT '+iff(sParams.Quebra <> EmptyStr, 'FLUXO.QUEBRA,', '') );
                      sSQL.Add('       '+iff(not bDadosExporta, 'FLUXO.GRUPO,', '') );
                      sSQL.Add('       FLUXO.CODLINHAFLUXO, ');
                      sSQL.Add('       FLUXO.FLGGRAU, ');
                      sSQL.Add('       FLUXO.ORDEM, ');
                      sSQL.Add('       FLUXO.RECPAG, ');
                      sSQL.Add('       DECODE(FLUXO.FLGGRAU, 5, ''          '', '''') || FLUXO.LINHAFLUXO AS LINHAFLUXO ');

                      if not bDadosExporta then
                      begin
                        //SIG88013 -Inicio
                        if not(sParams.TipoRelat = trRealizado) then
                        begin
                          // os campos são fixos em 4 ou 8 colunas
                          for iCampo := 1 to sParams.iColuna do
                          begin
                            sSQL.Add('     , SUM(DECODE(FLUXO.COLUNA, '+IntToStr(iCampo)+', FLUXO.VALOR, 0)) AS P'+IntToStr(iCampo) );
                          end;
                        end
                        else
                        begin
                          //SIG88013 -Fim
                          //SIG87164 - Inicio
                          //Adiiona as linhas que vêem do cdsPeríodo
                          _cdsPeriodo.first;
                          while not _cdsPeriodo.eof do
                          begin
                            iCampo := _cdsPeriodo.RecNo;
                            sSQL.Add('     , SUM(DECODE(FLUXO.PERIODO, '+Quotedstr(_cdsPeriodo.Fields[0].AsString)+', FLUXO.VALOR, 0)) AS P'+IntToStr(iCampo) );

                            _cdsPeriodo.next;
                          end;

                          for iCampo := (1 + (sParams.iColuna   - (sParams.iColuna - _cdsPeriodo.recordcount))) to sParams.iColuna  do
                            sSQL.Add('     , 0 AS P'+IntToStr(iCampo));
                          //SIG87164 - Fim
                        end;
                      end
                      else
                      begin
                        // na exportação de dados usa o cdsperiodo pois cada dia deve ocupar uma coluna, diferente do relatório que
                        // os dados devem estar em 4 ou 8 colunas
                        _cdsPeriodo.first;
                        while not _cdsPeriodo.eof do
                        begin
                          iCampo := _cdsPeriodo.RecNo;
                          sSQL.Add('     , SUM(DECODE(FLUXO.PERIODO, '+Quotedstr(_cdsPeriodo.Fields[0].AsString)+', FLUXO.VALOR, 0)) AS P'+IntToStr(iCampo) );

                          _cdsPeriodo.next;
                        end;
                      end;

                      sSQL.Add('     , SUM(FLUXO.VALOR) AS PT '); //Everson Cunha - SIG46608/88515

                      sSQL.Add('  FROM (');
                      sSQL.Add('SELECT FC.PERIODO, ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('       TRIM(NVL(FC.'+sParams.Quebra+', ''Sem '+sParams.NomeQuebra+''')) AS QUEBRA,  ');

                      if not bDadosExporta then
                      begin
                        //SIG88013 -Inicio
                        if (sParams.TipoRelat = trRealizado) then
                        begin
                          sSQL.Add(' (select GRUPO from dias where  fc.PERIODO = PERIODO) as GRUPO, ');
                          sSQL.Add(' (select COLUNA from dias where  fc.PERIODO = PERIODO) as COLUNA, ');
                        end
                        else
                        //SIG88013 -Fim
                          sSQL.Add('       PR.GRUPO, PR.COLUNA, ');
                      end;
                      sSQL.Add('       FC.CODLINHAFLUXO, FC.FLGGRAU, FC.ORDEM, FC.RECPAG, FC.USUARIO, FC.LINHAFLUXO, ');
                      sSQL.Add('       SUM(FC.VALOR) AS VALOR ');
                      sSQL.Add('FROM ');

                      // INSERINDO VALORES DO FLUXO
                      if sParams.TipoRelat = trPrevisto then
                         sSQL.Add('     (' + GetSqlFluxoPrevisto( sParams ) +') FC, ')
                      else
                      if (sParams.TipoRelat = trRealizado) then
                          sSQL.Add('     (' + GetSqlFluxoReal( sParams ) +') FC ')
                      else
                         sSQL.Add('     (' + GetSqlFluxoReal( sParams ) +') FC, ');

                      // INSERINDO CONSULTA DE PERÍODO
                      //SIG88013 -Inicio
                      if (sParams.TipoRelat = trRealizado) then
                        sSQL.Add('WHERE (1 = 1) ')
                      else
                      begin
                        //SIG88013 -Fim
                        sSQL.Add('      (' + MontaConsultaPeriodos( sParams ) +') PR ');
                        sSQL.Add('WHERE FC.PERIODO = PR.PERIODO ');
                      end;

                      if sFiltro <> EmptyStr then
                         sSQL.Add( sFiltro );

                      sSQL.Add('GROUP BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('   FC.'+sParams.Quebra+',  ');
                      if not(sParams.TipoRelat = trRealizado) then //SIG88013
                      begin
                        if not bDadosExporta then
                          sSQL.Add('   PR.GRUPO, PR.COLUNA, ');
                      end;

                      sSQL.Add('   FC.CODLINHAFLUXO, FC.FLGGRAU, FC.ORDEM, FC.RECPAG, FC.USUARIO, FC.LINHAFLUXO, FC.PERIODO');

                      // final
                      sSQL.Add('   ) FLUXO ');
                      sSQL.Add(' GROUP BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('    FLUXO.QUEBRA, ');
                      if not bDadosExporta then
                         sSQL.Add('    FLUXO.GRUPO, ');
                      sSQL.Add('    FLUXO.CODLINHAFLUXO, FLUXO.FLGGRAU, ');
                      sSQL.Add('    FLUXO.RECPAG, FLUXO.ORDEM, FLUXO.LINHAFLUXO ');
                      sSQL.Add(' ORDER BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('   FLUXO.QUEBRA, ');
                      if not bDadosExporta then
                         sSQL.Add('    FLUXO.GRUPO, ');
                      sSQL.Add('    FLUXO.ORDEM');
                    end;

      trPrevxReal : begin
                      // formando campos para agrupar inverter tabela - C1
                      sSQL.Add('SELECT '+iff(sParams.Quebra <> EmptyStr, 'FLUXO.QUEBRA,', '') );
                      if not bDadosExporta then
                         sSQL.Add('       FLUXO.GRUPO, ');
                      sSQL.Add('       FLUXO.CODLINHAFLUXO, ');
                      sSQL.Add('       FLUXO.FLGGRAU, ');
                      sSQL.Add('       FLUXO.ORDEM, ');
                      sSQL.Add('       FLUXO.RECPAG, ');
                      sSQL.Add('       DECODE(FLUXO.FLGGRAU, 5, ''          '', '''') || FLUXO.LINHAFLUXO AS LINHAFLUXO');

                      if not bDadosExporta then
                      begin
                        for i := 1 to (sParams.iColuna div 2) do
                        begin
                          iCampo := (i * 2) -1;
                          sSQL.Add('     , SUM(DECODE(FLUXO.TIPO, ''PREV'', DECODE(FLUXO.COLUNA, '+IntToStr(i)+', FLUXO.VALOR, 0), 0)) AS P'+IntToStr(iCampo) );
                          sSQL.Add('     , SUM(DECODE(FLUXO.TIPO, ''REAL'', DECODE(FLUXO.COLUNA, '+IntToStr(i)+', FLUXO.VALOR, 0), 0)) AS P'+IntToStr(iCampo+1) );
                        end;
                      end
                      else
                      begin
                        // usa o cdsperiodo
                        _cdsPeriodo.first;
                        while not _cdsPeriodo.eof do
                        begin
                          iCampo := (_cdsPeriodo.Recno * 2) -1;
                          sSQL.Add('     , SUM(DECODE(FLUXO.TIPO, ''PREV'', DECODE(FLUXO.PERIODO, '+Quotedstr(_cdsPeriodo.Fields[0].AsString)+', FLUXO.VALOR, 0), 0)) AS P'+IntToStr(iCampo) );
                          sSQL.Add('     , SUM(DECODE(FLUXO.TIPO, ''REAL'', DECODE(FLUXO.PERIODO, '+Quotedstr(_cdsPeriodo.Fields[0].AsString)+', FLUXO.VALOR, 0), 0)) AS P'+IntToStr(iCampo+1) );

                          _cdsPeriodo.next;
                        end;
                      end;

                      sSQL.Add('     , SUM(FLUXO.VALOR) AS PT '); //Everson Cunha - SIG46608/88515

                      sSQL.Add('  FROM (');
                      sSQL.Add('SELECT FC.PERIODO, ');
                      sSQL.Add('       FC.TIPO, ');
                      if not bDadosExporta then
                         sSQL.Add('       PR.GRUPO, PR.COLUNA, ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('       TRIM(NVL(FC.'+sParams.Quebra+', ''Sem '+sParams.NomeQuebra+''')) AS QUEBRA,  ');
                      sSQL.Add('       FC.CODLINHAFLUXO, FC.FLGGRAU, FC.ORDEM, FC.RECPAG, FC.USUARIO, FC.LINHAFLUXO, ');
                      sSQL.Add('       SUM(FC.VALOR) AS VALOR ');
                      sSQL.Add('FROM ');

                      //--- Fluxo Previsto
                      sSQL.Add('     ( ');
                      sSQL.Add( GetSqlFluxoPrevisto(sParams) );
                      sSQL.Add('       UNION ALL');
                      //--- Fluxo Realizado
                      sSQL.Add( GetSqlFluxoReal(sParams) );
                      sSQL.Add('     ) FC, ');

                      // INSERINDO CONSULTA DE PERÍODO
                      sSQL.Add('     (' + MontaConsultaPeriodos( sParams ) +') PR ');
                      sSQL.Add('WHERE FC.PERIODO = PR.PERIODO ');

                      if sFiltro <> EmptyStr then
                         sSQL.Add( sFiltro );

                      sSQL.Add('GROUP BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('   FC.'+sParams.Quebra+',  ');
                      if not bDadosExporta then
                         sSQl.Add('   PR.GRUPO, PR.COLUNA, ');
                      sSQL.Add('   FC.TIPO, FC.PERIODO,');
                      sSQL.Add('   FC.CODLINHAFLUXO, FC.FLGGRAU, FC.ORDEM, FC.RECPAG, FC.USUARIO, FC.LINHAFLUXO ');

                      // final
                      sSQL.Add('   ) FLUXO ');
                      sSQL.Add(' GROUP BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('    FLUXO.QUEBRA, ');
                      if not bDadosExporta then
                         sSQL.Add('    FLUXO.GRUPO, ');
                      sSQL.Add('    FLUXO.TIPO, FLUXO.CODLINHAFLUXO, FLUXO.FLGGRAU, ');
                      sSQL.Add('    FLUXO.RECPAG, FLUXO.ORDEM, FLUXO.LINHAFLUXO ');
                      sSQL.Add(' ORDER BY ');
                      if sParams.Quebra <> '' then
                         sSQL.Add('   FLUXO.QUEBRA, ');
                      if not bDadosExporta then
                         sSQL.Add('    FLUXO.GRUPO, ');
                      sSQL.Add('    FLUXO.ORDEM');

                    end;

      trCompara   : begin
                      sSQL.text := MontaConsultaRealCompara( sParams, bUsaDtDisponibilidade);  // edilaine - SOL 250388 / PPM 722851
                    end;

    end;
    //sSQL.SaveToFile('c:\planus\temp\teste.txt');

    Result := sSQL.text;

  finally
    sSQL.Free;
  end;

end;


// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetLinhasSinteticas(iIdFluxo: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := GetSqlLinhasFluxo(iIdFluxo, false, TRUE, TRUE);

  Result := GetDataPacket( sSQL );
end;


// edilaine - SOL 136203 / KTN 813205
function TCtrlMontaFluxo.GetTotalDados(sParams: TParamRel;
                                       _cdsPeriodo: TCMClientDataSet;
                                       bDadosExporta : boolean): OleVariant;
var
  iCampo    : integer;
  sSQLTotal : TStringList;
begin
  try
    sSqlTotal := TStringList.create;


    sSQLTotal.Add('SELECT ');
    if sParams.Quebra <> '' then
       sSQLTotal.Add('       TOTAL.QUEBRA, ');
    if not bDadosExporta then
       sSQLTotal.Add('       TOTAL.GRUPO, ');
    sSQLTotal.Add('       TOTAL.ORDEM, ');
    sSQLTotal.Add('       TOTAL.RECPAG, ');
    sSQLTotal.Add('       DECODE(TOTAL.FLGGRAU, 5, 4, TOTAL.FLGGRAU) FLGGRAU, ');
    sSQLTotal.Add('       TOTAL.CODLINHAFLUXO ');

    if not bDadosExporta then
    begin
      //SIG88013 -Inicio
      if (sParams.TipoRelat = trRealizado) then
      begin
        for iCampo := 1 to _cdsPeriodo.recordCount do
          sSQLTotal.Add('     , SUM(TOTAL.P'+IntToStr(iCampo)+') AS P'+IntToStr(iCampo) );
      end
      else
      begin
        //SIG88013 -Fim
        for iCampo := 1 to sParams.iColuna do
        begin
          sSQLTotal.Add('     , SUM(TOTAL.P'+IntToStr(iCampo)+') AS P'+IntToStr(iCampo) );
        end;
      end;
    end
    else
    begin
      _cdsPeriodo.first;
      while not _cdsPeriodo.eof do
      begin
        if sParams.TipoRelat = trPrevxReal then
        begin
          iCampo := (_cdsPeriodo.Recno *2)-1;

          sSQLTotal.Add('     , SUM(TOTAL.P'+IntToStr(iCampo)+') AS P'+IntToStr(iCampo) );
          sSQLTotal.Add('     , SUM(TOTAL.P'+IntToStr(iCampo+1)+') AS P'+IntToStr(iCampo+1) );

        end
        else
          sSQLTotal.Add('     , SUM(TOTAL.P'+IntToStr(_cdsPeriodo.RecNo)+') AS P'+IntToStr(_cdsPeriodo.RecNo) );

        _cdsPeriodo.next;
      end;
    end;

    sSQLTotal.Add('     , SUM(TOTAL.PT) AS PT '); //Everson Cunha - SIG46608/88515

    sSQLTotal.Add('  FROM (');
    sSQLTotal.Add( MontaConsultaDadosFluxo(sParams, _cdsPeriodo, bDadosExporta) );
    sSQLTotal.Add('       ) TOTAL');
    sSQLTotal.Add(' GROUP BY ');
    if sParams.Quebra <> '' then
       sSQLTotal.Add('      TOTAL.QUEBRA,  ');
    if not bDadosExporta then
       sSQLTotal.Add('      TOTAL.GRUPO,   ');
    sSQLTotal.Add('      TOTAL.RECPAG, TOTAL.ORDEM, TOTAL.CODLINHAFLUXO,');
    sSQLTotal.Add('      DECODE(TOTAL.FLGGRAU, 5, 4, TOTAL.FLGGRAU)');
    sSQLTotal.Add(' ORDER BY ');
    if sParams.Quebra <> '' then
       sSQLTotal.Add('      TOTAL.QUEBRA,  ');
    if not bDadosExporta then
       sSQLTotal.Add('      TOTAL.GRUPO,   ');
    sSQLTotal.Add('      TOTAL.ORDEM');

    //sSQLTotal.savetofile('c:\planus\temp\total.txt');
    
    Result := GetDataPacket( sSQLTotal.text );

  finally
    sSQLTotal.free;
  end;

end;

function TCtrlMontaFluxo.GetSqlFluxoPrevisto(sParams : TParamRel) : string;
var
  sAgrupa : string;
  sSQLFx  : TStringlist;
begin
  try
    sSQLFx := TStringList.create;

    case sParams.Agrupa of
       tpDiario  : sAgrupa := '             TO_CHAR(F.DATAPROGRAMADA, ''dd/mm/yyyy'') AS PERIODO, ';
       tpSemanal : sAgrupa := '             TO_CHAR(F.DATAPROGRAMADA, ''IW'') AS PERIODO, ';
       tpMensal  : sAgrupa := '             TO_CHAR(F.DATAPROGRAMADA, ''mm/yyyy'') AS PERIODO, ';
       tpAnual   : sAgrupa := '             TO_CHAR(F.DATAPROGRAMADA, ''YYYY'') AS PERIODO, '; //Cássio Rovaroto - SIG nº 96575
    end;
    {consulta do fluxo previsto onde a vinculação do lançamento foi feita pelo desembolsos/recebimentos - CODTIPRECDES }
    sSQLFx.Add('SELECT F.UNIDNEGOC, F.CODCENTRORESPON, F.IDPATRO, F.IDPLANOPREV, FX.RECPAG, F.CODCENTROCUSTO, ');
    sSQLFx.Add('      '+sAgrupa );
    sSQLFx.Add('       F.CODTIPRECDES, F.VALOR, ''PREV'' AS TIPO, ');
    sSQLFx.Add('       UST.NOMEUSUARIO AS USUARIO, FX.CODLINHAFLUXO, FX.FLGGRAU, FX.ORDEM, FX.TIPORECDES AS LINHAFLUXO, ');

    if (sParams.Quebra = 'CRESPON') then
       sSQLFx.Add('       SUBSTR(CR.CODEXTERNO,1,2) AS DIRETORIA, CR.CODEXTERNO, ') //Peterson Victor SOL 269329 PPM 1298760
    else
       sSQLFx.Add('       SUBSTR(C.CODEXTERNO,1,2) AS DIRETORIA, C.CODEXTERNO, '); //Peterson Victor SOL 269329 PPM 1298760

    sSQLFx.Add('       C.NOME AS CCUSTO, CR.NOME AS CRESPON, ');
    sSQLFx.Add('       P.NOME AS PATRO, PP.NOME AS PLANOPREV ');
    sSQLFx.Add('      , F.IDENTIFICADORDERATEIO              ');  //William Santana - SIG 22407
    sSQLFx.Add('  FROM FLUXOORCADO F, USUARIOSISTEMA UST,    ');
    sSQLFx.Add('       CENTCUST C, CENTRESPON CR, PESSOA P, PLANPREVCONTABIL PP, ');
                       { inclui consulta das linhas analíticas do fluxo }
    sSQLFx.Add('       ('+ GetSqlLinhasFluxo( sParams.iIdFluxo, true, false, false)+') FX ');
    sSQLFx.Add(' WHERE P. IDPESSOA = F.IDPATRO ');

    // se tiver filtro por centro de custo ou diretoria remove o left join com a CENTCUST
    if (sParams.iCentCusto > -1) or (sParams.CodDiretoria <> EmptyStr) then
       sSQLFx.Add('   AND F.CODCENTROCUSTO = C.CODCENTROCUSTO ')
    else
       sSQLFx.Add('   AND F.CODCENTROCUSTO = C.CODCENTROCUSTO(+) ');

    sSQLFx.Add('   AND F.CODCENTRORESPON = CR.CODCENTRORESPON(+) ');
    sSQLFx.Add('   AND F.IDPLANOPREV = PP.IDPLANOPREV(+) ');
    sSQLFx.Add('   AND FX.CODTIPRECDES = F.CODTIPRECDES  ');
    sSQLFx.Add('   AND FX.RECPAG = F.RECPAG  ');
    sSQLFx.Add('   AND NVL(F.CODTIPRECDES, 0) > 0 ');
    sSQLFx.Add('   AND ( RTRIM(F.TRGUSERINCLUSAO) = RTRIM(''CM''||TO_CHAR(UST.IDUSUARIO)) ) ');
    sSQLFx.Add('   AND F.DATAPROGRAMADA BETWEEN to_date('+Quotedstr(sParams.sDataIni)+', ''DD/MM/YYYY'') AND to_date('+Quotedstr(sParams.sDataFim)+', ''DD/MM/YYYY'')' );

    sSQLFx.Add('UNION ALL ');

    {consulta do fluxo previsto onde a vinculação do lançamento foi feita pelo codigo da linha de fluxo - CODLINHAFLUXO}
    sSQLFx.Add('SELECT F.UNIDNEGOC, F.CODCENTRORESPON, F.IDPATRO, F.IDPLANOPREV, FX.RECPAG, F.CODCENTROCUSTO, ');
    sSQLFx.Add('      '+sAgrupa );
    sSQLFx.Add('       F.CODTIPRECDES, F.VALOR, ''PREV'' AS TIPO, ');
    sSQLFx.Add('       UST.NOMEUSUARIO AS USUARIO, FX.CODLINHAFLUXO, FX.FLGGRAU, FX.ORDEM, FX.LINHAFLUXO, ');

    if (sParams.Quebra = 'CRESPON') then
       sSQLFx.Add('       SUBSTR(CR.CODEXTERNO,1,2) AS DIRETORIA, CR.CODEXTERNO, ') //Peterson Victor SOL 269329 PPM 1298760
    else
       sSQLFx.Add('       SUBSTR(C.CODEXTERNO,1,2) AS DIRETORIA, C.CODEXTERNO, '); //Peterson Victor SOL 269329 PPM 1298760

    sSQLFx.Add('       C.NOME AS CCUSTO, CR.NOME AS CRESPON, ');
    sSQLFx.Add('       P.NOME AS PATRO, PP.NOME AS PLANOPREV ');
    sSQLFx.Add('      , F.IDENTIFICADORDERATEIO              ');  //William Santana - SIG 22407
    sSQLFx.Add('  FROM FLUXOORCADO F, USUARIOSISTEMA UST, ');
    sSQLFx.Add('       CENTCUST C, CENTRESPON CR, PESSOA P, PLANPREVCONTABIL PP, ');
                       { inclui consulta das linhas sintéticas do fluxo }
    sSQLFx.Add('       ('+ GetSqlLinhasFluxo( sParams.iIdFluxo, false, true, false)+') FX ');
    sSQLFx.Add(' WHERE P. IDPESSOA = F.IDPATRO ');
    sSQLFx.Add('   AND F.CODCENTROCUSTO = C.CODCENTROCUSTO(+)    ');
    sSQLFx.Add('   AND F.CODCENTRORESPON = CR.CODCENTRORESPON(+) ');
    sSQLFx.Add('   AND F.IDPLANOPREV = PP.IDPLANOPREV(+)         ');
    sSQLFx.Add('   AND FX.CODLINHAFLUXO = F.CODLINHAFLUXO        ');
    sSQLFx.Add('   AND NVL(F.CODLINHAFLUXO, 0) > 0               ');
    sSQLFx.Add('   AND NVL(F.CODTIPRECDES, 0) = 0                ');
    sSQLFx.Add('   AND ( RTRIM(F.TRGUSERINCLUSAO) = RTRIM(''CM''||TO_CHAR(UST.IDUSUARIO)) ) ');
    sSQLFx.Add('   AND F.DATAPROGRAMADA BETWEEN to_date('+Quotedstr(sParams.sDataIni)+', ''DD/MM/YYYY'') AND to_date('+Quotedstr(sParams.sDataFim)+', ''DD/MM/YYYY'')' );

    Result := sSQLFx.Text;

  finally
    sSQLFx.free;
  end;
end;


function TCtrlMontaFluxo.GetSqlFluxoReal(sParams : TParamRel) : string;
var
  sAgrupa : string;
  sSQLFx  : TStringlist;
begin
  try
    sSQLFx := TStringlist.create;

    case sParams.Agrupa of
       tpDiario  : sAgrupa := '             TO_CHAR(F.DATACFLOAT, ''dd/mm/yyyy'') AS PERIODO, ';
       tpSemanal : sAgrupa := '             TO_CHAR(F.DATACFLOAT, ''IW'') AS PERIODO, ';
       tpMensal  : sAgrupa := '             TO_CHAR(F.DATACFLOAT, ''mm/yyyy'') AS PERIODO, ';
       tpAnual   : sAgrupa := '             TO_CHAR(F.DATACFLOAT, ''YYYY'') AS PERIODO, '; //Cássio Rovaroto - SIG nº 96575
    end;
    {consulta do fluxo realizado onde a vinculação do lançamento é feita pelo desembolsos/recebimentos - CODTIPRECDES }
    sSQLFx.Add('SELECT F.UNIDNEGOC, F.CODCENTRORESPON, F.IDPATRO, F.IDPLANOPREV, F.RECPAG, F.CODCENTROCUSTO, ');
    sSQLFx.Add('      '+sAgrupa );
    sSQLFx.Add('       F.CODTIPRECDES, F.VALOR, ''REAL'' AS TIPO, '' '' USUARIO, FX.CODLINHAFLUXO, FX.FLGGRAU, FX.ORDEM, FX.TIPORECDES AS LINHAFLUXO, ');

    if (sParams.Quebra = 'CRESPON') then
       sSQLFx.Add('       SUBSTR(CR.CODEXTERNO,1,2) AS DIRETORIA, CR.CODEXTERNO, ') //Peterson Victor SOL 269329 PPM 1298760
    else
       sSQLFx.Add('       SUBSTR(C.CODEXTERNO,1,2) AS DIRETORIA, C.CODEXTERNO, '); //Peterson Victor SOL 269329 PPM 1298760

    sSQLFx.Add('       C.NOME AS CCUSTO, CR.NOME AS CRESPON, ');
    sSQLFx.Add('       P.NOME AS PATRO, PP.NOME AS PLANOPREV ');
   sSQLFx.Add('      , 0 IDENTIFICADORDERATEIO              ');  //William Santana - SIG 22407
    sSQLFx.Add('  FROM FLUXOREAL F, ');
    sSQLFx.Add('       CENTCUST C, CENTRESPON CR, PESSOA P, PLANPREVCONTABIL PP, ');
                       { inclui consulta das linhas analiticas do fluxo }
    sSQLFx.Add('       ('+ GetSqlLinhasFluxo( sParams.iIdFluxo, true, false, false)+') FX ');
    sSQLFx.Add(' WHERE P. IDPESSOA = F.IDPATRO ');

    // se tiver filtro por centro de custo ou diretoria remove o left join com a CENTCUST
    if (sParams.iCentCusto > -1) or (sParams.CodDiretoria <> EmptyStr) then
       sSQLFx.Add('   AND F.CODCENTROCUSTO = C.CODCENTROCUSTO ')
    else
       sSQLFx.Add('   AND F.CODCENTROCUSTO = C.CODCENTROCUSTO(+) ');

    sSQLFx.Add('   AND F.CODCENTRORESPON = CR.CODCENTRORESPON(+) ');
    sSQLFx.Add('   AND F.IDPLANOPREV = PP.IDPLANOPREV(+) ');
    sSQLFx.Add('   AND FX.CODTIPRECDES = F.CODTIPRECDES  ');
    sSQLFx.Add('   AND FX.RECPAG = F.RECPAG  ');
    sSQLFx.Add('   AND F.DATACFLOAT BETWEEN to_date('+Quotedstr(sParams.sDataIni)+', ''DD/MM/YYYY'') AND to_date('+Quotedstr(sParams.sDataFim)+', ''DD/MM/YYYY'')' );

    Result := sSQLFx.text;

  finally
    sSQLFx.free;
  end;
end;


function TCtrlMontaFluxo.MontaConsultaPeriodos(sParams : TParamRel): String;
var
   sSQLPer : TStringList;
   sCol    : string;
begin
  sSQLPer := TStringList.create;
  {consulta que cria uma tabela virtual com dados dos períodos escolhidos no agrupamento - diário/semanal/mensal
   campos:
      coluna - determina a posição do dado no relatório de acordo com a orientação escolhida. Retrato 4 colunas / Paisagem 8 colunas
      grupo  - agrupa os dados de 4 em 4 / 8 em 8 de acordo com o no. de colunas possíveis no relatório.

   Esses dois campos posicionam os dados nos relatórios de fluxo, sendo o grupo serve como quebra de página nos relatórios.
   Ou seja, no retrato cabem dados de 4 dias então os 4 primeiros dias do período escolhido farão parte do mesmo grupo, os próximos
   4 dias serão outro grupo e assim sucessivamente. A coluna determina que o 1o dia do grupo será apresentado na coluna 1, o 2o dia
   na coluna 2 e assim por diante.

   obs: No fluxo previsto x realiado considera-se metade das colunas pois cada dia utiliza duas colunas (uma de previsto e a outra
   de realizado)
  }
  try
    if sParams.TipoRelat = trPrevxReal then
       sCol := iff(sParams.OrientaImp = opRetrato, '2', '4')
    else
       sCol := iff(sParams.OrientaImp = opRetrato, '4', '8');

    // criando agrupamento dos dados
    //Everson Cunha - SIG80692 - Início
    //Agrupado no SELECT abaixo, pois estava tendo problemas com a ordenação após migração pro TIBERO
//    sSQLPer.Add('SELECT p.*, ');
//    sSQLPer.Add('       decode(mod(rn, '+sCol+'), 0, '+sCol+', mod(rn, '+sCol+')) as coluna,');
//    sSQLPer.Add('       p.rn -  mod( rn-1, '+sCol+' ) grupo ');
//    sSQLPer.Add('  FROM ( ');
    //Everson Cunha - SIG80692 - Fim

    // gerando campo RN para criar grupos
    sSQLPer.Add('SELECT y.*, '+iff(sParams.Agrupa <> tpSemanal, '', 'to_char( y.SEGUNDA, ''dd/mm'') || '' a '' || to_char( y.SEXTA, ''dd/mm/yyyy'') as DIAS, '));
    sSQLPer.Add('       row_number()  over(  order by 1 ) rn ');
    sSQLPer.Add('       , decode(mod((row_number()  over(  order by 1 )), '+sCol+'), 0, '+sCol+', mod((row_number()  over(  order by 1 )), '+sCol+')) as coluna,');//Everson Cunha - SIG80692
    sSQLPer.Add('       (row_number()  over(  order by 1 )) -  mod((row_number()  over(  order by 1 ))-1, '+sCol+' ) grupo ');                                     //Everson Cunha - SIG80692
    sSQLPer.Add('  FROM ( ');

    { usa o ROWNUM de uma tabela como incremento para gerar x linhas de um período}
    case sParams.Agrupa of
      tpDiario  : begin
                    sSQLPer.Add('SELECT x.dias as PERIODO, x.util, ');
                    sSQLPer.Add('       case ');
                    sSQLPer.Add('         when x.dias - (to_char(x.dias, ''D'')-2) < '+Quotedstr(sParams.sDataIni)+' then to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') ');
                    sSQLPer.Add('         else x.dias - (to_char(x.dias, ''D'')-2) ');
                    sSQLPer.Add('       end SEGUNDA, ');
                    sSQLPer.Add('       case  ');
                    sSQLPer.Add('         when x.dias + (6-to_char(x.dias, ''D'')) > '+Quotedstr(sParams.sDataFim)+' then to_date('+Quotedstr(sParams.sDataFim)+', ''dd-mm-yyyy'') ');
                    sSQLPer.Add('         else x.dias + (6-to_char(x.dias, ''D'')) ');
                    sSQLPer.Add('       end SEXTA, ');
                    sSQLPer.Add('       to_char(x.dias, ''IW'') AS SEMANA,         ');
                    sSQLPer.Add('       to_char(x.dias, ''mm/yyyy'') AS MES        ');
                    sSQLPer.Add('  FROM (SELECT to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') + ROWNUM - 1 DIAS, ');
                    sSQLPer.Add('               calcula_dia_util((to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'' )-1 + ROWNUM - 1), 1) UTIL ');
                    sSQLPer.Add('          FROM all_objects ');
                    sSQLPer.Add('         WHERE ROWNUM <= to_date('+Quotedstr(sParams.sDataFim)+',''dd-mm-yyyy'') - to_date('+Quotedstr(sParams.sDataIni)+',''dd-mm-yyyy'') + 1 ');
                    sSQLPer.Add('       ) X ');
                    sSQLPer.Add(' WHERE X.DIAS = X.UTIL ');
                    sSQLPer.Add(' ORDER BY 2 ');
                  end;
      tpSemanal : begin
                    sSQLPer.Add('SELECT distinct ');
                    sSQLPer.Add('       to_char(x.dias, ''IW'') AS PERIODO, ');
                    sSQLPer.Add('       case ');
                    sSQLPer.Add('         when x.dias - (to_char(x.dias, ''D'')-2) < '+Quotedstr(sParams.sDataIni)+' then to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') ');
                    sSQLPer.Add('         else x.dias - (to_char(x.dias, ''D'')-2) ');
                    sSQLPer.Add('       end SEGUNDA, ');
                    sSQLPer.Add('       case  ');
                    sSQLPer.Add('         when x.dias + (6-to_char(x.dias, ''D'')) > '+Quotedstr(sParams.sDataFim)+' then to_date('+Quotedstr(sParams.sDataFim)+', ''dd-mm-yyyy'') ');
                    sSQLPer.Add('         else x.dias + (6-to_char(x.dias, ''D'')) ');
                    sSQLPer.Add('       end SEXTA ');
                    sSQLPer.Add('  FROM (SELECT to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') + ROWNUM - 1 DIAS, ');
                    sSQLPer.Add('               calcula_dia_util((to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'' )-1 + ROWNUM - 1), 1) UTIL ');
                    sSQLPer.Add('          FROM all_objects ');
                    sSQLPer.Add('         WHERE ROWNUM <= to_date('+Quotedstr(sParams.sDataFim)+',''dd-mm-yyyy'') - to_date('+Quotedstr(sParams.sDataIni)+',''dd-mm-yyyy'') + 1 ');
                    sSQLPer.Add('       ) X ');
                    sSQLPer.Add(' WHERE X.DIAS = X.UTIL ');
                    sSQLPer.Add(' ORDER BY 2 ');
                  end;
      tpMensal  : begin
                    sSQLPer.Add('SELECT distinct ');
                    sSQLPer.Add('       to_char(x.dias, ''mm/yyyy'') AS PERIODO, ');
                    sSQLPer.Add('       to_char(x.dias, ''yyyymm'') AS mesano ');
                    sSQLPer.Add('  FROM (SELECT to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') + ROWNUM - 1 DIAS, ');
                    sSQLPer.Add('               calcula_dia_util((to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'' )-1 + ROWNUM - 1), 1) UTIL ');
                    sSQLPer.Add('          FROM all_objects ');
                    sSQLPer.Add('         WHERE ROWNUM <= to_date('+Quotedstr(sParams.sDataFim)+',''dd-mm-yyyy'') - to_date('+Quotedstr(sParams.sDataIni)+',''dd-mm-yyyy'') + 1 ');
                    sSQLPer.Add('       ) X ');
                    sSQLPer.Add(' WHERE X.DIAS = X.UTIL ');
                    sSQLPer.Add(' ORDER BY 2 ');
                  end;
      //Cássio Rovaroto - SIG nº 96575 - Início
      tpAnual   : begin
                    sSQLPer.Add('SELECT distinct');
                    sSQLPer.Add('      to_char(x.dias, ''yyyy'') AS PERIODO');
                    sSQLPer.Add(' FROM (SELECT to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'') + ROWNUM - 1 DIAS,');
                    sSQLPer.Add('              calcula_dia_util((to_date('+Quotedstr(sParams.sDataIni)+', ''dd-mm-yyyy'' )-1 + ROWNUM - 1), 1) UTIL');
                    sSQLPer.Add('         FROM all_objects');
                    sSQLPer.Add('        WHERE ROWNUM <= to_date('+Quotedstr(sParams.sDataFim)+',''dd-mm-yyyy'') - to_date('+Quotedstr(sParams.sDataIni)+',''dd-mm-yyyy'') + 1');
                    sSQLPer.Add('      ) X');
                    sSQLPer.Add('WHERE X.DIAS = X.UTIL');
                  end;
      //Cássio Rovaroto - SIG nº 96575 - Fim
    end;
    sSQLPer.Add('       ) y ');  // criando grupos
//    sSQLPer.Add(') p ');         // agrupando   //Everson Cunha - SIG80692
//    sSQLPer.Add(' ORDER BY RN ');               //Everson Cunha - SIG80692

    //sSQLPer.SaveToFile('C:\Planus\Temp\periodoFluxo.txt');
    Result := sSQLPer.text;

  finally
    sSQLPer.free;
  end;
end;


function TCtrlMontaFluxo.MontaConsultaPrevCompara(sParams : TParamRel): string;
var
  sSQLComp : TStringList;
  sFiltro  : string;
begin
  try

    // MONTA FILTRO
    if sParams.tipoDoc <> '' then
       sFiltro := sFiltro + ' AND (FC.RECPAG = '+Quotedstr(sParams.tipoDoc)+')';
    // centro de custo e diretoria
    if sParams.iCentCusto > -1 then
       sFiltro := sFiltro + ' AND (FC.CODCENTROCUSTO = '+IntToStr(sParams.iCentCusto)+')'
    else if sParams.CodDiretoria <> EmptyStr then
       sFiltro := sFiltro + ' AND (FC.DIRETORIA = '+Quotedstr(sParams.CodDiretoria)+')';
    // atividade de projeto
    if sParams.iAtividade <> 0 then
       sFiltro := sFiltro + ' AND (FC.UNIDNEGOC = '+IntToStr(sParams.iAtividade)+')';
    // patrocinadora
    if sParams.iPatro > -1 then
       sFiltro := sFiltro + ' AND (FC.IDPATRO = '+IntToStr(sParams.iPatro)+')';
    // plano previdenciario
    if sParams.iPlano > -1 then
       sFiltro := sFiltro + ' AND (FC.IDPLANOPREV = '+IntToStr(sParams.iPlano)+')';

    sSQLComp := TStringList.create;

    sSQLComp.Add('SELECT FC.PERIODO,     ');
    if sParams.Quebra <> '' then
       sSQLComp.Add('       NVL(FC.'+sParams.Quebra+', ''Sem '+sParams.NomeQuebra+''') AS QUEBRA,  ');
    sSQLComp.Add('       FC.TIPO,        ');
    sSQLComp.Add('       FC.USUARIO,     ');
    sSQLComp.Add('       FC.LINHAFLUXO,  ');
    sSQLComp.Add('       FC.RECPAG,      ');
    //Início - William Santana - SIG 22407
    if (sParams.bSintetico) then
      sSQLComp.Add(' SUM(FC.VALOR) VALOR, FC.CODCENTRORESPON , FC.IDENTIFICADORDERATEIO  ')
    else
    //Término - William Santana - SIG 22407
    sSQLComp.Add('       FC.VALOR        ');

    sSQLComp.Add('  FROM ');
                          {insere consulta que retorna dados do fluxo previsto}
    sSQLComp.Add('       ('+ GetSqlFluxoPrevisto(sParams)+') FC ');
    sSQLComp.Add(' WHERE (FC.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp)+')' );

    if sFiltro <> EmptyStr then
       sSQLComp.Add(  sFiltro  );

    //Início - William Santana - SIG 22407
    if (sParams.bSintetico) then
    begin
      sSQLComp.Add(' GROUP BY FC.PERIODO, FC.TIPO, FC.USUARIO, FC.LINHAFLUXO, ');
      sSQLComp.Add(' FC.RECPAG, FC.CODCENTRORESPON , FC.IDENTIFICADORDERATEIO  ');
    end;
    //Término - William Santana - SIG 22407

    sSQLComp.Add(' ORDER BY ');
    if sParams.Quebra <> '' then
       sSQLComp.Add('   FC.'+sParams.Quebra+', ');
    sSQLComp.Add('    FC.PERIODO,');
    sSQLComp.Add('    FC.USUARIO,');
    sSQLComp.Add('    FC.LINHAFLUXO');

    //sSQLComp.SaveToFile('c:\planus\temp\prevcompara.txt');

    Result := sSQLComp.text;

  finally
    sSQLComp.free;
  end;
end;

function TCtrlMontaFluxo.GetDadosComparaPrevisto(sParams: TParamrel): OleVariant;
var
  sSQL : string;
begin
   sSQL := MontaConsultaPrevCompara( sParams );

   Result := GetDataPacket( sSQL );
end;

function TCtrlMontaFluxo.GetTotalCompara(tipo: TTpRelatorio; sParams : TParamRel): OleVariant;
var
  totSQL : string;
begin
  if tipo = trPrevisto then
     totSQL := 'SELECT  TOTAL.PERIODO, '+
               '        SUM(TOTAL.VALOR) AS VALOR '+
               '  FROM ('+
               MontaConsultaPrevCompara(sParams)+
               ') TOTAL '+
               'GROUP BY TOTAL.PERIODO'
  else
     totSQL := 'SELECT  TOTAL.PERIODO, '+
               '        SUM(TOTAL.VLRBAIXA)  AS VLRBAIXA '+
               '  FROM ('+
               MontaConsultaRealCompara(sParams)+
               ') TOTAL '+
               'GROUP BY TOTAL.PERIODO';

  Result := GetDataPacket( totSQL );
end;


function TCtrlMontaFluxo.VerificaLinhaSintetica(iCodLinha: integer): boolean;
begin
  // consulta linhas que sejam sintéticas
  _cds.data := GetDataPacket('select m.* '+
                             '  from montafluxo m '+
                             ' where m.tipocalculo <> ''T'' '+
                             '   and not exists (select 1 from compfluxo c '+
                             '                    where c.codcomplinha = m.codlinhafluxo)' );

  result := _cds.Locate('CODLINHAFLUXO', iCodLinha, [loCaseInsensitive]);

end;


function TCtrlMontaFluxo.GetDocumentosCompara(sParams: TParamrel; sDia, sDesembRec : string): OleVariant;
var
  sSqlDoc : TStringList;
  sFiltro : string;
begin
  try

    // MONTA FILTRO
    // centro de custo e diretoria
    if sParams.iCentCusto > -1 then
       sFiltro := sFiltro + ' AND (RAT1.CODCENTROCUSTO = '+IntToStr(sParams.iCentCusto)+')'
    else if sParams.CodDiretoria <> EmptyStr then
       sFiltro := sFiltro + ' AND (SUBSTR(C.CODEXTERNO,1,2) = '+Quotedstr(sParams.CodDiretoria)+')';
    // atividade de projeto
    if sParams.iAtividade <> 0 then
       sFiltro := sFiltro + ' AND (RAT1.UNIDNEGOC = '+IntToStr(sParams.iAtividade)+')';
    // patrocinadora
    if sParams.iPatro > -1 then
       sFiltro := sFiltro + ' AND (RAT1.IDPATRO = '+IntToStr(sParams.iPatro)+')';
    // plano previdenciario
    if sParams.iPlano > -1 then
       sFiltro := sFiltro + ' AND (RAT1.IDPLANOPREV = '+IntToStr(sParams.iPlano)+')';

    sSQlDoc := TStringList.create;

    sSQlDoc.Add('SELECT ''N'' AS LANCADO, DOC.CODDOCUMENTO, SUM(DOC.VLRDOC + DOC.VLRALT) VRLLIQ, SUM(DOC.VLRBAIXA) VLRDOC, DOC.CEDENTE ');
    sSQlDoc.Add('  FROM ( ');
    sSQlDoc.Add('        SELECT DECODE(D.IDMODULO,  15, DECODE(D.CODPORTFORMA, 104, 0, 200, 0, L.CODDOCUMENTO), ');
    sSQlDoc.Add('                                  456, DECODE(D.CODPORTFORMA, 105, 0, 199, 0, L.CODDOCUMENTO), L.CODDOCUMENTO) AS CODDOCUMENTO, ');
    sSQlDoc.Add('               D.IDMODULO, D.CODPORTFORMA, D.IDFORCLI, ');
    sSQlDoc.Add('               DECODE(D.IDMODULO,  15, DECODE(D.CODPORTFORMA, 104, ''Sicov 6002'', 200, ''Sicov 6002'', P.RAZAOSOCIAL), ');
    sSQlDoc.Add('                                  456, DECODE(D.CODPORTFORMA, 105, ''Sicov 6034'', 199, ''Sicov 6034'', P.RAZAOSOCIAL), P.RAZAOSOCIAL) AS CEDENTE, ');
    sSQlDoc.Add('               SUM(DECODE(L.OPERACAO, 2, L.VALOR, 0)) AS VLRDOC,       ');

    if sParams.tipoDoc = 'R' then
      sSQlDoc.Add('             SUM( DECODE(L.OPERACAO, 4, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1), 0)) VLRALT, ')
    else
      sSQlDoc.Add('             SUM( DECODE(L.OPERACAO, 4, DECODE(L.DEBCRE, ''C'', L.VALOR, L.VALOR*-1), 0)) VLRALT, ');

//  sSQlDoc.Add('               SUM(DECODE(L.OPERACAO, 5, L.VALOR, 0)) AS VLRBAIXA '); //Peterson SIG 21842
    sSQlDoc.Add('               DECODE(L.OPERACAO, 5, rat_crespon.VALOR, 0) AS VLRBAIXA '); //Peterson SIG 21842


	//Marcio Sanches Spinosa SOL 247104 PPM 693475 - Inicio
//    sSQlDoc.Add('          FROM LANCTODOCUM L, DOCUMENTO D, PESSOA P ');
    sSQlDoc.Add('          FROM LANCTODOCUM L ') ;
    sSqlDoc.Add(' INNER JOIN DOCUMENTO D ON (D.IDPESSOA = L.IDPESSOA AND L.CODDOCUMENTO = D.CODDOCUMENTO) ');
    sSqlDoc.Add(' INNER JOIN PESSOA P ON (P.IDPESSOA = D.IDFORCLI) ');

      //Peterson SIG 21842 - Inicio
//    sSQlDoc.Add('           INNER JOIN (select distinct ld1.coddocumento from lanctodocum ld1, rateiodocum rat1, documento dc  '); //SOL 266236 PPM 1210745
//    sSQlDoc.Add('                        where dc.coddocumento = rat1.coddocumento and rat1.coddocumento = ld1.coddocumento '); //SOL 266236 PPM 1210745
//    //sSQlDoc.Add('                          and ld1.datalancto = '+Quotedstr(sDia) ); //SOL 266236 PPM 1210745
//    sSQlDoc.Add('   AND dc.datadisponib = '+Quotedstr(sDia) ); //SOL 266236 PPM 1210745
//    sSQlDoc.Add('                          and ld1.operacao = 5 ');
//
//    if sDesembRec <> EmptyStr then
//       sSQlDoc.Add('                          and TRIM(rat1.CODTIPRECDES) = '+QuotedStr(sDesembRec) );
//    if sParams.iCentroResp > -1 then
//       sSQlDoc.Add('                          and rat1.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp) );


    sSqlDoc.Add(' INNER JOIN ( SELECT DISTINCT ld1.coddocumento,  LD1.VALOR ');
    sSqlDoc.Add('              FROM lanctodocum ld1, rateiodocum rat1, documento dc, RECBTOPAGTO RB, MOVIMFINANC M');
    sSqlDoc.Add('              WHERE dc.coddocumento = rat1.coddocumento and rat1.coddocumento = ld1.coddocumento');
    sSqlDoc.Add('                    AND ld1.operacao = 5');

    if sDesembRec <> EmptyStr then
       sSQlDoc.Add('                 AND TRIM(rat1.CODTIPRECDES) = ' + QuotedStr(sDesembRec) );

    if sParams.iCentroResp > -1 then
       sSQlDoc.Add('                 AND rat1.CODCENTRORESPON = ' + IntToStr(sParams.iCentroResp) );

    sSqlDoc.Add('                    AND DC.CODDOCUMENTO = RB.CODDOCUMENTO');
    sSqlDoc.Add('                    AND RB.CODLANCFINANC = M.CODLANCFINANC');
    sSqlDoc.Add('                    AND M.DATADISPFINANC = ' + Quotedstr(sDia));
    sSqlDoc.Add('                    AND LD1.NUMLANCTO = RB.NUMLANCTO');

    //Peterson SIG 21842 - Fim

    if sFiltro <> EmptyStr then
       sSQlDoc.Add( sFiltro );

    sSqlDoc.Add( ' ) rat_crespon ON (l.coddocumento = rat_crespon.coddocumento) ');

//    sSQlDoc.Add('         WHERE D.IDPESSOA = L.IDPESSOA              ');
//    sSQlDoc.Add('           AND P.IDPESSOA = D.IDFORCLI(+)           ');
//    sSQlDoc.Add('           AND L.CODDOCUMENTO = D.CODDOCUMENTO      ');
//    sSQlDoc.Add('           AND D.RECPAG = '+Quotedstr(sParams.TipoDoc) );
//    sSQlDoc.Add('           AND L.VALOR > 0 ');

    sSQlDoc.Add('INNER JOIN RECBTOPAGTO RB ON (RB.CODDOCUMENTO = L.CODDOCUMENTO) '); // Peterson Victor SOL 270229 PPM 1377167
    sSQlDoc.Add('INNER JOIN PORTADORFORMA PF ON(RB.CODPORTFORMA = PF.CODPORTFORMA AND PF.LANCAFINANC = ' + QuotedStr('S') + ')' ); // Peterson Victor SOL 270229 PPM 1377167

    sSQlDoc.Add('         WHERE D.RECPAG = '+Quotedstr(sParams.TipoDoc) );
    sSQlDoc.Add('           AND L.VALOR > 0 ');


//    sSQlDoc.Add('           and exists (select 1 from lanctodocum l1, rateiodocum rat ');
//    sSQlDoc.Add('                        where rat.coddocumento = l1.coddocumento ');
//    sSQlDoc.Add('                          and l1.coddocumento = l.coddocumento ');
//    sSQlDoc.Add('                          and l1.datalancto = '+Quotedstr(sDia) );
//    sSQlDoc.Add('                          and l1.operacao = 5 ');

//    if sDesembRec <> EmptyStr then
//       sSQlDoc.Add('                          and TRIM(rat.CODTIPRECDES) = '+QuotedStr(sDesembRec) );

//    if sParams.iCentroResp > -1 then
//       sSQlDoc.Add('                          and rat.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp) );

//    if sFiltro <> EmptyStr then
//       sSQlDoc.Add( sFiltro );

//    sSQlDoc.Add('                      ) ');
//Marcio Sanches Spinosa SOL 247104 PPM 693475 - Fim
    sSQlDoc.Add('         GROUP BY L.CODDOCUMENTO, D.IDMODULO, D.IDFORCLI, D.CODPORTFORMA, P.RAZAOSOCIAL, L.OPERACAO, rat_crespon.VALOR ');     //Peterson SIG 21842

    sSQlDoc.Add('       ) DOC ');
    sSQlDoc.Add(' GROUP BY DOC.CODDOCUMENTO, DOC.CEDENTE ');
    sSQlDoc.Add(' ORDER BY DOC.CEDENTE ');

    Result := GetDataPacket( sSQLDoc.text );

  finally
    sSQLDoc.free;
  end;
end;


function TCtrlMontaFluxo.MontaConsultaRealCompara(sParams: TParamRel;
                                                  const bUsaDtDisponibilidade : boolean) : String;  // edilaine - SOL 250388 / PPM 722851
var
  realSQL : TStringList;
  sFiltro : string;
begin
  try
    // MONTA FILTRO
    // centro de custo e diretoria
    if sParams.iCentCusto > -1 then
       sFiltro := sFiltro + ' AND (RAT.CODCENTROCUSTO = '+IntToStr(sParams.iCentCusto)+')'
    else if sParams.CodDiretoria <> EmptyStr then
       sFiltro := sFiltro + ' AND (SUBSTR(C.CODEXTERNO,1,2) = '+Quotedstr(sParams.CodDiretoria)+')';
    // atividade de projeto
    if sParams.iAtividade <> 0 then
       sFiltro := sFiltro + ' AND (RAT.UNIDNEGOC = '+IntToStr(sParams.iAtividade)+')';
    // patrocinadora
    if sParams.iPatro > -1 then
       sFiltro := sFiltro + ' AND (RAT.IDPATRO = '+IntToStr(sParams.iPatro)+')';
    // plano previdenciario
    if sParams.iPlano > -1 then
       sFiltro := sFiltro + ' AND (RAT.IDPLANOPREV = '+IntToStr(sParams.iPlano)+')';

     {consulta que retorna dados de baixa dos documentos - total e parcial}
     realSQL := TStringList.create;


     realSQL.Add('SELECT DR.PERIODO, DR.CODTIPRECDES, DR.DESEMBOLSO, SUM(DR.VALOR) as VLRBAIXA  ');
     if sParams.Quebra <> EmptyStr then
        realSQL.Add('       , NVL(DR.'+sParams.Quebra+', ''Sem '+sParams.NomeQuebra+''') AS QUEBRA ');

     realSQL.Add('  FROM ( ');

     // edilaine - SOL 250388 / PPM 722851 - inicio
     if not bUsaDtDisponibilidade then
        realSQL.Add('SELECT M.DATADISPFINANC AS PERIODO, RAT.CODTIPRECDES, TRD.DESCRICAO AS DESEMBOLSO, RAT.VALOR, ') //SOL 266236 PPM 1210745
     else
        realSQL.Add('SELECT M.DATADISPFINANC AS PERIODO, RAT.CODTIPRECDES, TRD.DESCRICAO AS DESEMBOLSO, RAT.VALOR, ');
     // edilaine - SOL 250388 / PPM 722851 - fim

     realSQL.Add('       C.NOME AS CCUSTO, P.NOME AS PATRO, PP.NOME AS PLANOPREV ');
     realSQL.Add('  FROM RATEIOFINANC RAT, MOVIMFINANC M, CENTCUST C, TIPORECEBDESEMB TRD, PESSOA P, PLANPREVCONTABIL PP');
     //realSQL.Add(' WHERE C.CODCENTROCUSTO = RAT.CODCENTROCUSTO        ');     // edilaine - SOL 250317 / PPM 713526
     realSQL.Add(' WHERE C.CODCENTROCUSTO(+) = RAT.CODCENTROCUSTO        ');    // edilaine - SOL 250317 / PPM 713526
     realSQL.Add('   AND RAT.CODLANCFINANC = M.CODLANCFINANC          ');
     realSQL.Add('   AND TRD.CODTIPRECDES = RAT.CODTIPRECDES          ');
     realSQL.Add('   AND P.IDPESSOA = RAT.IDPATRO                     ');
     realSQL.Add('   AND RAT.CODCENTROCUSTO = C.CODCENTROCUSTO(+)     ');
     realSQL.Add('   AND RAT.IDPLANOPREV = PP.IDPLANOPREV(+)          ');

     // edilaine - SOL 250388 / PPM 722851 - inicio
     if not bUsaDtDisponibilidade then
        realSQL.Add('   AND M.DATADISPFINANC BETWEEN to_date('+Quotedstr(sParams.sDataIni)+', ''DD/MM/YYYY'') AND to_date('+Quotedstr(sParams.sDataFim)+', ''DD/MM/YYYY'')' )
     else
        realSQL.Add('   AND M.DATADISPFINANC BETWEEN to_date('+Quotedstr(sParams.sDataIni)+', ''DD/MM/YYYY'') AND to_date('+Quotedstr(sParams.sDataFim)+', ''DD/MM/YYYY'')' );
     // edilaine - SOL 250388 / PPM 722851 - fim

     realSQL.Add('   AND TRD.RECPAG = '+Quotedstr(sParams.TipoDoc) );
     realSQL.Add('   AND RAT.RECPAG = '+Quotedstr(sParams.TipoDoc) );

     if sParams.iCentroResp > -1 then
        realSQL.Add('   AND RAT.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp) );

     if sFiltro <> EmptyStr then
        realSQL.Add( sFiltro );

     realSQL.Add('       ) DR ');
     realSQL.Add(' GROUP BY  ');
     if sParams.Quebra <> EmptyStr then
        realSQL.Add('      DR.'+sParams.Quebra+', ');
     realSQL.Add('      DR.PERIODO, DR.CODTIPRECDES, DR.DESEMBOLSO ');
     realSQL.Add('ORDER BY');
     if sParams.Quebra <> EmptyStr then
        realSQL.Add('      DR.'+sParams.Quebra+', ');
     realSQL.Add('      DR.PERIODO, DR.CODTIPRECDES ');

     result := realSQL.text;

   finally
     realSQL.free;
   end;

end;

function TCtrlMontaFluxo.GetDocumentosxDesembReceb(sParams: TParamrel; sDia : string): OleVariant;
var
  sDocxTRD : TStringList;
  sFiltro  : string;
begin
  try
    // MONTA FILTRO
    // centro de custo e diretoria
    if sParams.iCentCusto > -1 then
       sFiltro := sFiltro + ' AND (RAT.CODCENTROCUSTO = '+IntToStr(sParams.iCentCusto)+')'
    else if sParams.CodDiretoria <> EmptyStr then
       sFiltro := sFiltro + ' AND (SUBSTR(C.CODEXTERNO,1,2) = '+Quotedstr(sParams.CodDiretoria)+')';
    // atividade de projeto
    if sParams.iAtividade <> 0 then
       sFiltro := sFiltro + ' AND (RAT.UNIDNEGOC = '+IntToStr(sParams.iAtividade)+')';
    // patrocinadora
    if sParams.iPatro > -1 then
       sFiltro := sFiltro + ' AND (RAT.IDPATRO = '+IntToStr(sParams.iPatro)+')';
    // plano previdenciario
    if sParams.iPlano > -1 then
       sFiltro := sFiltro + ' AND (RAT.IDPLANOPREV = '+IntToStr(sParams.iPlano)+')';

     {consulta que retorna dados de baixa dos documentos - total e parcial}
     sDocxTRD := TStringList.create;

     sDocxTRD.Add('SELECT DISTINCT ');
     sDocxTRD.Add('       DECODE(D.IDMODULO,  15, DECODE(D.CODPORTFORMA, 104, 0, 200, 0, D.CODDOCUMENTO), ');
     sDocxTRD.Add('                          456, DECODE(D.CODPORTFORMA, 105, 0, 199, 0, D.CODDOCUMENTO), D.CODDOCUMENTO) AS CODDOCUMENTO, ');
     sDocxTRD.Add('       RAT.CODTIPRECDES, ');
     sDocxTRD.Add('       DECODE(D.IDMODULO,  15, DECODE(D.CODPORTFORMA, 104, ''Sicov 6002'', 200, ''Sicov 6002'', P.RAZAOSOCIAL), ');
     sDocxTRD.Add('                          456, DECODE(D.CODPORTFORMA, 105, ''Sicov 6034'', 199, ''Sicov 6034'', P.RAZAOSOCIAL), P.RAZAOSOCIAL) AS CEDENTE ');
     sDocxTRD.Add('  FROM LANCTODOCUM L, DOCUMENTO D, RATEIODOCUM RAT, PESSOA P ');
     sDocxTRD.Add(' WHERE RAT.IDPESSOA = L.IDPESSOA                   ');
     sDocxTRD.Add('   AND D.IDPESSOA = L.IDPESSOA                     ');
     sDocxTRD.Add('   AND P.IDPESSOA = D.IDFORCLI                     ');
     sDocxTRD.Add('   AND RAT.CODDOCUMENTO = D.CODDOCUMENTO           ');
     sDocxTRD.Add('   AND L.CODDOCUMENTO = D.CODDOCUMENTO             ');
     sDocxTRD.Add('   AND L.VALOR > 0                                 ');
     sDocxTRD.Add('   AND D.RECPAG = '+Quotedstr(sParams.TipoDoc) );
     sDocxTRD.Add('   AND L.OPERACAO = 5  ');
     //sDocxTRD.Add('   AND L.DATALANCTO = TO_DATE('+Quotedstr(sDia)+', ''DD/MM/YYYY'')' );  //SOL 266236 PPM 1210745
     sDocxTRD.Add('   AND D.DATADISPONIB = TO_DATE('+Quotedstr(sDia)+', ''DD/MM/YYYY'')' );  //SOL 266236 PPM 1210745

     if sParams.iCentroResp > -1 then
     sDocxTRD.Add('   AND RAT.CODCENTRORESPON = '+IntToStr(sParams.iCentroResp) );

     if sFiltro <> EmptyStr then
        sDocxTRD.Add( sFiltro );

     sDocxTRD.Add('ORDER BY 3 ');

     result := GetDataPacket( sDocxTRD.text );

   finally
     sDocxTRD.free;
   end;

end;

end.
