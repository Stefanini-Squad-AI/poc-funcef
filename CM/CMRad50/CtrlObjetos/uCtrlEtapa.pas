unit uCtrlEtapa;
{--------------------------------------------------------------------------------------
Rotinas   : Todas
Data      : 17/06/2005
Autor     : Alex Pereira
pendência :
Descrição : O montaselect aceita que coloquemos aliases próprios, fiz isto, e:
            Excluído o tipo TMSCds, inclusive de todas as funções que usavam
---------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------
Rotinas   : Todas
Data      : 17/06/2005
Autor     : Alex Pereira
pendência :
Descrição : Criado o ctrl para gerenciar processos pendentes por usuário,
            tirando o código da vista
---------------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uCmControlObject, dbclient, uCmDbObject, Classes, sysUtils,
     uDbRADEtapa, uDbRADProcesso, uDbRadAutorizacao, uCmTypes, uFuncaoGeral,
     uDiasUteis, uDbRadObjeto, uDbImagens;

type
  TVerificaUsu = record
    idTipoProcesso  : integer;
    idTipoEtapa     : integer;
    idEtapa         : integer;
    idProcesso      : integer;
    codCentroCusto  : string;
    idEmpresa       : integer;  // chave cCusto
    codCentroRespon : string;
    idPessoa        : integer;  // chave cRespon
    codGrupoProd    : string;
    unidNegoc       : integer;
    VlrProc         : extended;
    codTipDoc       : integer;
  end;


  TCtrlEtapa = class(TCmControlObject)
  Protected
    Procedure AfterInitialize; Override;

  private
    FiNumAutorizacoesNaFila: integer;
    FiNumAutorizacoesPendentes: integer;

    // verifica e exclui da query processo que ainda estão na fila para atendimento anterior
    function FazVerificaUsu( const iUsuario: integer; const tTVerificaUsu: TVerificaUsu ): Boolean;
    // retorna estrutura a ser utilizada em FazVerificaUsu
    function RetornaTipoVerificaUsu(_CdsLocal: TClientDataSet): TVerificaUsu;

    function JaAutorizou      (const iUsuario: integer; const tTVerificaUsu: TVerificaUsu): Boolean;
    function LstVerifUsuario  (const iUsuario: integer; const tTVerificaUsu: TVerificaUsu): OleVariant;
    function LstVerifAutGrupo (const tTVerificaUsu: TVerificaUsu; const iIdGrupoAutoriza, iIdGrpRespon: integer): OleVariant;

    procedure SetiNumAutorizacoesNaFila(const Value: integer);
    procedure SetiNumAutorizacoesPendentes(const Value: integer);

  public

     // propriedade que indica o número de autorizações pendentes para o usuário
     property iNumAutorizacoesPendentes: integer read FiNumAutorizacoesPendentes write SetiNumAutorizacoesPendentes;
     // propriedade que indica o número de autorizações que ainda estão na fila
     // para se atendido, ou seja, dependem da assinatura de outra pessoa antes
     property iNumAutorizacoesNaFila: integer read FiNumAutorizacoesNaFila write SetiNumAutorizacoesNaFila;

     Constructor Create;  Override;
     Destructor  Destroy; Override;

     // método trazido do uCtrlRad
     procedure InfoNumProcPend( IdUsuario : Integer );

     function ListaProcessosPendentes( const iUsuario  : integer;
                                       const aIdEtapa  : string = '';  // array com a lista de etapas a listar
                                       const iIdModulo : integer = -1 ): OleVariant;

     function VerificaUsuario (const iUsuario: integer; const oCdsLocal: OleVariant): OleVariant;
  end;
implementation

{ TCtrlEtapa }

procedure TCtrlEtapa.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlEtapa.Create;
begin
  inherited;
  FiNumAutorizacoesNaFila    := 0;
  FiNumAutorizacoesPendentes := 0;
end;

destructor TCtrlEtapa.Destroy;
begin
  inherited;

end;

function TCtrlEtapa.FazVerificaUsu(const iUsuario: integer; const tTVerificaUsu: TVerificaUsu): Boolean;
var
  sSql: string;
  CdsVerifUsuario, CdsVerifAutGrupo, CdsVerifSeq : TClientDataSet;
  iIdGrupoAutoriza, iIdGrpRespon, iSeqRespon: integer;
Begin

  Result := True;
  try
    CdsVerifUsuario  := TClientDataSet.Create(nil);
    CdsVerifAutGrupo := TClientDataSet.Create(nil);
    CdsVerifSeq      := TClientDataSet.Create(nil);

    //Verifica se o usuario já autorizou
    if JaAutorizou(iUsuario, tTVerificaUsu) then begin
      Result := False;
      // se o usuário já autorizou o número de autorizações pendentes deve ser decrescido
      FiNumAutorizacoesPendentes := FiNumAutorizacoesPendentes - 1;
      Exit;
    end;

    //Verifica se o usuario pode autorizar
    CdsVerifUsuario.Data := LstVerifUsuario (iUsuario, tTVerificaUsu);
    if CdsVerifUsuario.IsEmpty then begin
      Result := False;
      // se o usuário não pode autorizar o número de autorizações pendentes deve ser decrescido
      FiNumAutorizacoesPendentes := FiNumAutorizacoesPendentes - 1;
      Exit;
    end;

    //Verifica se todo mundo do grupo de usuarios deste usuario já autorizou
    while not CdsVerifUsuario.EOF do begin
      iIdGrupoAutoriza := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsInteger;
      iIdGrpRespon     := CdsVerifUsuario.FieldByName( 'IDGRPRESPON' ).AsInteger;
      iSeqRespon       := CdsVerifUsuario.FieldByName( 'SEQAUTORIZACAO' ).AsInteger -1;

      CdsVerifAutGrupo.data :=  LstVerifAutGrupo(tTVerificaUsu, iIdGrupoAutoriza, iIdGrpRespon);

      if not CdsVerifAutGrupo.isEmpty then begin
        if CdsVerifAutGrupo.FieldByName( 'NUMAUTGRUPO' ).AsInteger >= CdsVerifUsuario.FieldByName( 'NUMAUTORIZACAO' ).AsInteger then begin
          result := False;
          // se falta a assinatura de alguém do grupo a fila deve ser acrescida
          FiNumAutorizacoesNaFila := FiNumAutorizacoesNaFila + 1;
          exit;
        end;
      end;

      //------------------------------------------------------------------------------------------
      // Verifica se Todos os usuarios do grupo anterior já autorizaram
      //------------------------------------------------------------------------------------------
      CdsVerifSeq.Data := GetDataPacket ('SELECT IDGRPRESPON,NUMAUTORIZACAO FROM RADGRAUTXGRRESPON ' + #13 +
                                         'WHERE (IDGRUPOAUTORIZA = ' + IntToStr(iIdGrupoAutoriza) + ') ' + #13 +
                                         '  AND (SEQAUTORIZACAO  = ' + IntToStr(iSeqRespon) + ') ' + #13);

      if not CdsVerifSeq.isEmpty then begin

        CdsVerifAutGrupo.Close;
        iIdGrpRespon     := CdsVerifSeq.FieldByName( 'IDGRPRESPON' ).AsInteger;

        CdsVerifAutGrupo.data :=  LstVerifAutGrupo(tTVerificaUsu, iIdGrupoAutoriza, iIdGrpRespon);

        if not CdsVerifAutGrupo.isEmpty then begin
          if CdsVerifAutGrupo.FieldByName( 'NUMAUTGRUPO' ).AsInteger < CdsVerifSeq.FieldByName( 'NUMAUTORIZACAO' ).AsInteger then begin
            Result := False;
            // se falta a assinatura de alguém do grupo anterior a fila deve ser acrescida
            FiNumAutorizacoesNaFila := FiNumAutorizacoesNaFila + 1;
            Exit;
          end;
        end;
      end;

      CdsVerifUsuario.Next;
    end;

  finally
    CdsVerifUsuario.Free;
    CdsVerifAutGrupo.Free;
    CdsVerifSeq.Free;
  end;

end;

procedure TCtrlEtapa.InfoNumProcPend(IdUsuario: Integer);
var
  _CdsLocal: TClientDataSet;
  sMsg: string;
begin
  try
    _CdsLocal := TClientDataSet.Create (nil);
    _CdsLocal.Data := ListaProcessosPendentes (IdUsuario);

    VerificaUsuario (idUsuario, _CdsLocal.Data);

    sMsg := '';
    if FiNumAutorizacoesPendentes <> 0 then
      sMsg := 'Existe(m) ' + inttostr (FiNumAutorizacoesPendentes) + ' Processo(s) pendente(s) de sua autorização';

    if FiNumAutorizacoesNaFila <> 0 then
      sMsg := sMsg + #13 +
              'Deste(s),  ' + InttoStr (FiNumAutorizacoesNaFila) + ' ainda está(ão) na fila para aprovação de outro(s) usuário(s)!';

    MessageInfo := sMsg;

  finally
    _CdsLocal.Free;
  end;
end;

function TCtrlEtapa.ListaProcessosPendentes(const iUsuario  : integer;
                                            const aIdEtapa  : string = '';  // array com a lista de etapas a listar
                                            const iIdModulo : integer = -1): OleVariant;
var
  sSql, sCabecalho : string;
begin
  // esta query não pode ser alterada sem a alteração do método RetornaTipoVerificaUsu
  // ambos estão vinculados com o montaselect da tela de execução de etapa

  sSql := 'SELECT DISTINCT ' + #13 +
          '   RADINSTPROCESSO.IDPROCESSO, ' + #13 +
          '   RADINSTPROCESSO.DATAINIPROCESSO, ' + #13 +
          '   RADINSTPROCESSO.DATAFIMPREV AS DATAFIMPROC, ' + #13 +
          '   RADINSTETAPA.DATAFIMPREV AS DATAFIMETAPA, ' + #13 +
          '   RADINSTPROCESSO.IDTIPOPROCESSO, ' + #13 +
          '   RADTIPOPROCESSO.NOME AS NOMEPROC, ' + #13 +
          '   RADINSTPROCESSO.OBS, ' + #13 +
          '   RADINSTETAPA .DATAINIETAPA, ' + #13 +
          '   RADTIPOETAPA.NOME AS NOMEETAPA, ' + #13 +
          '   RADINSTETAPA .IDETAPA, ' + #13 +
          '   RADTIPOETAPAXPROC.IDMODULO, ' + #13 +
          '   RADINSTPROCESSO.CODCENTROCUSTO, ' + #13 +
          '   RADINSTPROCESSO.IDEMPRESA, ' + #13 +
          '   RADINSTPROCESSO.UNIDNEGOC, ' + #13 +
          '   RADINSTPROCESSO.IDPESSOA, ' + #13 +
          '   RADINSTPROCESSO.CODGRUPOPROD, ' + #13 +
          '   RADINSTPROCESSO.CODCENTRORESPON, ' + #13 +
          '   RADINSTPROCESSO.VLRPROC, ' + #13 +
          '   RADINSTPROCESSO.IDPESSRESP, ' + #13 +
          '   RADINSTPROCESSO.CODTIPDOC, ' + #13 +
          '   RADINSTETAPA.IDTIPOETAPA, ' + #13 +
          '   PESSOA.RAZAOSOCIAL, ' + #13 +
          '   PESSOA.NUMDOCUMENTO, ' + #13 +
          '   MODULO.NOMEMODULO, ' + #13 +
          '   USUARIOSISTEMA.NOMEUSUARIO ' + #13 +
          'FROM ' + #13 +
          '   RADGRPRESPON, ' + #13 +
          '   RADRESPONXGRP, ' + #13 +
          '   RADGRAUTXGRRESPON, ' + #13 +
          '   RADGRUPOAUTORIZA, ' + #13 +
          '   RADETAPAXGRPRESP, ' + #13 +
          '   RADINSTETAPA, ' + #13 +
          '   RADINSTPROCESSO, ' + #13 +
          '   RADTIPOPROCESSO, ' + #13 +
          '   RADTIPOETAPA, ' + #13 +
          '   RADAUTORIZACAO, ' + #13 +
          '   RADTIPOETAPAXPROC, ' + #13 +
          '   SOLICOMP, ' + #13 +
          '   LOTEPAGTO, ' + #13 +
          '   PROCESSO, ' + #13 +
          '   OC, ' + #13 +
          '   MODULO, ' + #13 +
          '   USUARIOSISTEMA, ' + #13 +
          '   PESSOA ' + #13 +
          'WHERE ' + #13 +
          '   ( RADRESPONXGRP.IDUSUARIO  = ' + IntToStr(iUsuario) + ' ) AND ' + #13;

          if iIdModulo <> -1 then
            sSql := sSql + '   ( RADTIPOETAPAXPROC.IDMODULO = ' + InttoStr (iIdModulo) + ' ) AND '+ #13;

          if aIdEtapa <> '' then
            sSql := sSql + '   ( RADINSTETAPA.idetapa IN ( ' +  aIdEtapa + ' ) ) AND ' + #13;

          sSql := sSql +
                 '   ( RADGRPRESPON.IDGRPRESPON       = RADRESPONXGRP.IDGRPRESPON ) AND ' + #13 +
                 '   ( RADGRPRESPON.IDGRPRESPON       = RADGRAUTXGRRESPON.IDGRPRESPON ) AND ' + #13 +
                 '   ( RADGRAUTXGRRESPON.IDGRUPOAUTORIZA = RADGRUPOAUTORIZA.IDGRUPOAUTORIZA ) AND ' + #13 +
                 '   ( RADGRUPOAUTORIZA.IDGRUPOAUTORIZA = RADETAPAXGRPRESP.IDGRUPOAUTORIZA ) AND ' + #13 +
                 '   ( RADETAPAXGRPRESP.IDTIPOETAPA = RADINSTETAPA.IDTIPOETAPA ) AND ' + #13 +
                 '   ( RADETAPAXGRPRESP.IDTIPOPROCESSO = RADINSTPROCESSO.IDTIPOPROCESSO ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESSO ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPROCESSO = RADINSTETAPA.IDPROCESSO ) AND ' + #13 +
                 '   ( RADINSTETAPA.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA ) AND ' + #13 +
                 '   ( RADINSTETAPA.IDPROCESSO = RADAUTORIZACAO.IDPROCESSO(+) ) AND ' + #13 +
                 '   ( RADINSTETAPA.IDETAPA = RADAUTORIZACAO.IDETAPA(+) ) AND ' + #13 +
                 '   ( RADTIPOETAPAXPROC.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESSO ) AND ' + #13 +
                 '   ( RADTIPOETAPAXPROC.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPROCESSO = SOLICOMP.IDPROCESSO(+) ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPROCESSO = LOTEPAGTO.IDPROCESSO(+) ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPROCESSO = PROCESSO.IDPROCESSO(+) ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPROCESSO = OC.IDPROCESSO(+) ) AND ' + #13 +
                 '   ( RADTIPOETAPAXPROC.IDMODULO = MODULO.IDMODULO ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO (+)) AND ' + #13 +
                 '   ( RADINSTPROCESSO.IDPESSRESP = PESSOA.IDPESSOA (+)) AND ' + #13 +
                 '   ( RADINSTETAPA.DATAFIMETAPA IS NULL ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.CODTIPDOC = RADINSTPROCESSO.CODTIPDOC) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NOT NULL) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NULL) ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.UNIDNEGOC = RADINSTPROCESSO.UNIDNEGOC) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NOT NULL) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NULL) ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.CODCENTROCUSTO = RADINSTPROCESSO.CODCENTROCUSTO) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.CODCENTROCUSTO IS NULL AND RADINSTPROCESSO.CODCENTROCUSTO IS NOT NULL) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.CODCENTROCUSTO IS NULL AND RADINSTPROCESSO.CODCENTROCUSTO IS NULL) ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.CODCENTRORESPON = RADINSTPROCESSO.CODCENTRORESPON) OR ' +
                 '     (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NOT NULL) OR ' + #13 +
                 '     (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NULL) ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.VLRINICIAL <= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRINICIAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRINICIAL IS NULL ) ) AND ' + #13 +
                 '   ( (RADGRAUTXGRRESPON.VLRFINAL   >= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRFINAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRFINAL IS NULL ) ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.FLGOK = ''N'' ) AND ' + #13 +
                 '   ( RADINSTPROCESSO.DATAFIMPROCESSO IS NULL ) ';

  result := GetDataPacket ( sSql );
end;

function TCtrlEtapa.JaAutorizou (const iUsuario: integer; const tTVerificaUsu: TVerificaUsu): Boolean;
var
  _CdsLocal: TClientDataSet;
begin
  try
    _CdsLocal := TClientDataSet.Create(nil);
    _CdsLocal.data := GetDataPacket ('SELECT IDUSUARIO FROM RADAUTORIZACAO ' + #13 +
                                     'WHERE (IDPROCESSO = ' + IntToStr(tTVerificaUsu.idProcesso) + ' ) ' + #13 +
                                     '  AND (IDETAPA    = ' + IntToStr(tTVerificaUsu.idEtapa) + ' ) ' + #13 +
                                     '  AND (IDUSUARIO  = ' + IntToStr(iUsuario) + ' ) ' + #13 );
    if _CdsLocal.IsEmpty then
      Result := False
    else
      Result := True;

  finally
    _CdsLocal.free;
  end;

end;

function TCtrlEtapa.LstVerifAutGrupo(const tTVerificaUsu: TVerificaUsu;
                                     const iIdGrupoAutoriza, iIdGrpRespon: integer): OleVariant;
var
  sSql : string;
begin
  sSql :=  'SELECT COUNT(*) AS NUMAUTGRUPO ' + #13 +
           'FROM RADAUTORIZACAO A, ' + #13 +
           '     RADRESPONXGRP UG, ' + #13 +
           '     RADGRAUTXGRRESPON AG, ' + #13 +
           '     RADETAPAXGRPRESP EA ' + #13 +
           'WHERE  (A.IDPROCESSO = ' + IntToStr(tTVerificaUsu.idProcesso) + ') ' + #13 +
           '   AND (A.IDETAPA    = ' + IntToStr(tTVerificaUsu.idEtapa)    + ') ' + #13 +
           '   AND (EA.IDTIPOETAPA     = ' + IntToStr(tTVerificaUsu.idTipoEtapa)    + ') ' + #13 +
           '   AND (EA.IDTIPOPROCESSO  = ' + IntToStr(tTVerificaUsu.idTipoProcesso) + ') ' + #13 +
           '   AND (EA.IDGRUPOAUTORIZA = ' + IntToStr(iIdGrupoAutoriza) + ') ' + #13 +
           '   AND (AG.IDGRUPOAUTORIZA = ' + IntToStr(iIdGrupoAutoriza) + ') ' + #13 +
           '   AND (AG.IDGRPRESPON =     ' + IntToStr(iIdGrpRespon)     + ') ' + #13 +
           '   AND (A.FLGSTATUS = ''S'') ' + #13 +
           '   AND (UG.IDUSUARIO = A.IDUSUARIO) ' + #13 +
           '   AND (AG.IDGRPRESPON = UG.IDGRPRESPON) ' + #13 +
           '   AND (EA.IDGRUPOAUTORIZA = AG.IDGRUPOAUTORIZA) ' + #13;

  Result := GetDataPacket (sSql);

end;

function TCtrlEtapa.LstVerifUsuario(const iUsuario: integer;
                                    const tTVerificaUsu: TVerificaUsu): OleVariant;
var
  sSql : string;
begin

  sSql := 'SELECT AUT.IDGRUPOAUTORIZA, ' + #13 +
          '       AUT.NUMAUTORIZACAO, ' + #13 +
          '       AUT.SEQAUTORIZACAO, ' + #13 +
          '       USU.IDGRPRESPON ' + #13 +
          '  FROM RADRESPONXGRP USU, ' + #13 +
          '       RADGRAUTXGRRESPON AUT, ' + #13 +
          '       RADETAPAXGRPRESP EXR, ' + #13 +
          '       ( SELECT AUT.IDGRPRESPON, ' + #13 +
          '                AUT.IDGRUPOAUTORIZA, ' + #13 +
          '                DECODE( AUT.MOECODIGO, NULL, AUT.VLRINICIAL, ( AUT.VLRINICIAL * COT.COTVALOR ) ) AS VLRINICIAL, ' + #13 +
          '                DECODE( AUT.MOECODIGO, NULL, AUT.VLRFINAL,   ( AUT.VLRFINAL * COT.COTVALOR ) ) AS VLRFINAL ' + #13 +
          '           FROM RADGRAUTXGRRESPON AUT, ' + #13 +
          '                ( SELECT C.COTVALOR, C.MOECODIGO ' + #13 +
          '                    FROM COTACAOMOEDA C, ' + #13 +
          '                         ( SELECT MAX( COTDATA ) AS COTDATA, MOECODIGO ' + #13 +
          '                             FROM COTACAOMOEDA ' + #13 +
          '                            GROUP BY MOECODIGO ) V ' + #13 +
          '                   WHERE ( C.MOECODIGO = V.MOECODIGO ) AND ' + #13 +
          '                         ( C.COTDATA = V.COTDATA ) ) COT ' + #13 +
          '          WHERE ( COT.MOECODIGO(+) = AUT.MOECODIGO ) ) VLR ' + #13 +
          ' WHERE ( USU.IDUSUARIO =      ' + IntToStr(iUsuario) + ' ) ' + #13 +
          '   AND ( EXR.IDTIPOPROCESSO = ' + IntToStr(tTVerificaUsu.idTipoProcesso) + ' ) ' + #13 +
          '   AND ( EXR.IDTIPOETAPA =    ' + IntToStr(tTVerificaUsu.idTipoEtapa) + ' ) ' + #13 +
          '   AND ( AUT.IDGRPRESPON = USU.IDGRPRESPON ) ' + #13 +
          '   AND ( AUT.IDGRPRESPON = VLR.IDGRPRESPON ) ' + #13 +
          '   AND ( AUT.IDGRUPOAUTORIZA = VLR.IDGRUPOAUTORIZA ) ' + #13 +
          '   AND ( AUT.IDGRUPOAUTORIZA = EXR.IDGRUPOAUTORIZA ) ' + #13;

  if tTVerificaUsu.codCentroCusto <> '' then
    sSql := sSql + '   AND ( ( RTRIM( AUT.CODCENTROCUSTO ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codCentroCusto ) + ', 1, LENGTH( RTRIM( AUT.CODCENTROCUSTO ) ) ) ) OR ( AUT.CODCENTROCUSTO IS NULL ) ) ' + #13 +
                   '   AND ( ( AUT.IDEMPRESA = ' + IntToStr( tTVerificaUsu.idEmpresa ) + ' ) OR ( AUT.IDEMPRESA IS NULL ) ) ' + #13;

  if tTVerificaUsu.codCentroRespon <> '' then
    sSql := sSql + '   AND ( ( RTRIM( AUT.CODCENTRORESPON ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codCentroRespon ) + ', 1, LENGTH( RTRIM( AUT.CODCENTRORESPON ) ) ) ) OR ( AUT.CODCENTRORESPON IS NULL ) ) ' + #13 +
                   '   AND ( ( AUT.IDPESSOA = ' + IntToStr( tTVerificaUsu.idPessoa ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ' + #13;

  if tTVerificaUsu.codGrupoProd <> '' then
    sSql := sSql + '   AND ( ( RTRIM( AUT.CODGRUPOPROD ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codGrupoProd ) + ', 1, LENGTH( RTRIM( AUT.CODGRUPOPROD ) ) ) ) OR ( AUT.CODGRUPOPROD IS NULL ) ) ' + #13;

  if tTVerificaUsu.unidNegoc <> 0 then
    sSql := sSql + '   AND ( ( AUT.UNIDNEGOC = ' + IntToStr( tTVerificaUsu.unidNegoc ) + ' ) OR ( AUT.UNIDNEGOC IS NULL ) ) ' + #13 +
                   '   AND ( ( AUT.IDPESSOA = ' + IntToStr( tTVerificaUsu.idPessoa ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ' + #13;

  if tTVerificaUsu.VlrProc  <> 0  then
    sSql := sSql + '   AND ( ( VLR.VLRINICIAL <= ' + formatFloat('0', tTVerificaUsu.VlrProc ) + ' ) OR ( VLR.VLRINICIAL = 0 ) OR ( VLR.VLRINICIAL IS NULL ) ) ' + #13 +
                   '   AND ( ( VLR.VLRFINAL >= ' + formatFloat('0', tTVerificaUsu.VlrProc ) + ' ) OR ( VLR.VLRFINAL = 0 ) OR ( VLR.VLRFINAL IS NULL ) ) ' + #13;

  if tTVerificaUsu.codTipDoc <> 0 then
    sSql := sSql + ' AND ((AUT.CODTIPDOC = ' + formatFloat('0', tTVerificaUsu.codTipDoc) + ') OR (AUT.CODTIPDOC IS NULL) )' + #13;


  result := GetDataPacket (sSql);

end;

function TCtrlEtapa.RetornaTipoVerificaUsu(_CdsLocal: TClientDataSet): TVerificaUsu;
begin
       result.idTipoProcesso  := _CdsLocal.FieldByName( 'IDTIPOPROCESSO' ).AsInteger;
       result.idTipoEtapa     := _CdsLocal.FieldByName( 'IDTIPOETAPA' ).AsInteger;
       result.idEtapa         := _CdsLocal.FieldByName( 'IDETAPA' ).AsInteger;
       result.idProcesso      := _CdsLocal.FieldByName( 'IDPROCESSO' ).AsInteger;
       result.codCentroCusto  := _CdsLocal.FieldByName( 'CODCENTROCUSTO' ).AsString;
       result.idEmpresa       := _CdsLocal.FieldByName( 'IDEMPRESA' ).AsInteger;
       result.codCentroRespon := _CdsLocal.FieldByName( 'CODCENTRORESPON' ).AsString;
       result.idPessoa        := _CdsLocal.FieldByName( 'IDPESSOA' ).AsInteger;
       result.codGrupoProd    := _CdsLocal.FieldByName( 'CODGRUPOPROD' ).AsString;
       result.unidNegoc       := _CdsLocal.FieldByName( 'UNIDNEGOC' ).AsInteger;
       result.VlrProc         := _CdsLocal.FieldByName( 'VLRPROC' ).AsFloat;
       result.codTipDoc       := _CdsLocal.FieldByName( 'CODTIPDOC' ).asInteger;
end;

procedure TCtrlEtapa.SetiNumAutorizacoesNaFila(const Value: integer);
begin
  FiNumAutorizacoesNaFila := Value;
end;

procedure TCtrlEtapa.SetiNumAutorizacoesPendentes(const Value: integer);
begin
  FiNumAutorizacoesPendentes := Value;
end;

function TCtrlEtapa.VerificaUsuario(const iUsuario: integer;
                                    const oCdsLocal: OleVariant): OleVariant;
var
  _CdsLocal : TClientDataSet;
begin
  try
    _CdsLocal := TClientDataSet.Create(nil) ;
    _CdsLocal.Data := oCdsLocal;
    _CdsLocal.First;

    // atribui a propriedade de processos pendentes e na fila, dendo do método FazVerificaUsu
    // estes valores serão manipulados
    FiNumAutorizacoesPendentes := _CdsLocal.RecordCount;
    FiNumAutorizacoesNaFila := 0;
    while not _CdsLocal.Eof do begin
      if not FazVerificaUsu ( iUsuario, RetornaTipoVerificaUsu ( _CdsLocal) ) then begin
        _CdsLocal.Delete;
      end else begin
        _CdsLocal.Next;
      end;
    end;
  finally
    result := _CdsLocal.data;
    FreeAndNil (_CdsLocal)
  end;
end;

end.

