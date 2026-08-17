//************************************************************************************************//
// Data      : 18/07/2007
// Código    : AL_5
// Descrição : Ajuste no SQL para trazer o identificador da cotação
//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_4
// Pendencia : 22362
// SOL       : 43207
// Descrição : Ajuste no SQL para pegar Imoveis carimbados por Plano Patro na ParamGlobal quando
//             a tabela PLANOPATROXIMOVEL estiver vazia (Carimbados na origem)
//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_3
// Pendencia : 22362
// SOL       : 43207
// Descrição : Retirando a variável com "array" de idativos das queries, nenhum banco faz a
//              cláusula IN com mais de 1000 itens
//************************************************************************************************//
// Data      : 26/08/2005
// Código    : AL_2
// Descrição : Acerta a CarregaDadosEmpresa para buscar a empresa pela tabela FUNDACAO
//************************************************************************************************//
// Data      : 12/08/2005
// Código    : AL_1
// Descrição : Cria campo GRUPO na query AtivosConsolidados
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaDtFinalxDtFech
Data      : 19/01/2005
---------------------------------------------------------------------------------------------------}
unit uCtrlHstMovCota;

interface

uses
     DB, uDatabase, uCmControlObject, Messages, dbClient, StdCtrls, Sysutils,
     uSistema, dBasedados, uCmTypes, CmEventosCadastro, uCmClientdataset,
     dbtables, uMensErro, uMidasUtil, uCtrlPlanPrevContabPatro, uCmSQLParams, Classes, uDbHstMovCota,
     uCMFileUtils, uCtrlListTerceiros;


  type

    TCtrlHstMovCota = class(TCmControlObject)


    private
    FcdsHstMovCota: TCmClientDataSet;
    FDbHstMovCota : TDbHstMovCota;
    CtrlListTerceiros : TCtrlListTerceiros;

    procedure SetcdsHstMovCota(const Value: TCmClientDataSet);
    procedure SetDbHstMovCota (const Value: TDbHstMovCota);

    protected
       procedure AfterInitialize; override;
       procedure OnCreateAppserver; override;
       procedure MensErroMt(sMsgInfo: string);

    public

       constructor Create;  override;
       destructor Destroy;  override;

       property cdsHstMovCota : TCmClientDataSet read FcdsHstMovCota write SetcdsHstMovCota;
       property DbHstMovCota  : TDbHstMovCota    read FDbHstMovCota  write SetDbHstMovCota;


       function  ListaHistMovAtivos (const iIdHstMovCota     : integer = -1;
                                     const iIdAtivoCota      : integer = -1;
                                     const iIdLote           : integer = -1;
                                     const iIdPlanoPrev      : integer = -1;
                                     const iIdPatro          : integer = -1;
                                     const iIdCotaImportacao : integer = -1) : OleVariant;

       function  ListaPatro         : OleVariant;
       function  ListaPlanoContabil : OleVariant;
       function  ListaPlanoPrev     : OleVariant;
       function  ValidaIdCampo      (const iIdCampo : integer): OleVariant;
       function  GetSequenceIdCotaImportacao : integer;
       function  GravaHstMovCota    : Boolean;
       function  ValidaPlanoPatro(const iIdPlano: integer =-1; const iIdPatro: integer =-1): Boolean;
       function  GravaLoteHstMovCota (iIDAtivocota,iIDCotaTipoOper,
                                      iIDPlanoPrev,iIdPatro,iIdCotaImportacao: integer;
                                      fValor: Double;
                                      dData : TDateTime): Boolean;

       function  ListaCdsLstAtivos: OleVariant;
       function  ListaCdsAtivosAConsolidar : OleVariant;
       function  ListaCdsAtivosConsolidados: OleVariant;
       //AL_03
       function  ListaAtivosIdentificados(cdsAtivos: TCMClientDataSet): OleVariant;
       function  ListaSQLEntradaRegra(sDataInicio,sDataFinal,sPercentual,sTaxaJuros: string): string;
       //AL_03
       function  ListaEstatisticasAtivos(cdsAtivos: TCMClientDataSet;
                                         sDataIni,sDataFim: string;
                                         iIdPlano    : integer = -1;
                                         iIdPatro    : integer = -1;
                                         iIdPlanoSPC : Integer = -1): OleVariant;
       function  ListaRegraIndexador : OleVariant;
       function  CarregaDadosEmpresa : OleVariant;
       function  FiltraRelatorio(iIdAtivo,iIdPlano,iIdPatro: integer;
                                 dInicio,dFim: TdateTime) : OleVariant;



       function  MovCotaEmprestimo(iIdAtivo,iIDPlano,iIdPatro: integer;
                                   dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoManual(iIdAtivo,iIDPlano,iIdPatro: integer;
                                    dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoFundoRendaFixa(iIdAtivo,iIDPlano,iIdPatro: integer;
                                            dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoFundoRendaVariavel(iIdAtivo,iIDPlano,iIdPatro: integer;
                                                dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoFundoImobiliario(iIdAtivo,iIDPlano,iIdPatro: integer;
                                                   dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoFundoDIC(iIdAtivo,iIDPlano,iIdPatro: integer;
                                                   dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoInvestRendaFixa(iIdAtivo,iIDPlano,iIdPatro: integer;
                                             dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoInvestRendaVariavel(iIdAtivo,iIDPlano,iIdPatro: integer;
                                                 dDtInicio,dDtFim: TDateTime): OleVariant;

       function  MovCotaAtivoImobiliario(iIdAtivo,iIDPlano,iIdPatro: integer;
                                         dDtInicio,dDtFim: TDateTime): OleVariant;


       function  ComposicaoPerfil : OleVariant;

       function  TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;

       function  ExisteAtivo(cCds: TCMClientDataSet; sCampo, sAtivo: String): Boolean;


    published

  end;



Var
  CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;




implementation

{ TCtrlHstMovCota }

procedure TCtrlHstMovCota.AfterInitialize;
begin
  inherited;
  FDbHstMovCota.DataBaseName := DataBaseName;
  CtrlListTerceiros.InitializeAs(Self);
end;


constructor TCtrlHstMovCota.Create;
begin
  inherited;
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  FDbHstMovCota := TDbHstmovcota.Create(Self);

  CtrlPlanPrevContabPatro  :=  TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                      MensErroMT);

end;

destructor TCtrlHstMovCota.Destroy;
begin
  FreeAndNil (FDbHstmovcota);
  // Destrói os Cd's criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
  FreeAndNil (FCdsHstmovcota);
  FreeAndNil(CtrlListTerceiros);
  inherited;

end;



function TCtrlHstMovCota.GetSequenceIdCotaImportacao: integer;
var
Sequence: integer;

begin
  Sequence := DbHstMovCota.GetSequenceIdHSTMOVCOTA;
  Result := Sequence;

end;



function TCtrlHstMovCota.GravaHstMovCota: Boolean;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaHstMovCota( CdsHstMovCota.Data );
    if not Result then
    MessageInfo := Connection.AppServer.MessageInfo;
  end else
  try
    StartTransaction;

    Result := ApplyCds(cdsHstMovCota, DbHstMovCota,[],[]);

    if not Result then
    raise Exception.Create(DbHstMovCota.MessageInfo);

    Commit;
  except
    on E : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;






function TCtrlHstMovCota.GravaLoteHstMovCota(iIDAtivocota,iIDCotaTipoOper,
         iIDPlanoPrev,iIdPatro,iIdCotaImportacao: integer; fValor: Double; dData : TDateTime)  : Boolean;

begin

  Try

    StartTransaction;
    FDbHstMovCota.Clear;
    FDbHstMovCota.Idativocota.AsInteger      := iIDAtivocota;
    FDbHstMovCota.Idcotatipooper.AsInteger   := iIDCotaTipoOper;
    FDbHstMovCota.Idplanoprev.AsInteger      := iIDPlanoPrev;
    FDbHstMovCota.Idpatro.AsInteger          := iIdPatro;
    FDbHstMovCota.Data.AsDateTime            := dData;
    FDbHstMovCota.Valor.AsFloat              := fValor;

    Result := DbHstMovCota.Insert;

    if not Result then
    raise Exception.Create(DbHstMovCota.MessageInfo);

    Commit;

  except
    on E : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;




function TCtrlHstMovCota.ListaHistMovAtivos(const iIdHstMovCota,
  iIdAtivoCota, iIdLote, iIdPlanoPrev,
  iIdPatro,iIdCotaImportacao: integer): OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  H.IDHSTMOVCOTA, H.IDATIVOCOTA, H.IDCOTATIPOOPER, '          + #13 +
          '  H.DATA, H.VALOR, H.IDPLANOPREV, H.IDPATRO,                 '+ #13 +
          '  A.DESCRICAO AS DESCATIVO, T.DESCTIPOOPER AS DESCTIPOOPER, ' + #13 +
          '  PL.NOME AS DESCPLANO, P.NOME AS DESCPATRO '                 + #13 +

          'FROM '                                                        + #13 +
          '  HSTMOVCOTA H, ATIVOCOTA A, COTATIPOOPER T, PLANPREVCONTABIL PL, '+ #13 +
          '  PESSOA P, PATRO PR '                                        + #13 +

          'WHERE '                                                       + #13 +
          '    A.IDATIVOCOTA    = H.IDATIVOCOTA '                        + #13 +
          'AND T.IDCOTATIPOOPER = H.IDCOTATIPOOPER '                     + #13 +
          'AND PL.IDPLANOPREV   = H.IDPLANOPREV '                        + #13 +
          'AND P.IDPESSOA       = PR.IDPESSOA '                          + #13 +
          'AND PR.IDPESSOA      = H.IDPATRO ';
          if iIdHstMovCota <> -1 then
          sSQL := sSQL + ' AND H.IDHSTMOVCOTA = ' + IntToStr(iIdHstMovCota);
          if iIdAtivoCota <> - 1 then
          sSQl := sSQL + ' AND H.IDATIVOCOTA  = ' + IntToStr(iIdAtivoCota);
          if iIdPlanoPrev <> -1 then
          sSQL := sSQL + ' AND H.IDPLANOPREV  = ' + IntToStr(iIdPlanoPrev);
          if iIdPatro <> -1 then
          sSQl := sSQL + ' AND H.IDPATRO = ' + IntToStr(iIdPatro);
          if iIdCotaImportacao <> -1 then
          sSQL := sSQL + 'AND IDCOTAIMPORTACAO = ' + IntToStr(iIdCotaImportacao);

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.ListaPatro: OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          'PPA.NOME AS NOMEPATRO, '                                      + #13 +
          'PTR.IDPESSOA AS IDPATRO  '                                    + #13 +
          'FROM '                                                        + #13 +
          'PESSOA PPA, '                                                 + #13 +
          'PATRO  PTR '                                                  + #13 +
          'WHERE '                                                       + #13 +
          'PTR.IDPESSOA = PPA.IDPESSOA '                                 + #13 +
          'ORDER BY NOMEPATRO ';

  Result := GetDataPacket(sSQL);
end;


function TCtrlHstMovCota.ListaPlanoPrev: OleVariant;
var
sSQL: string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  IDPLANOPREV, NOME AS NOMEPLANO'                             + #13 +
          'FROM '                                                        + #13 +
          '  PLANPREV '                                                  + #13 +
          'ORDER BY NOMEPLANO ';

  Result := GetDataPacket(sSQL);
end;


function TCtrlHstMovCota.ListaPlanoContabil: OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  IDPLANOPREV, '                                              + #13 +
          '  NOME AS NOMEPLANO '                                         + #13 +
          'FROM '                                                        + #13 +
          '  PLANPREVCONTABIL '                                          + #13 +
          'ORDER BY NOMEPLANO ';

  Result := GetDataPacket(sSQL);

end;

procedure TCtrlHstMovCota.MensErroMt(sMsgInfo: string);
begin
 //forma a mensagem de erro
  sMsgInfo := DbHstMovCota.MessageInfo;
end;

procedure TCtrlHstMovCota.OnCreateAppserver;
begin

  FcdsHstMovCota := TCMClientDataSet.Create(nil);
   inherited;


end;

procedure TCtrlHstMovCota.SetcdsHstMovCota(const Value: TCmClientDataSet);
begin
  FcdsHstMovCota := Value;
end;

procedure TCtrlHstMovCota.SetDbHstMovCota(const Value: TDbHstMovCota);
begin
  FDbHstMovCota  := Value;
end;


function TCtrlHstMovCota.ValidaIdCampo(const iIdCampo : integer): OleVariant;
var
sSQL: string;

begin
  sSQL := 'SELECT IDATIVOCOTA FROM ATIVOCOTA '                           + #13 +
          'WHERE DESCRICAO IS NOT NULL '                                 + #13 +
          'AND IDATIVOCOTA = '  + IntToStr(iIdCampo);
  _Cds.Data := GetDataPacket(sSQL);

  if _Cds.RecordCount > 0 then
    Result := True
  else Result := False;

end;

function TCtrlHstMovCota.ValidaPlanoPatro(const iIdPlano: integer; const iIdPatro: integer): Boolean;
begin
  _Cds.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(iIdPlano,iIdPatro);
  if _Cds.RecordCount <> 0 then
    Result := true
  else
    Result := False;
end;


function TCtrlHstMovCota.ListaCdsLstAtivos: OleVariant;
var sSQL: string;
begin
   sSQL   := 'SELECT 0 AS IDATIVOCOTA FROM DUAL';
   Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.ListaCdsAtivosAConsolidar: OleVariant;
var
sSQL: string;

begin
 sSQL   := 'SELECT '                                                     + #13 +
           '''          '' AS IDATIVOCOTA '                              + #13 +
           'FROM '                                                       + #13 +
           '  ATIVOCOTA '                                                + #13 +
           'WHERE '                                                      + #13 +
           '  IDATIVOCOTA = -1';
 Result := GetDataPacket(sSQL);
end;



function TCtrlHstMovCota.ListaCdsAtivosConsolidados: OleVariant;
var
sSQL: string;

begin
   // AL_1
   sSQL :=
          'SELECT '                                       + #13 +
          '   0 AS GRUPO, '                               + #13 +
          '   TO_DATE(''0'',''DD/MM/YYYY'') AS DATA, '    + #13 +
          '   0 AS VLRPATRIMONIOINI, '                    + #13 +
          '   0 AS VLRPATRIMONIOFIM, '                    + #13 +
          '   0 AS QTDCOTAINI, '                          + #13 +
          '   0 AS QTDCOTAFIM, '                          + #13 +
          '   0 AS VLRCOTA, '                             + #13 +
          '   0 AS VLRCOTIZADO, '                         + #13 +
          '   0 AS VLRRENTABILIZADO, '                    + #13 +
          '   0 AS PERCENTDIA, '                          + #13 +
          '   0 AS PERCENTPERIODO '                       + #13 +
          'FROM '                                         + #13 +
          '   DUAL '                                      + #13 +
          'WHERE '                                        + #13 +
          '   1 = 2 '  ;

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.ListaAtivosIdentificados(cdsAtivos: TCMClientDataSet): OleVariant;
var sSQL: string;
    i: Integer;
begin
   i := 0;
   //AL_3
   cdsAtivos.First;
   sSQL := 'SELECT '                                                            + #13 +
           '  DECODE (A.IDFUNDOINVEST,NULL, '                                   + #13 +
           '  DECODE (A.IDINVESTIMENTO,NULL, '                                  + #13 +
           '  DECODE (A.IDTIPOCONTREMPTMO,NULL, '                               + #13 +
           '  DECODE (A.IDIMOVEL,NULL, '                                        + #13 +
           '  DECODE (A.DESCRICAO,NULL,'''',''M''), '                           + #13 +
           '         ''3''), '                                                  + #13 +
           '         ''4''), '                                                  + #13 +
           '         (SELECT T.IDTIPOINVEST FROM TIPOINVEST T, INVESTIMENTO I ' + #13 +
           '          WHERE '                                                   + #13 +
           '                T.IDTIPOINVEST = I.IDTIPOINVEST '                   + #13 +
           '          AND I.IDINVESTIMENTO = A.IDINVESTIMENTO)), '              + #13 +
           '         (SELECT T.IDTIPOINVEST FROM TIPOINVEST T, FUNDOINVEST F, TIPOFUNDOINVEST TF ' + #13 +
           '          WHERE '                                                   + #13 +
           '              T.IDTIPOINVEST       = TF.IDTIPOINVEST '              + #13 +
           '          AND TF.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST '          + #13 +
           '          AND F.IDFUNDOINVEST      = A.IDFUNDOINVEST)) AS TIPO '    + #13 +
           'FROM '                                                              + #13 +
           '    ATIVOCOTA A '                                                   + #13 +
           'WHERE '                                                             + #13 +
           '    A.IDATIVOCOTA IN(' + cdsAtivos.Fields[0].AsString;
   cdsAtivos.Next;
   while not cdsAtivos.Eof do
   begin
      Inc(i);
      if i > 999 then
      begin
         sSQL := sSQL + ') OR ' + #13 + 'A.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
         i := 0;
      end
      else
         sSQL := sSQL + ', ' + cdsAtivos.Fields[0].AsString;
      cdsAtivos.Next;
   end;
   sSQL := sSQL + ') '                                                          + #13 +
           'ORDER BY TIPO';
   Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.ListaEstatisticasAtivos(cdsAtivos: TCMClientDataSet;
                                                 sDataIni,sDataFim: string;
                                                 iIdPlano : integer = -1; iIdPatro : integer = -1;
                                                 iIdPlanoSPC : Integer = -1): OleVariant; //Lucas - 26/01/2005
var sSQL: string;
    i: Integer;
begin
 //AL_3
 cdsAtivos.First;
 sSQL :=
        'SELECT '                                                                                                        + #13 +
        '  CCO.DATA, '                                                                                                   + #13 +
        '  CCO.VLRPATRIMONIO, '                                                                                          + #13 +
        '  CCO.QTDCOTA, '                                                                                                + #13 +
        '  CCO.VLRCOTA, '                                                                                                + #13 +
        '  CCO.VLRCOTIZADO, '                                                                                            + #13 +
        '  CCO.VLRRENTABILIZADO, '                                                                                       + #13 +
        '  PPA.NOME AS PATRO, '                                                                                          + #13 +
        '  PRV.NOME AS PLANO, '                                                                                          + #13 +
        '  DECODE(A.DESCRICAO, NULL, '                                                                                   + #13 +
        '  DECODE(A.IDFUNDOINVEST, NULL, '                                                                               + #13 +
        '  DECODE(A.IDINVESTIMENTO, NULL, '                                                                              + #13 +
        '  DECODE(A.IDTIPOCONTREMPTMO, NULL, '                                                                           + #13 +
        '  DECODE(A.IDIMOVEL, NULL, '                                                                                    + #13 +
        '  DECODE(A.IDCARTEIRASPC, NULL, '''', '                                                                         + #13 +
        '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  IDCARTEIRASPC     =  A.IDCARTEIRASPC   )), '      + #13 +
        '      (SELECT  IMONOME          FROM  IMOVEL           WHERE  IDIMOVEL          =  A.IDIMOVEL)), '              + #13 +
        '      (SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)), '     + #13 +
        '      (SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  IDINVESTIMENTO    =  A.IDINVESTIMENTO)), '        + #13 +
        '      (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  IDFUNDOINVEST     =  A.IDFUNDOINVEST)), '         + #13 +
        '  A.DESCRICAO) AS ATIVO, '                                                                                      + #13 +

        '    DECODE(A.DESCRICAO, NULL, '                                                                                 + #13 +
        '    DECODE(A.IDFUNDOINVEST, NULL, '                                                                             + #13 +
        '    DECODE(A.IDINVESTIMENTO, NULL, '                                                                            + #13 +
        '    DECODE(A.IDTIPOCONTREMPTMO, NULL, '                                                                         + #13 +
        '    DECODE(A.IDIMOVEL, NULL, '                                                                                  + #13 +
        '    DECODE(A.IDCARTEIRASPC, NULL, '''', '                                                                       + #13 +
        '          (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  IDCARTEIRASPC     =  A.IDCARTEIRASPC   )), '  + #13 +
        '          ''Imobiliário''), '                                                                                   + #13 +
        '          ''Empréstimo''), '                                                                                    + #13 +
        '          (SELECT TI.DESCTIPOINVEST FROM  INVESTIMENTO I, TIPOINVEST TI '                                       + #13 +
        '           WHERE TI.IDTIPOINVEST = I.IDTIPOINVEST '                                                             + #13 +
        '           AND I.IDINVESTIMENTO = A.IDINVESTIMENTO)), '                                                         + #13 +
        '          (SELECT (TI.DESCTIPOINVEST||'' - ''|| TF.DESCTIPOFUNDOINV) AS DESCRICAO '                             + #13 +
        '           FROM   FUNDOINVEST F, TIPOINVEST TI, TIPOFUNDOINVEST TF '                                            + #13 +
        '           WHERE '                                                                                              + #13 +
        '              F.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST '                                                      + #13 +
        '           AND '                                                                                                + #13 +
        '              TF.IDTIPOINVEST = TI.IDTIPOINVEST '                                                               + #13 +
        '           AND '                                                                                                + #13 +
        '              F.IDFUNDOINVEST     =  A.IDFUNDOINVEST)), '                                                       + #13 +
        '    ''Cotas Manuais'') AS ORIGEMATIVO, '                                                                        + #13 +
        //AL_5
        '    CCO.IDCOTACOTACAO '                                                                                         + #13 +
        'FROM '                                                                                                          + #13 +
        '    COTACOTACAO CCO, '                                                                                          + #13 +
        '    ATIVOCOTA A, '                                                                                              + #13 +
        '    PESSOA PPA, '                                                                                               + #13 +
        '    PLANPREVCONTABIL PRV '                                                                                      + #13 +
        'WHERE '                                                                                                         + #13 +
        '        CCO.IDATIVOCOTA  = A.IDATIVOCOTA '                                                                      + #13 +
        '    AND CCO.IDATIVOCOTA  IN ('+ cdsAtivos.Fields[0].AsString;

        cdsAtivos.Next;
        while not cdsAtivos.Eof do
        begin
           Inc(i);
           if i > 999 then
           begin
              sSQL := sSQL + ') OR ' + #13 + '        CCO.IDATIVOCOTA IN (' + cdsAtivos.Fields[0].AsString;
              i := 0;
           end
           else
              sSQL := sSQL + ', ' + cdsAtivos.Fields[0].AsString;
           cdsAtivos.Next;
        end;
        sSQL := sSQL + ') '                                                                                              + #13 +
        '    AND DATA             BETWEEN TO_DATE('+ QuotedStr(sDataIni) +', ''dd/mm/yyyy'') '                           + #13 +
        '    AND                          TO_DATE('+ QuotedStr(sDataFim) +', ''dd/mm/yyyy'') '                           + #13 +
        '    AND PPA.IDPESSOA    IN CCO.IDPATRO '                                                                        + #13 +
        '    AND PRV.IDPLANOPREV IN CCO.IDPLANO ';

         if iIdPlanoSPC > 0 then
         begin
            sSQL := sSQL + '   AND CCO.IDPLANO   IN (' + CtrlListTerceiros.AlimentaVarPlano(-1,iIdPlanoSPC) + ')';
         end
         else
         begin
            if iIDPlano > 0 then
            sSQL := sSQL + '   AND CCO.IDPLANO   = ' + IntToStr(iIdPlano);

            if iIDPatro > 0 then
            sSQL := sSQL + '   AND CCO.IDPATRO   = ' + IntToStr(iIdPatro);
         end;

         sSQL := sSQL + ' ORDER BY ATIVO,DATA, PATRO, PLANO ';

  Result := GetDataPacket(sSQL);


end;


function TCtrlHstMovCota.ListaRegraIndexador: OleVariant;
var
  sSQL: string;

begin
  sSQL := 'SELECT '                                                      + #13 +
          '  R.IDREGRA, R.NOMEREGRA '                                    + #13 +
          'FROM '                                                        + #13 +
          '  REGRA R, PARAMCOTA P '                                      + #13 +
          'WHERE '                                                       + #13 +
          '  R.IDTIPOREGRA = P.IDTIPOREGRA '                             + #13 +
          'ORDER BY '                                                    + #13 +
          '  R.NOMEREGRA ';
  Result := GetDataPacket(sSQL);
end;



function TCtrlHstMovCota.CarregaDadosEmpresa: OleVariant;
var
 sSQL: string;

begin
 // AL_2
 sSQL := 'SELECT '                                                       + #13 +
         '   P.NOME ,  P.RAZAOSOCIAL, E.LOGRADOURO, '                    + #13 +
         '   E.NUMERO, E.COMPLEMENTO, E.BAIRRO, '                        + #13 +
         '   C.NOME AS CIDADE,        C.CODESTADO, '                     + #13 +
         '   E.CEP,    I.IMAGEM, '                                       + #13 +
         '  (E.LOGRADOURO||'', ''||E.NUMERO) AS ENDERECO   , '           + #13 +
         '  (E.BAIRRO||'' - ''||C.NOME||'' - ''||C.CODESTADO) AS BARCIDUF ' + #13 +
         'FROM '                                                         + #13 +
         '   FUNDACAO F, PESSOA P, ENDPESS E, IMAGENS I, CIDADES C '     + #13 +
         'WHERE (P.IDPESSOA = F.IDPESSOA) AND '                          + #13 +
         '   (E.IDPESSOA(+) = P.IDPESSOA) AND '                          + #13 +
         '   (E.IDCIDADES   = C.IDCIDADES(+))  AND '                     + #13 +
         '   (I.IDIMAGEM(+) = P.IDIMAGEM) ';
  Result := GetDataPacket(sSQL);

end;



function TCtrlHstMovCota.FiltraRelatorio(iIdAtivo,iIdPlano,iIdPatro: integer;
                                         dInicio, dFim: TDateTime): OleVariant;
var
   sSQL: String;
begin
   sSQL :=

   'SELECT '                                                                                                     + #13 +
   'CCO.DATA, CCO.DATAINI, CCO.VLRPATRIMONIO, CCO.QTDCOTA, CCO.VLRCOTA, CCO.VLRCOTIZADO, CCO.VLRRENTABILIZADO, '              + #13 +
   'DECODE(A.DESCRICAO, NULL, '                                                                                  + #13 +
   'DECODE(A.IDFUNDOINVEST, NULL, '                                                                              + #13 +
   'DECODE(A.IDINVESTIMENTO, NULL, '                                                                             + #13 +
   'DECODE(A.IDTIPOCONTREMPTMO, NULL, '                                                                          + #13 +
   'DECODE(A.IDIMOVEL, NULL, '                                                                                   + #13 +
   'DECODE(A.IDCARTEIRASPC, NULL, '''', '                                                                        + #13 +
   '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  IDCARTEIRASPC     =  A.IDCARTEIRASPC   )), '   + #13 +
   '      (SELECT  IMONOME          FROM  IMOVEL           WHERE  IDIMOVEL          =  A.IDIMOVEL)), '           + #13 +
   '      (SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)), '  + #13 +
   '      (SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  IDINVESTIMENTO    =  A.IDINVESTIMENTO)), '     + #13 +
   '      (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  IDFUNDOINVEST     =  A.IDFUNDOINVEST)), '      + #13 +
   'A.DESCRICAO) AS ATIVO, '                                                                                     + #13 +

   'DECODE(A.DESCRICAO, NULL, '                                                                                  + #13 +
   'DECODE(A.IDFUNDOINVEST, NULL, '                                                                              + #13 +
   'DECODE(A.IDINVESTIMENTO, NULL, '                                                                             + #13 +
   'DECODE(A.IDTIPOCONTREMPTMO, NULL, '                                                                          + #13 +
   'DECODE(A.IDIMOVEL, NULL, '                                                                                   + #13 +
   'DECODE(A.IDCARTEIRASPC, NULL, '''', '                                                                          + #13 +
   '      (SELECT DESCARTEIRASPC    FROM  CARTEIRASPC      WHERE  IDCARTEIRASPC     =  A.IDCARTEIRASPC   )), '   + #13 +
   '      ''Imobiliário''), '                                                                                    + #13 +
   '      ''Empréstimo''), '                                                                                     + #13 +
   '      (SELECT TI.DESCTIPOINVEST FROM  INVESTIMENTO I, TIPOINVEST TI '                                        + #13 +
   '       WHERE TI.IDTIPOINVEST = I.IDTIPOINVEST '                                                              + #13 +
   '       AND I.IDINVESTIMENTO = A.IDINVESTIMENTO)), '                                                          + #13 +

   '      (SELECT (TI.DESCTIPOINVEST||'' - ''|| TF.DESCTIPOFUNDOINV) AS DESCRICAO '                              + #13 +
   '       FROM   FUNDOINVEST F, TIPOINVEST TI, TIPOFUNDOINVEST TF '                                             + #13 +
   '       WHERE '                                                                                               + #13 +
   '          F.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST '                                                       + #13 +
   '       AND '                                                                                                 + #13 +
   '          TF.IDTIPOINVEST = TI.IDTIPOINVEST '                                                                + #13 +
   '       AND '                                                                                                 + #13 +
   '          F.IDFUNDOINVEST     =  A.IDFUNDOINVEST)), '                                                        + #13 +
   '''Cotas Manuais'') AS ORIGEMATIVO '                                                                          + #13 +
   'FROM '                                                                                                       + #13 +
   '  COTACOTACAO CCO, ATIVOCOTA A '                                                                             + #13 +
   'WHERE '                                                                                                      + #13 +
   '    CCO.IDATIVOCOTA  = A.IDATIVOCOTA '                                                                       + #13 +
   'AND CCO.IDATIVOCOTA  = '+ IntToStr(iIdAtivo)                                                                 + #13 +
   'AND DATA             BETWEEN TO_DATE('+ QuotedStr(DateToStr(dInicio)) +', ''dd/mm/yyyy'') '                  + #13 +
   'AND                           TO_DATE('+ QuotedStr(DateToStr(dFim)) +', ''dd/mm/yyyy'') '                    + #13 +
   'AND CCO.IDPLANO = ' + IntToStr(iIdPlano)                                                                     + #13 +
   'AND CCO.IDPATRO = ' + IntToStr(iIdPatro)                                                                     + #13 +
   'ORDER BY DATA ';

  Result := GetDataPacket(sSQL);


end;

function TCtrlHstMovCota.MovCotaEmprestimo(iIdAtivo, iIDPlano,
          iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
sSQL : string;

begin
  sSQL :=

       'SELECT '                                                                                                                            + #13 +

       'HME.HMEDATAPREVISTA AS DATA, '                                                                                                      + #13 +
       'ITE.ITEDESCRICAO AS DESCRICAO, '                                                                                                    + #13 +
       'SUM(DECODE(ITC.FLGMOVCOTA,''C'',(DECODE(ITC.FLGCOTARECDES, '                                                                        + #13 +
       '                                      ''R'', DECODE(SIGN(NVL(HME.HMEVLRPREVISTO,0)),1,NVL(HME.HMEVLRPREVISTO,0),0), '               + #13 +
       '                                      ''D'', DECODE(SIGN((NVL(HME.HMEVLRPREVISTO,0)*(-1))),1,(NVL(HME.HMEVLRPREVISTO,0)*(-1))), '   + #13 +
       '                                        0) )))AS VLRCOTIMAIS, '                                                                     + #13 +
       'SUM(DECODE(ITC.FLGMOVCOTA,''C'',(DECODE(ITC.FLGCOTARECDES, '                                                                        + #13 +
       '                                      ''R'', DECODE(SIGN(NVL(HME.HMEVLRPREVISTO,0)),-1,NVL(HME.HMEVLRPREVISTO,0),0), '              + #13 +
       '                                      ''D'', DECODE(SIGN((NVL(HME.HMEVLRPREVISTO,0)*(-1))),-1,(NVL(HME.HMEVLRPREVISTO,0)*(-1))), '  + #13 +
       '                                        0) )))AS VLRCOTIMENOS, '                                                                    + #13 +
       'SUM(DECODE(ITC.FLGMOVCOTA,''R'',(DECODE(ITC.FLGCOTARECDES, '                                                                        + #13 +
       '                                      ''R'', DECODE(SIGN(NVL(HME.HMEVLRPREVISTO,0)),1,NVL(HME.HMEVLRPREVISTO,0),0), '               + #13 +
       '                                      ''D'', DECODE(SIGN((NVL(HME.HMEVLRPREVISTO,0)*(-1))),1,(NVL(HME.HMEVLRPREVISTO,0)*(-1))), '   + #13 +
       '                                        0) )))AS VLRRENTMAIS, '                                                                     + #13 +
       'SUM(DECODE(ITC.FLGMOVCOTA,''R'',(DECODE(ITC.FLGCOTARECDES, '                                                                        + #13 +
       '                                      ''R'', DECODE(SIGN(NVL(HME.HMEVLRPREVISTO,0)),-1,NVL(HME.HMEVLRPREVISTO,0),0), '              + #13 +
       '                                      ''D'', DECODE(SIGN((NVL(HME.HMEVLRPREVISTO,0)*(-1))),-1,(NVL(HME.HMEVLRPREVISTO,0)*(-1))), '  + #13 +
       '                                        0)) ))AS VLRRENTMENOS '                                                                     + #13 +

       'FROM '                                                                                                                             + #13 +
       '   ATIVOCOTA       ATC, '                                                                                                          + #13 +
       '   HISTMOVEMPTMO   HME, '                                                                                                          + #13 +
       '   CONTRATOEMPTMO  CON, '                                                                                                          + #13 +
       '   TIPOCONTREMPTMO TCE, '                                                                                                          + #13 +
       '   TIPOEMPTMO      TEP, '                                                                                                          + #13 +
       '   ITEMXTIPOCONTR  ITC, '                                                                                                          + #13 +
       '   ITEMEMPTMO      ITE '                                                                                                           + #13 +


       'WHERE '                                                                                                                            + #13 +
       '       TEP.IDEMPRESAPROP        = 2 '                                                                                              + #13 +
       '       AND CON.FLGSITUACAO          <> ''C'' '                                                                                     + #13 +
       '       AND ATC.IDATIVOCOTA          = ' + IntToStr(iIdAtivo)                                                                       + #13 +
       '       AND CON.IDPLANOORIGEM        = ' + IntToStr(iIDPlano)                                                                       + #13 +
       '       AND CON.IDPATRO              = ' + IntToStr(iIdPatro)                                                                       + #13 +
       '       AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                                                          + #13 +
       '       AND NVL(HME.FLGABONADO, 0)   = 0 '                                                                                          + #13 +
       '       AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                                                          + #13 +
       '       AND ITC.FLGMOVCOTA           IN (''C'', ''R'') '                                                                            + #13 +
       '       AND HME.HMEDATAPREVISTA      BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '                       + #13 +
       '       AND                                  TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '                       + #13 +
       '       AND ATC.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                                                      + #13 +
       '       AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                                                       + #13 +
       '       AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                                                      + #13 +
       '       AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                                                           + #13 +
       '       AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                                                           + #13 +
       '       AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                                                                           + #13 +
       '       AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '                                                                      + #13 +
       '       GROUP BY '                                                                                                                  + #13 +
       '          HME.HMEDATAPREVISTA, '                                                                                                      + #13 +
       '          ITE.ITEDESCRICAO '                                                                                                    + #13 +
       '       ORDER BY '                                                                                                                  + #13 +
       '         DATA  ';

    Result := GetDataPacket(sSQL);
 
end;

function TCtrlHstMovCota.ComposicaoPerfil: OleVariant;
var
sSQL: string;

begin
  sSQL := 'SELECT '                                                                                 + #13 +
          '  ''                                                                  '' AS TIPOATIVO, ' + #13 +
          '  ''                                                                  '' AS ATIVO '      + #13 +
          'FROM '                                                                                   + #13 +
          '  DUAL '                                                                                 + #13 +
          'WHERE ''                                                                  '' = ''-1'' ';
  Result := GetDataPacket(sSQL);

end;

function TCtrlHstMovCota.MovCotaAtivoManual(iIdAtivo, iIDPlano,
  iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT '                                                                                                   + #13 +
          '  HST.DATA AS DATA, '                                                                                      + #13 +
          '  CTO.DESCTIPOOPER AS DESCRICAO, '                                                                                 + #13 +
          '  SUM(HST.VALOR) AS VALOR, '                                                                               + #13 +

          '  SUM(DECODE(CTO.FLGCOTA,''C'',DECODE(CTO.RECDES,''R'',DECODE(SIGN(HST.VALOR),1,HST.VALOR), '              + #13 +
          '                                             ''D'',DECODE(SIGN((HST.VALOR * (-1))),1,(HST.VALOR * (-1)) '  + #13 +
          '                                               ))))  AS VLRCOTIMAIS, '                                     + #13 +
          '  SUM(DECODE(CTO.FLGCOTA,''C'',DECODE(CTO.RECDES,''R'',DECODE(SIGN(HST.VALOR),-1,HST.VALOR), '             + #13 +
          '                                             ''D'',DECODE(SIGN((HST.VALOR * (-1))),-1,(HST.VALOR * (-1)) ' + #13 +
          '                                               ))))  AS VLRCOTIMENOS, '                                    + #13 +
          '  SUM(DECODE(CTO.FLGCOTA,''R'',DECODE(CTO.RECDES,''R'',DECODE(SIGN(HST.VALOR),1,HST.VALOR), '              + #13 +
          '                                             ''D'',DECODE(SIGN((HST.VALOR * (-1))),1,(HST.VALOR * (-1)) '  + #13 +
          '                                               ))))  AS VLRRENTMAIS, '                                     + #13 +
          '  SUM(DECODE(CTO.FLGCOTA,''R'',DECODE(CTO.RECDES,''R'',DECODE(SIGN(HST.VALOR),-1,HST.VALOR), '             + #13 +
          '                                             ''D'',DECODE(SIGN((HST.VALOR * (-1))),-1,(HST.VALOR * (-1)) ' + #13 +
          '                                               ))))  AS VLRRENTMENOS '                                     + #13 +

          'FROM '                                                                                                          + #13 +
          '  HSTMOVCOTA   HST, '                                                                                           + #13 +
          '  ATIVOCOTA    ATC, '                                                                                           + #13 +
          '  COTATIPOOPER CTO '                                                                                            + #13 +
          'WHERE '                                                                                                         + #13 +
          '    HST.IDATIVOCOTA    = ' + IntToStr(iIdAtivo)                                                                 + #13 +
          'AND HST.IDPLANOPREV    = ' + IntToStr(iIdPlano)                                                                 + #13 +
          'AND HST.IDPATRO        = ' + IntToStr(iIdPatro)                                                                 + #13 +
          'AND DATA BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '                               + #13 +
          'AND              TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '                               + #13 +
          'AND HST.IDCOTATIPOOPER = CTO.IDCOTATIPOOPER '                                                                   + #13 +
          'AND ATC.IDATIVOCOTA = HST.IDATIVOCOTA '                                                                         + #13 +
          'GROUP BY '                                                                                                      + #13 +
          '  HST.DATA, '                                                                                                   + #13 +
          '  CTO.DESCTIPOOPER '                                                                                            + #13 +
          'HAVING '                                                                                                        + #13 +
          '  SUM(HST.VALOR) <> 0 ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.MovCotaAtivoFundoRendaFixa(iIdAtivo, iIDPlano,
  iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
  sSQL: string;

begin
  sSQL :=

   'SELECT '                                                                                    + #13 +
   'H1.DATAMOVFUNDO AS DATA, '                                                                  + #13 +
   'H1.HISTMOVFUNDO AS DESCRICAO, '                                                             + #13 +
   'SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO, '                                                              + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO), 1, H1.VLRMOVFUNDO))) AS VLRCOTIMAIS, ' + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO),-1, H1.VLRMOVFUNDO))) AS VLRCOTIMENOS,' + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO), 1, H1.VLRMOVFUNDO))) AS VLRRENTMAIS, ' + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO),-1, H1.VLRMOVFUNDO))) AS VLRRENTMENOS ' + #13 +

   'FROM '                                                                                      + #13 +
   '  HISTFUNDO            H1, '                                                                + #13 +
   '  TIPOOPERACAO         TP, '                                                                + #13 +
   '  ATIVOCOTA            A1, '                                                                + #13 +
   '  PLANPREVCONTABPATRO  PA '                                                                 + #13 +


   'WHERE '                                                                                     + #13 +
   '       H1.DATAMOVFUNDO BETWEEN TO_DATE( '+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '  + #13 +
   '   AND                         TO_DATE( '+ QuotedStr(DateToStr(dDtFim)) +', ''dd/mm/yyyy'') '  + #13 +
   '   AND H1.IDTIPOINVEST      = 5 '                                                           + #13 +
   '   AND TP.IDTIPOINVEST      = 5 '                                                           + #13 +
   '   AND H1.TIPMOVFUNDO      <> ''PIR'' '                                                     + #13 +
   '   AND A1.IDATIVOCOTA       = '+ IntToStr(iIdAtivo)                                         + #13 +
   '   AND PA.IDPLANOPREV       = '+ IntToStr(iIDPlano)                                         + #13 +
   '   AND PA.IDPATRO           = '+ IntToStr(iIdPatro)                                         + #13 +
   '   AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                            + #13 +
   '   AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                           + #13 +
   '   AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                            + #13 +
   '   AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                        + #13 +
   'GROUP BY '                                                                                  + #13 +
   '  H1.DATAMOVFUNDO, '                                                                        + #13 +
   '  H1.HISTMOVFUNDO '                                                                         + #13 +
   'HAVING '                                                                                    + #13 +
   '  SUM(H1.VLRMOVFUNDO) <> 0 ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.MovCotaAtivoFundoRendaVariavel(iIdAtivo, iIDPlano,
  iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
 sSQL: string;

begin
  sSQL :=
    'SELECT '                                                                                         + #13 +
    '  H1.DATAMOVFUNDO AS DATA, '                                                                     + #13 +
    '  H1.HISTMOVFUNDO AS DESCRICAO, '                                                                + #13 +
    '  SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO, '                                                               + #13 +
    '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRCOTIMAIS, '   + #13 +
    '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRCOTIMENOS,'   + #13 +
    '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRRENTMAIS, '   + #13 +
    '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRRENTMENOS '   + #13 +

    'FROM '                                                                                           + #13 +
    '  HISTFUNDO            H1, '                                                                     + #13 +
    '  TIPOOPERACAO         TP, '                                                                     + #13 +
    '  ATIVOCOTA            A1, '                                                                     + #13 +
    '  PLANPREVCONTABPATRO  PA  '                                                                     + #13 +
    'WHERE '                                                                                          + #13 +
    '   H1.DATAMOVFUNDO BETWEEN TO_DATE( '+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '        + #13 +
    '                       AND TO_DATE( '+ QuotedStr(DateToStr(dDtFim)) +', ''dd/mm/yyyy'') '        + #13 +
    'AND H1.IDTIPOINVEST      = 6 '                                                                   + #13 +
    'AND TP.IDTIPOINVEST      = 6 '                                                                   + #13 +
    'AND H1.TIPMOVFUNDO      <> ''PIR'' '                                                             + #13 +
    'AND A1.IDATIVOCOTA       = ' + IntToStr(iIdAtivo)                                                + #13 +
    'AND PA.IDPLANOPREV       = ' + IntToStr(iIDPlano)                                                + #13 +
    'AND PA.IDPATRO           = ' + IntToStr(iIdPatro)                                                + #13 +
    'AND TP.FLGMOVCOTA         IN (''C'',''R'') '                                                     + #13 +
    'AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                                   + #13 +
    'AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                                    + #13 +
    'AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                                + #13 +
    'GROUP BY '                                                                                       + #13 +
    '  H1.DATAMOVFUNDO, '                                                                             + #13 +
    '  H1.HISTMOVFUNDO '                                                                              + #13 +
    'HAVING '                                                                                         + #13 +
    '  SUM(H1.VLRMOVFUNDO) <> 0';

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.MovCotaAtivoFundoImobiliario(iIdAtivo,
  iIDPlano, iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
 sSQL: string;

begin
  sSQL :=

    'SELECT '                                                                                         + #13 +
    'H1.DATAMOVFUNDO AS DATA, '                                                                       + #13 +
    'H1.HISTMOVFUNDO AS DESCRICAO, '                                                                  + #13 +
    'SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO, '                                                                + #13 +
    'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRCOTIMAIS, '    + #13 +
    'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRCOTIMENOS, '   + #13 +
    'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRRENTMAIS, '    + #13 +
    'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRRENTMENOS '    + #13 +

    'FROM '                                                                                           + #13 +
    '   HISTFUNDO            H1, '                                                                    + #13 +
    '   TIPOOPERACAO         TP, '                                                                    + #13 +
    '   ATIVOCOTA            A1, '                                                                    + #13 +
    '   PLANPREVCONTABPATRO  PA  '                                                                    + #13 +

    'WHERE '                                                                                          + #13 +
    '    H1.DATAMOVFUNDO BETWEEN TO_DATE( '+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '    + #13 +
    'AND                         TO_DATE( '+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '    + #13 +
    'AND H1.IDTIPOINVEST      = 7 '                                                                   + #13 +
    'AND TP.IDTIPOINVEST      = 7 '                                                                   + #13 +
    'AND H1.TIPMOVFUNDO      <> ''PIR'' '                                                             + #13 +
    'AND A1.IDATIVOCOTA       = ' + IntToStr(iIdAtivo)                                                + #13 +
    'AND PA.IDPLANOPREV       = ' + IntToStr(iIDPlano)                                                + #13 +
    'AND PA.IDPATRO           = ' + IntToStr(iIdPatro)                                                + #13 +
    'AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                                    + #13 +
    'AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                                   + #13 +
    'AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                                    + #13 +
    'AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                                + #13 +
    'GROUP BY '                                                                                       + #13 +
    '  H1.DATAMOVFUNDO, H1.HISTMOVFUNDO '                                                             + #13 +
    // colocado este having pois os registros estão calculados na base diariamente, sem este
    // having o relatório abre todos os dias com um tipo de movimentação
    'HAVING '                                                                                         + #13 +
    '  SUM(H1.VLRMOVFUNDO) <> 0 ';


  Result := GetDataPacket(sSQL);

end;



function TCtrlHstMovCota.MovCotaAtivoFundoDIC(iIdAtivo, iIDPlano, iIdPatro: integer;
                                             dDtInicio, dDtFim: TDateTime): OleVariant;
var
   sSQL: string;
begin
  sSQL :=
   'SELECT '                                                                                          + #13 +
   '  H1.DATAMOVFUNDO AS DATA, '                                                                      + #13 +
   '  H1.HISTMOVFUNDO AS DESCRICAO, '                                                                 + #13 +
   '  SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO, '                                                               + #13 +
   '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRCOTIMAIS,'    + #13 +
   '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRCOTIMENOS, '  + #13 +
   '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO), 1,H1.VLRMOVFUNDO))) AS VLRRENTMAIS,'    + #13 +
   '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVFUNDO),-1,H1.VLRMOVFUNDO))) AS VLRRENTMENOS'    + #13 +

   'FROM '                                                                                            + #13 +
   '  HISTFUNDO            H1, '                                                                      + #13 +
   '  TIPOOPERACAO         TP, '                                                                      + #13 +
   '  ATIVOCOTA            A1, '                                                                      + #13 +
   '  PLANPREVCONTABPATRO  PA '                                                                       + #13 +

   'WHERE '                                                                                           + #13 +
   '  H1.DATAMOVFUNDO BETWEEN TO_DATE( '+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '       + #13 +
   '                      AND TO_DATE( '+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '       + #13 +
   'AND H1.IDTIPOINVEST      = 9 '                                                                    + #13 +
   'AND TP.IDTIPOINVEST      = 9 '                                                                    + #13 +
   'AND H1.TIPMOVFUNDO      <> ''PIR'' '                                                              + #13 +
   'AND A1.IDATIVOCOTA       = ' + IntToStr(iIdAtivo)                                                 + #13 +
   'AND PA.IDPLANOPREV       = ' + IntToStr(iIDPlano)                                                 + #13 +
   'AND PA.IDPATRO           = ' + IntToStr(iIdPatro)                                                 + #13 +
   'AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                                     + #13 +
   'AND H1.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO '                                                    + #13 +
   'AND H1.IDFUNDOINVEST     = A1.IDFUNDOINVEST '                                                     + #13 +
   'AND H1.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR '                                                 + #13 +
   'GROUP BY '                                                                                        + #13 +
   '  H1.DATAMOVFUNDO, H1.HISTMOVFUNDO '                                                              + #13 +
   'HAVING '                                                                                          + #13 +
   '  SUM(H1.VLRMOVFUNDO) <> 0 ';

   Result := GetDataPacket(sSQL);
end;



function TCtrlHstMovCota.MovCotaAtivoInvestRendaFixa(iIdAtivo, iIDPlano, iIdPatro: integer;
                                                     dDtInicio, dDtFim: TDateTime): OleVariant;
var
   sSQL : string;
begin
  sSQL :=
   'SELECT '                                                                                                                                 + #13 +
   '  H1.DATAHISTRENFIX AS DATA, '                                                                                                           + #13 +
   '  TP.DESCTIPOOPERACAO AS DESCRICAO, '                                                                                                    + #13 +
   'SUM(H1.VLRHISTRENFIX) AS VLRHISTRENFIX, '                                                                                                + #13 +

   'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)),1, '               + #13 +
   '                                       DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)))) AS VLRCOTIMAIS, '    + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)),-1, '              + #13 +
   '                                       DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)))) AS VLRCOTIMENOS, '   + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)),1, '               + #13 +
   '                                       DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)))) AS VLRRENTMAIS, '    + #13 +
   'SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)),-1, '              + #13 +
   '                                       DECODE(NATURMOVHISTRENFI, ''D'', H1.VLRHISTRENFIX*(-1), H1.VLRHISTRENFIX)))) AS VLRRENTMENOS '    + #13 +

   'FROM '                                                                                                                                   + #13 +
   '   HISTRENFIX          H1, '                                                                                                             + #13 +
   '   ATIVOCOTA           A1, '                                                                                                             + #13 +
   '   PLANPREVCONTABPATRO PA, '                                                                                                             + #13 +
   '   TIPOOPERACAO        TP '                                                                                                              + #13 +

   'WHERE '                                                                                                                                  + #13 +
   '    H1.DATAHISTRENFIX     BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '                                       + #13 +
   '                              AND TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '                                       + #13 +
   '    AND TP.IDTIPOINVEST       = 1 '                                                                                                      + #13 +
   '    AND A1.IDATIVOCOTA        = ' + IntToStr(iIdAtivo)                                                                                   + #13 +
   '    AND PA.IDPLANOPREV        = ' + IntToStr(iIDPlano)                                                                                   + #13 +
   '    AND PA.IDPATRO            = ' + IntToStr(iIdPatro)                                                                                   + #13 +
   '    AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                                                                      + #13 +
   '    AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                                                                   + #13 +
   '    AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                                                                      + #13 +
   '    AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                                                                        + #13 +
   'GROUP BY '                                                                                                                               + #13 +
   '  H1.DATAHISTRENFIX, TP.DESCTIPOOPERACAO '                                                                                               + #13 +
   'HAVING '                                                                                                                                 + #13 +
   '  SUM(H1.VLRHISTRENFIX) <> 0 '                                                                                                           + #13 +

   'UNION ALL '                                                                                                                              + #13 +

   'SELECT '                                                                                                                                 + #13 +
   '   H1.DATAHISTRENFIX AS DATA, '                                                                                                          + #13 +
   '   TP.DESCTIPOOPERACAO || '' - '' || DECODE(SIGN((SUM(HL.LUCRO) - SUM(HP.PREJUIZO))), 1, ''Lucro'', ''Prejuízo'') AS DESCRICAO, '        + #13 +
   '   (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)) AS VLRHISTRENFIX, '                                                                                + #13 +
   '   0 AS VLRCOTIMAIS, '                                                                                                                   + #13 +
   '   0 AS VLRCOTIMENOS, '                                                                                                                  + #13 +
   '   DECODE(SIGN((SUM(HL.LUCRO) - SUM(HP.PREJUIZO))),  1, (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)), 0) AS VLRRENTMAIS, '                         + #13 +
   '   DECODE(SIGN((SUM(HL.LUCRO) - SUM(HP.PREJUIZO))), -1, (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)), 0) AS VLRRENTMENOS '                         + #13 +

   'FROM '                                                                                                                                   + #13 +
   '   HISTRENFIX          H1, '                                                                                                             + #13 +
   '   ATIVOCOTA           A1, '                                                                                                             + #13 +
   '   PLANPREVCONTABPATRO PA, '                                                                                                             + #13 +
   '   TIPOOPERACAO        TP, '                                                                                                             + #13 +
   '   ( '                                                                                                                                   + #13 +
   '   SELECT '                                                                                                                              + #13 +
   '       IDHISTRENFIX, ABS(PUITEM) AS LUCRO '                                                                                                + #13 +
   '   FROM '                                                                                                                                + #13 +
   '       HISTRENFIXXITENS '                                                                                                                + #13 +
   '   WHERE '                                                                                                                               + #13 +
   '       IDITEMRENFIX = -9 '                                                                                                               + #13 +
   '   ) HL, '                                                                                                                               + #13 +
   '   ( '                                                                                                                                   + #13 +
   '   SELECT '                                                                                                                              + #13 +
   '      IDHISTRENFIX, ABS(PUITEM) AS PREJUIZO '                                                                                              + #13 +
   '   FROM '                                                                                                                                + #13 +
   '      HISTRENFIXXITENS '                                                                                                                 + #13 +
   '   WHERE '                                                                                                                               + #13 +
   '      IDITEMRENFIX = -10 '                                                                                                               + #13 +
   '   ) HP '                                                                                                                                + #13 +

   'WHERE '                                                                                                                                  + #13 +
   '    H1.DATAHISTRENFIX     BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '                                       + #13 +
   '                              AND TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '                                       + #13 +
   '    AND TP.IDTIPOINVEST       = 1 '                                                                                                      + #13 +
   '    AND A1.IDATIVOCOTA        = ' + IntToStr(iIdAtivo)                                                                                   + #13 +
   '    AND PA.IDPLANOPREV        = ' + IntToStr(iIDPlano)                                                                                   + #13 +
   '    AND PA.IDPATRO            = ' + IntToStr(iIdPatro)                                                                                   + #13 +
   '    AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                                                                      + #13 +
   '    AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                                                                   + #13 +
   '    AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                                                                      + #13 +
   '    AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                                                                        + #13 +
   '    AND H1.IDHISTRENFIX       = HL.IDHISTRENFIX '                                                                                        + #13 +
   '    AND H1.IDHISTRENFIX       = HP.IDHISTRENFIX '                                                                                        + #13 +

   'GROUP BY '                                                                                                                               + #13 +
   '  H1.DATAHISTRENFIX, TP.DESCTIPOOPERACAO '                                                                                               + #13 +

   'HAVING '                                                                                                                                 + #13 +
   '  (SUM(HL.LUCRO) - SUM(HP.PREJUIZO)) <> 0 '                                                                                              + #13 +

   'ORDER BY '                                                                                                                               + #13 +
   '  DATA, DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.MovCotaAtivoInvestRendaVariavel(iIdAtivo,
  iIDPlano, iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
 sSQL: string;

begin
  sSQL :=

      'SELECT '                                                                                             + #13 +
      '  H1.DATAMOVCARTINV AS DATA, '                                                                       + #13 +
      '  H1.HISTMOVCARTINV AS DESCRICAO, '                                                                  + #13 +
      '  SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV, '                                                               + #13 +
      '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVCARTINV), 1,H1.VLRMOVCARTINV))) AS VLRCOTIMAIS, '   + #13 +
      '  SUM(DECODE(TP.FLGMOVCOTA,''C'',DECODE(SIGN(H1.VLRMOVCARTINV),-1,H1.VLRMOVCARTINV))) AS VLRCOTIMENOS, '  + #13 +
      '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVCARTINV), 1,H1.VLRMOVCARTINV))) AS VLRRENTMAIS, '   + #13 +
      '  SUM(DECODE(TP.FLGMOVCOTA,''R'',DECODE(SIGN(H1.VLRMOVCARTINV),-1,H1.VLRMOVCARTINV))) AS VLRRENTMENOS '   + #13 +

      'FROM '                                                                                               + #13 +
      '  HISTCARTINV         H1, '                                                                          + #13 +
      '  ATIVOCOTA           A1, '                                                                          + #13 +
      '  PLANPREVCONTABPATRO PA, '                                                                          + #13 +
      '  TIPOOPERACAO        TP '                                                                           + #13 +

      'WHERE '                                                                                              + #13 +
      '    H1.IDTIPOINVEST       = 2 '                                                                      + #13 +
      'AND TP.IDTIPOINVEST    = 2 '                                                                      + #13 +
      'AND H1.DATAMOVCARTINV     BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') '   + #13 +
      '                              AND TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') '   + #13 +
      'AND H1.IDCARTEIRAGERENC   IS NULL '                                                                  + #13 +
      'AND A1.IDATIVOCOTA        = ' + IntToStr(iIdAtivo)                                                   + #13 +
      'AND PA.IDPLANOPREV        = ' + IntToStr(iIDPlano)                                                   + #13 +
      'AND PA.IDPATRO            = ' + IntToStr(iIdPatro)                                                   + #13 +
      'AND H1.IDINVESTIMENTO     = A1.IDINVESTIMENTO '                                                      + #13 +
      'AND H1.IDPLANPREVCTBPATR  = PA.IDPLANPREVCTBPATR '                                                   + #13 +
      'AND H1.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO '                                                      + #13 +
      'AND TP.FLGMOVCOTA         IN (''C'', ''R'') '                                                        + #13 +
      'GROUP BY '                                                                                           + #13 +
      '  H1.DATAMOVCARTINV, '                                                                               + #13 +
      '  H1.HISTMOVCARTINV '                                                                                + #13 +
      'HAVING '                                                                                             + #13 +
      '  SUM(H1.VLRMOVCARTINV) <> 0';


  Result := GetDataPacket(sSQL);
end;

function TCtrlHstMovCota.MovCotaAtivoImobiliario(iIdAtivo, iIDPlano,
  iIdPatro: integer; dDtInicio, dDtFim: TDateTime): OleVariant;
var
 sSQL : string;

begin
  // AL_4 - Ini
  sSQL :=
       'SELECT ' + #13 +
       '  RM.DATABAIXA AS DATA, ' + #13 +
       '  RM.DESCCUSTORECIMO AS DESCRICAO, ' + #13 +
       '  SUM(RM.TOT_RECEBIDO) AS TOT_RECEBIDO, ' + #13 +
       '  SUM(DECODE(RM.FLGMOVCOTA,''C'',DECODE(SIGN((NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0))),1, ' + #13 +
       '                                         (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO,0))),0)) AS VLRCOTIMAIS, ' + #13 +
       '  SUM(DECODE(RM.FLGMOVCOTA,''C'',DECODE(SIGN((NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0))),-1, ' + #13 +
       '                                         (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO,0))),0)) AS VLRCOTIMENOS, ' + #13 +
       '  SUM(DECODE(RM.FLGMOVCOTA,''R'',DECODE(SIGN((NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0))),1, ' + #13 +
       '                                         (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO,0))),0)) AS VLRRENTMAIS, ' + #13 +
       '  SUM(DECODE(RM.FLGMOVCOTA,''R'',DECODE(SIGN((NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO, 0))),-1, ' + #13 +
       '                                         (NVL(RM.TOT_RECEBIDO, 0) - NVL(RM.TOT_PAGO,0))),0)) AS VLRRENTMENOS ' + #13 +
       'FROM ' + #13 +
       '  IMOVEL      I, ' + #13 +
       '  ATIVOCOTA   A, ' + #13 +
       '  PARAMGLOBAL PG, ' + #13 +
       '     ( ' + #13 +
       '     SELECT ' + #13 +
       '      I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, ' + #13 +
       '      TC.DESCCUSTORECIMO, ' + #13 +
       '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) AS TOT_RECEBIDO, ' + #13 +
       '      SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) AS TOT_PAGO ' + #13 +
       '      FROM ' + #13 +
       '      DOCUMENTO         D, '  + #13 +
       '      LANCTODOCUM       LD, ' + #13 +
       '      LANCAMENTOSIMOVEL LI, ' + #13 +
       '      IMOVEL            I, '  + #13 +
       '      RECBTOPAGTO       RP, ' + #13 +
       '      TIPOCUSTORECIMOV  TC, ' + #13 +
       '      ( ' + #13 +
       '      SELECT ' + #13 +
       '        CODDOCUMENTO, VALOR ' + #13 +
       '      FROM ' + #13 +
       '        LANCTODOCUM ' + #13 +
       '     WHERE ' + #13 +
       '       RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ' + #13 +
       '    ) TR1 ' + #13 +
       '    WHERE ' + #13 +
       '      D.CODDOCUMENTO       = LI.CODDOCUMENTO ' + #13 +
       '      AND D.CODDOCUMENTO       = LD.CODDOCUMENTO ' + #13 +
       '      AND D.CODDOCUMENTO       = TR1.CODDOCUMENTO ' + #13 +
       '      AND LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO ' + #13 +
       '      AND D.CODDOCUMENTO       = RP.CODDOCUMENTO(+) ' + #13 +
       '      AND LI.IDIMOVEL          = I.IDIMOVEL ' + #13 +
       '      AND TC.FLGMOVCOTA        IN (''R'', ''C'') ' + #13 +
       '      AND RP.DATABAIXA         BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDtInicio)) +', ''dd/mm/yyyy'') AND ' + #13 +
       '                                       TO_DATE('+ QuotedStr(DateToStr(dDtFim))    +', ''dd/mm/yyyy'') ' + #13 +
       '      GROUP ' + #13 +
       '      BY I.IDIMOVEL, RP.DATABAIXA, TC.FLGMOVCOTA, TC.DESCCUSTORECIMO ' + #13 +
       '      ) RM, ' + #13 +
       '       ( ' + #13 +
       '       SELECT IM.IDIMOVEL, ' + #13 +
       '              DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) AS IDPATRO, ' + #13 +
       '              DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
       '              DECODE(NVL(TT.TOTAL,0), 0, 100, DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL )) AS FATOR ' + #13 +
       '       FROM ' + #13 +
       '         PLANOPATROXIMOVEL PI, IMOVEL IM, PARAMGLOBAL PG, ' + #13 +
       '              ( ' + #13 +
       '              SELECT ' + #13 +
       '                IDIMOVEL, SUM( PPIPERCENTRATEIO ) AS TOTAL ' + #13 +
       '              FROM ' + #13 +
       '                PLANOPATROXIMOVEL ' + #13 +
       '              GROUP BY ' + #13 +
       '              IDIMOVEL ' + #13 +
       '              ) TT ' + #13 +
       '              WHERE ' + #13 +
       '                    DECODE(NVL(PI.IDPATRO,0), 0, PG.IDPATRO, PI.IDPATRO) = ' + IntToStr(iIDPlano)  + #13 +
       '                AND DECODE(NVL(PI.IDPLANOPREV,0), 0, PG.IDPLANOPREV, PI.IDPLANOPREV) = ' + IntToStr(iIdPatro) + #13 +
       '                AND PI.IDIMOVEL = TT.IDIMOVEL(+) ' + #13 +
       '                AND IM.IDIMOVEL = PI.IDIMOVEL(+) ' + #13 +
       '                AND IM.IDPESSOA = PG.IDPESSOA '    + #13 +
       '                AND IM.FLGTIPOIMOVEL = 1 '         + #13 +
       '       ) FT ' + #13 +
       'WHERE ' + #13 +
       '    A.IDATIVOCOTA    = ' + IntToStr(iIdAtivo) + #13 +
       'AND I.IDIMOVEL       = A.IDIMOVEL ' + #13 +
       'AND I.IDPESSOA       = PG.IDPESSOA ' + #13 +
       'AND I.IDIMOVEL       = FT.IDIMOVEL(+) ' + #13 +
       'AND I.IDIMOVEL       = RM.IDIMOVEL ' + #13 +
       'AND I.IDIMOVELMESTRE IS NOT NULL ' + #13 +
       'AND I.FLGATIVO       = 1 ' + #13 +
       'GROUP BY ' + #13 +
       '  RM.DATABAIXA, ' + #13 +
       '  RM.DESCCUSTORECIMO ' + #13 +
       'HAVING ' + #13 +
       '  SUM(RM.TOT_RECEBIDO) <> 0';
  //AL_4 - Fim

  Result := GetDataPacket(sSQL);
end;



function TCtrlHstMovCota.ListaSQLEntradaRegra(sDataInicio, sDataFinal,
  sPercentual, sTaxaJuros: string): string;
begin
  Result:= 'SELECT '                                                     + #13 +
           '  '+ QuotedStr(sDataInicio) +' AS DATAINICIO, '              + #13 +
           '  '+ QuotedStr(sDataFinal)  +' AS DATAFINAL, '               + #13 +
           '  '+ sPercentual            +' AS PERCENTUAL, '              + #13 +
           '  '+ sTaxaJuros             +' AS TAXA, '                    + #13 +
           '  -1                           AS IDCIDADES, '               + #13 +
           '   1                           AS IDPAIS, '                  + #13 +
           '  ''  ''                       AS CODESTADO '                + #13 +
           'FROM '                                                       + #13 +
           '  DUAL ';

end;

function TCtrlHstMovCota.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do
   begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Break;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;


function TCtrlHstMovCota.ExisteAtivo(cCds: TCMClientDataSet; sCampo, sAtivo: String): Boolean;
begin
   Result := False;
   cCds.First;
   while not cCds.Eof do
   begin
      if cCds.FieldByName(sCampo).AsString = sAtivo then
      begin
         Result := True;
         Break;
      end;
      cCds.Next;
   end;
end;

end.
