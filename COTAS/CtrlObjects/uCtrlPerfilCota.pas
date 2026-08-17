unit uCtrlPerfilCota;

interface

uses DB, uDatabase, uCmControlObject, Messages, dbClient, StdCtrls, Sysutils,
      uSistema, dBasedados, uCmTypes, CmEventosCadastro, uCmClientdataset,
      dbtables, uMensErro, uMidasUtil, uCmSQLParams, Classes, uDbPerfilCota,
      uDbNoPerfilCota, uDbNoPerfilxAtivo;



type

  TCtrlPerfilCota = class(TCMControlObject)

  private

    FCdsPerfilCota      : TCMClientDataSet;
    FCdsNoPerfilCota    : TCMClientDataSet;
    FCdsNoPerfilXATivo  : TCMClientDataSet;
    FDbPerfilCota       : TDbPerfilCota;
    FDbNoPerfilCota     : TDbNoPerfilCota;
    FDbNoPerfilXATivo  : TDbNoPerfilXAtivo;

    procedure SetcdsPerfilCota      (const Value: TCmClientDataSet);
    procedure SetCdsNoPerfilCota    (const Value: TCmClientDataSet);
    procedure SetCdsNoPerfilXATivo  (const Value: TCmClientDataSet);
    procedure SetDbNoPerfilCota     (const Value: TDbNoPerfilCota);
    procedure SetDbPerfilCota       (const Value: TDbPerfilCota);
    procedure SetDbNoPerfilXATivo   (const Value: TDbNoPerfilXATivo);



  protected

    procedure AfterInitialize;   Override;
    procedure OnCreateAppServer; Override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean); Override;


  public

    constructor Create;  override;
    destructor  Destroy; override;

    property CdsPerfilCota     : TCmClientDataSet    read FcdsPerfilCota      write  SetcdsPerfilCota;
    property CdsNoPerfilCOta   : TCmClientDataSet    read FCdsNoPerfilCota    write  SetCdsNoPerfilCota;
    property CdsNoPerfilXATivo : TCmClientDataSet    read FCdsNoPerfilXATivo  write  SetCdsNoPerfilXATivo;
    property DbPerfilCota      : TDbPerfilCota       read FDbPerfilCota       write  SetDbPerfilCota;
    property DbNoPerfilCota    : TDbNoPerfilCota     read FDbNoPerfilCota     write  SetDbNoPerfilCota;
    property DbNoPerfilXAtivo  : TDbNoPerfilXAtivo   read FDbNoPerfilXATivo   write  SetDbNoPerfilXATivo;



    function ListaAtivosImobiliario        (iIdPerfilCota : Integer = - 1)         : OleVariant;
    function ListaAtivosEmprestimo         (iIdPerfilCota : integer = - 1)         : OleVariant;
    function ListaAtivosRFRV               (const TIPOINVEST: integer; iIdPerfilCota : Integer = -1) : OleVariant;
    function ListaFundos                   (const TIPOFUNDO1,TIPOFUNDO2 : integer; iIdPerfilCota : Integer = -1) : OleVariant;
    function ListaCotas                    (iIdPerfilCota : Integer = - 1)         : OleVariant;
    function ListaPerfilCota               (const IdPerfilCota  : integer)         : OleVariant;
    function ListaNoPerfilCota             (const iIdPerfilCota : Integer)         : OleVariant;
    function ListaNOPERFILXATIVO           (const iIdPerfilCota : Integer)         : OleVariant;
    function VerificaSeTemAtivoNoPerfil    (const iIdPerfilCota : Integer)         : string;
    function GravaPerfilCota               : Boolean;
    function ExcluiPerfilCota              : Boolean;
    function VerifPerfilCadastrado         (const DescPerfil : string; const iIdPerfilCota: Integer = -1): Boolean;



  published



end;

implementation

{ TCtrlPerfilCota }

procedure TCtrlPerfilCota.AfterInitialize;
begin
  inherited;
  FDbPerfilCota.DataBaseName      := DatabaseName;
  FDbNoPerfilCota.DataBaseName    := DataBaseName;
  FDbNoPerfilXATivo.DataBaseName  := DataBaseName;
end;


constructor TCtrlPerfilCota.Create;
begin
  inherited;
   FDbPerfilCota      := TDbPerfilCota.Create(self);
   FDbNoPerfilCota    := TDbNoperfilcota.Create(self);
   FDbNoPerfilXATivo  := TDbNoperfilxativo.Create(self);

end;


destructor TCtrlPerfilCota.Destroy;
begin
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsPerfilCota);
    FreeAndNil (FCdsNoPerfilCota);
    FreeAndNil (FCdsNoPerfilXAtivo);
  end;
  inherited;
end;


function TCtrlPerfilCota.ListaAtivosImobiliario(iIdPerfilCota : Integer): OleVariant;
var
sSQL: string;
{ Lista os ativos da tabela IMÓVEL, com base na tabela ATIVOCOTA }
begin
  sSQL := 'SELECT I.CODTIPIMOVEL, IM.IMONOME AS MESTRE, '                + #13 +
          'A.IDATIVOCOTA, I.IMONOME, '                                   + #13 +
          'I.IDIMOVELMESTRE, I.IDIMOVEL, A.IDIMOVEL AS AIDIMOVEL '       + #13 +
          'FROM IMOVEL I, IMOVEL IM, ATIVOCOTA A '                       + #13 +
          'WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL '                        + #13 +
          'AND I.CODTIPIMOVEL IS NOT NULL '                              + #13 +
          'AND I.IDIMOVEL = A.IDIMOVEL ';
  if iIdPerfilCota <> -1 then
  sSQL := sSQL + 'AND  A.IDATIVOCOTA NOT IN ( SELECT A.IDATIVOCOTA '     + #13 +
                 'FROM NOPERFILXATIVO A, NOPERFILCOTA N '                + #13 +
                 'WHERE N.IDPERFILCOTA = '+ IntToStr(iIDPErfilCota)      + #13 +
                 'AND A.IDNOPERFILCOTA = N.IDNOPERFILCOTA)';
  sSQl := sSQL + 'ORDER BY CODTIPIMOVEL, MESTRE, I.IMONOME';
  Result := GetdataPacket(sSQL);
end;


function TCtrlPerfilCota.ListaAtivosEmprestimo( iIdPerfilCota :integer): OleVariant;
var
sSQL: string;
{ Lista os ativos da tabela TIPOCONTREMPTMO com base na tabela ATIVOCOTA}
begin
  sSQL := 'SELECT A.IDTIPOCONTREMPTMO,A.IDATIVOCOTA, '                   + #13 +
          'T.IDTIPOCONTREMPTMO,T.TCEDESCRICAO '                          + #13 +
          'FROM TIPOCONTREMPTMO T, ATIVOCOTA A '                         + #13 +
          'WHERE T.IDTIPOCONTREMPTMO = A.IDTIPOCONTREMPTMO ';
          if iIdPerfilCota <> -1 then
             sSQL := sSQL + VerificaSeTemAtivoNoPerfil(iIdPerfilCota);
  Result := GetDataPacket(sSQL);
end;


procedure TCtrlPerfilCota.OnCreateAppServer;
begin
  inherited;
  CdsPerfilCota := TCMClientDataSet.Create( nil );
  CdsNoPerfilCota := TCMClientDataSet.Create( nil );
end;


function TCtrlPerfilCota.ListaCotas(iIdPerfilCota : Integer): OleVariant;
var
sSQL: string;
{ Lista os ativos lançados manualmente da tabela ATIVOCOTA}
begin
  sSQL := 'SELECT A.IDATIVOCOTA, A.DESCRICAO '                           + #13 +
          'FROM ATIVOCOTA A '                                            + #13 +
          'WHERE A.DESCRICAO IS NOT NULL ';
  if iIdPerfilCOta <> -1 then
    sSQL := sSQL + VerificaSeTemAtivoNoPerfil(iIdPerfilCota);
  sSQL   := sSQL + 'ORDER BY DESCRICAO';

  Result := GetDataPacket(sSQL);
end;


function TCtrlPerfilCota.ListaAtivosRFRV(
  const TIPOINVEST: integer; iIdPerfilCota : Integer): OleVariant;
var
sSQL: string;
{ Lista os ativos da tabela INVESTIMENTO com base na tabela ATIVOCOTA}
begin
  sSQL := 'SELECT I.IDINVESTIMENTO, I.DESCINVESTIMENTO,'                 + #13 +
          'A.IDINVESTIMENTO, A.IDATIVOCOTA '                             + #13 +
          'FROM INVESTIMENTO I, ATIVOCOTA A '                            + #13 +
          'WHERE I.IDTIPOINVEST = ' + IntToStr(TIPOINVEST)               + #13 +
          'AND I.IDINVESTIMENTO = A.IDINVESTIMENTO ';
  if iIdPerfilCota <> -1 then
    sSQL := sSQL + VerificaSeTemAtivoNoPerfil(iIdPerfilCota);
  sSQL   := sSQL + 'ORDER BY DESCINVESTIMENTO';
  Result := GetDataPacket(sSQL);
end;


function TCtrlPerfilCota.ListaFundos(const TIPOFUNDO1,
  TIPOFUNDO2: integer; iIDPerfilCota : Integer): OleVariant;
var
sSQL: string;
{ Lista os ativos do tipo Fundos Investimento/Renda Fixa com
  base na tabela ATIVOCOTA}
begin
  sSQL := 'SELECT F.IDFUNDOINVEST, F.DESCFUNDOINVEST, '                  + #13 +
          'A.IDFUNDOINVEST, A.IDATIVOCOTA '                              + #13 +
          'FROM FUNDOINVEST F, ATIVOCOTA A '                             + #13 +
          'WHERE (IDTIPOFUNDOINVEST = ' + IntToStr(TIPOFUNDO1);
           if TipoFundo2 > 0 then
           sSQL :=
           sSQL + ' OR IDTIPOFUNDOINVEST = ' + IntToStr(TIPOFUNDO2);

           sSQL := sSQL +
          ') AND F.IDFUNDOINVEST = A.IDFUNDOINVEST ';
          if iIdPerfilCota <> -1 then
            sSQL := sSQL + VerificaSeTemAtivoNoPerfil(iIdPerfilCota);
          sSQL := sSQL + 'ORDER BY F.DESCFUNDOINVEST';
  Result := GetDataPacket(sSQL);
end;


procedure TCtrlPerfilCota.SetcdsPerfilCota(const Value: TCmClientDataSet);
begin
   FCdsPerfilCota := Value;
end;


procedure TCtrlPerfilCota.SetDbPerfilCota(const Value: TDbPerfilCota);
begin
  FDbPerfilCota := Value;
end;


function TCtrlPerfilCota.GravaPerfilCota: Boolean;
begin
 // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaPerfiCota( CdsPerfilCota.Data, CdsNoPerfilCota.Data );


    //exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      //inicia a transacao
      StartTransaction;

      //  Grava Perfil na tabela PERFILCOTA
      Result := ApplyCds( CdsPerfilCota, DbPerfilCota, [], [] );
      if not Result then
        raise Exception.Create(DbPerfilCota.MessageInfo);

      
      //  Grava Perfil na tabela NOPERFILCOTA
      Result := ApplyCds( CdsNoPerfilCOta, DbNoPerfilCota, [DbPerfilCota.Idperfilcota], [DbNoPerfilCota.IdPerfilcota] );
      if not  Result then
        raise Exception.Create(DbNoPerfilCota.MessageInfo);


      //  O processo de gravação da tabela NOPERFILXATIVO está associado
      // no evento AfterApplyCdsRecord neste ControlObject


      Commit;

      //em caso de erro, anula transacao
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


procedure TCtrlPerfilCota.SetCdsNoPerfilCota(
  const Value: TCmClientDataSet);
begin
 FCdsNoPerfilCota := Value;
end;


procedure TCtrlPerfilCota.SetDbNoPerfilCota(const Value: TDbNoPerfilCota);
begin
  FDbNoPerfilCota := Value;
end;




function TCtrlPerfilCota.ListaPerfilCota(
  const IdPerfilCota: integer): OleVariant;
//==============================================================================
//      Esta função carrega os dados da tabela PERFILCOTA A constante
// 'ID' recebe o valor obtido na pesquisa do MontaSelect.
//
//==============================================================================
var
sSQL : string;
begin
  sSQL := 'SELECT IDPERFILCOTA, DESCRICAO, TIPOPERFIL'                   + #13 +
          'FROM PERFILCOTA'                                              + #13 +
          'WHERE IDPERFILCOTA = ' + IntToStr(IdPerfilCOta);
  Result := GetDataPacket(sSQL);
end;



function TCtrlPerfilCota.ExcluiPerfilCota: Boolean;
//==============================================================================
//    Esta função faz a deleção em cascata do perfil de ativos criado pelo
// usuário, na tabela PERFILCOTA, NOPERFILCOTA e NOPERFILXATIVO.
//
//==============================================================================
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiPerfilCota( CdsPerfilCota.Data, CdsNoPerfilCota.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;

  end else begin

    try
      StartTransaction;


      FCdsNoPerfilXATivo.First;
      while not FCdsNoPerfilXATivo.Eof do begin
        FCdsNoPerfilXATivo.Delete;
      end;

      FCdsNoPerfilCota.First;
      while not FCdsNoPerfilCota.Eof   do begin
        FCdsNoPerfilCota.Delete;
      end;

      //  Deleta NOPERFILXATIVO
      Result := ApplyCds( CdsNoPerfilXATivo, DbNoPerfilXAtivo, [], [] );
      if not Result then raise Exception.Create( DbNoPerfilXAtivo.MessageInfo );

      //  Deleta NOPERFILCOTA
      Result := ApplyCds( CdsNoPerfilCOta, DbNoPerfilCota, [], [] );
      if not Result then raise Exception.Create( DbNoPerfilCota.MessageInfo );

      //  Deleta PERFILCOTA
      Result := ApplyCds( CdsPerfilCota, DbPerfilCota, [], [] );
      if not Result then raise Exception.Create( DbPerfilCota.MessageInfo );

      Commit;

    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;

    end;

  end;

end;



function TCtrlPerfilCota.ListaNoPerfilCota(
  const iIdPerfilCota: Integer): OleVariant;
//==============================================================================
//
//    Esta função carrega os dados da tabela NOPERFILCOTA. A constante ID
// recebe o valor obtido na pesquisa do MontaSelect
//
//==============================================================================

var
sSQL : string;
begin
  sSQL := 'SELECT IDNOPERFILCOTA, IDPERFILCOTA, DESCRICAO, '' '' AS MODIFICADO, '        + #13 +
          'DECODE(LENGTH(CODHIERARQUICO), 2, ''0'', SUBSTR (CODHIERARQUICO, 1, LENGTH(CODHIERARQUICO) - 3)) AS CODHIERARQPAI, '    + #13 +
          'CODHIERARQUICO '                                                              + #13 +
          'FROM NOPERFILCOTA '                                                           + #13 +
          'WHERE IDPERFILCOTA = ' + IntToStr(iIdPerfilCota)                              + #13 +
          'ORDER BY CODHIERARQUICO ';

  Result := GetDataPacket(sSQL);

end;


procedure TCtrlPerfilCota.SetCdsNoPerfilXATivo(
  const Value: TCmClientDataSet);
begin
  FCdsNoPerfilXATivo := Value;
end;


procedure TCtrlPerfilCota.SetDbNoPerfilXATivo(
  const Value: TDbNoPerfilXATivo);
begin
  FDbNoPerfilXATivo := Value;
end;



function TCtrlPerfilCota.ListaNOPERFILXATIVO(
  const iIdPerfilCota: Integer): OleVariant;
var
sSQL : string;
begin
  sSQL := 'SELECT  NX.IDNOPERFILXATIVO, NX.IDNOPERFILCOTA, NX.IDATIVOCOTA,N.CODHIERARQUICO,'                    + #13 +

          'DECODE (A.DESCRICAO,NULL,'                                                                           + #13 +
          'DECODE (IDINVESTIMENTO,NULL,'                                                                        + #13 +
          'DECODE (IDFUNDOINVEST,NULL,'                                                                         + #13 +
          'DECODE (IDCARTEIRASPC,NULL,'                                                                         + #13 +
          'DECODE (IDTIPOCONTREMPTMO,NULL,'                                                                     + #13 +
          'DECODE (IDIMOVEL,NULL,'                                                                              + #13 +
          'DECODE (NX.IDNOPERFILCOTA,N.IDNOPERFILCOTA,N.DESCRICAO,N.DESCRICAO)'                                 + #13 +
          ',(SELECT  IMONOME          FROM  IMOVEL           WHERE  IDIMOVEL          =  A.IDIMOVEL))'          + #13 +
          ',(SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO))' + #13 +
          ',(SELECT  DESCARTEIRASPC   FROM  CARTEIRASPC      WHERE  IDCARTEIRASPC     =  A.IDCARTEIRASPC))'     + #13 +
          ',(SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      WHERE  IDFUNDOINVEST     =  A.IDFUNDOINVEST))'     + #13 +
          ',(SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  IDINVESTIMENTO    =  A.IDINVESTIMENTO))'    + #13 +
          ',A.DESCRICAO) AS ATIVO'                                                                              + #13 +
          'FROM ATIVOCOTA A, NOPERFILCOTA N, NOPERFILXATIVO NX, PERFILCOTA P'                                   + #13 +

          'WHERE'                                                                                               + #13 +
          'P.IDPERFILCOTA    =  ' + IntToStr(iIdPerfilCota)                                                     + #13 +
          'AND N.IDPERFILCOTA    =  P.IDPERFILCOTA'                                                             + #13 +
          'AND NX.IDNOPERFILCOTA =  N.IDNOPERFILCOTA'                                                           + #13 +
          'AND A.IDATIVOCOTA     =  NX.IDATIVOCOTA '                                                            + #13 +
          'ORDER BY N.CODHIERARQUICO';
  Result := GetDataPacket(sSQL);
end;


procedure TCtrlPerfilCota.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
//==============================================================================
//
//   Este procedimento grava os dados para a tabela NOPERFILXATIVO, apos cada
// inserção da tabela NOPERFILCOTA
//
//==============================================================================

begin
  inherited;
  try
    //  Verifica a tabela em foco no ApplyCds
    if AnsiUpperCase(sTableName) = 'NOPERFILCOTA' then begin

      if CdsState in [usInserted, usModified] then begin

        // selecionar os registros para exclusão
        {**
          Processa a exclusão usando STATUSFILTER.
          É utilizado um ClientDataSet Auxiliar pois quanto o Cds é filtrado
          o status filter deixa de funcionar mas o conteúdo do Data Packet fica
          inalterado
        **}

        if _Cds.Active then _Cds.Close;
        _Cds.Data := FCdsNoPerfilXATivo.Data;

        _Cds.StatusFilter := [usDeleted];
        _Cds.First;
        while not _Cds.eof do begin
          CdsToDbObject (_Cds, FDbNoPerfilXATivo);

          if not FDbNoPerfilXATivo.Delete then
            raise Exception.Create (FDbNoPerfilXATivo.MessageInfo);

          _Cds.Next;

        end;
        _Cds.StatusFilter := [];
        if _Cds.ChangeCount >0 then _Cds.CancelUpdates;
        _Cds.Close;

        // fim do processo de exclusão

        //   Filtra  o CdsNoPerfilXAtivo para que seja selecionados os registros
        // semelhante ao encontrado no registro corrente da tabela NOPERFILCOTA,
        // através do campo virtual CODHIERARQUICO do CdsNoPerfilXAtivo, pois a
        // intenção é gravar o IDNOPERFILCOTA do CdsNoPerfilCota para o
        // IDNOPERFILCOTA do CsdNoPerfilXAtivo, em cada regsitro filtrado.
        FCdsNoPerfilXATivo.Filtered  := false;
        FCdsNoPerfilXATivo.Filter    := 'CODHIERARQUICO = '+ QuotedStr(aCds.FieldByName('CODHIERARQUICO').AsString);
        FCdsNoPerfilXATivo.Filtered  := true;
        FCdsNoPerfilXATivo.First;

        //  Faz o loop e insere os registros
        while not FCdsNoPerfilXAtivo.Eof do begin

          //  Verifica se o registro corrente é um registro novo
          if FCdsNoPerfilXATivo.UpdateStatus = usInserted then begin
            FDbNoPerfilXATivo.Clear;
            FDbNoPerfilXATivo.Idnoperfilcota.AsInteger := FDbNoPerfilCOta.IdNoperfilCota.AsInteger;
            FDbNoPerfilXATivo.IdAtivoCota.AsInteger    := FCdsNoPerfilXAtivo.FieldByName('IDATIVOCOTA').AsInteger;


            //  Em caso de erros...
            if not FDbNoPerfilXATivo.Insert then
              raise exception.Create (FDbNoPerfilXATivo.MessageInfo);
          end;

          //  Move o cursor para o próximo foco
          FCdsNoPerfilXATivo.Next;
        end;

        //  Desfaz o filtro
       FCdsNoPerfilXATivo.Filtered:= false;
      end;
    end;

    Accept := true;
  except
    on E : Exception do begin
      Accept := false;
      MessageInfo := E.Message;
    end;
  end;
end;


function TCtrlPerfilCota.VerificaSeTemAtivoNoPerfil( const iIdPerfilCota : integer): string;
var
sSQL : string;
begin
  sSQL := 'AND A.IDATIVOCOTA NOT IN ( SELECT A.IDATIVOCOTA FROM '       + #13 +
          'NOPERFILXATIVO A, NOPERFILCOTA N '                            + #13 +
          'WHERE N.IDPERFILCOTA = '+ IntToStr(iIdPerfilCota)             + #13 +
          'AND A.IDNOPERFILCOTA = N.IDNOPERFILCOTA)';
  Result := sSQL;
end;




procedure TCtrlPerfilCota.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin
  inherited;
  try
    if AnsiUpperCase(sTableName) = 'NOPERFILCOTA' then begin

      if CdsState = usDeleted then begin
        // selecionar os registros para exclusão
        {**
          Processa a exclusão usando STATUSFILTER.
          É utilizado um ClientDataSet Auxiliar pois quanto o Cds é filtrado
          o status filter deixa de funcionar mas o conteúdo do Data Packet fica
          inalterado
        **}

        if _Cds.Active then _Cds.Close;
        _Cds.Data := FCdsNoPerfilXATivo.Data;

        _Cds.StatusFilter := [usDeleted];
        _Cds.First;
        while not _Cds.eof do begin
          CdsToDbObject (_Cds, FDbNoPerfilXATivo);

          if not FDbNoPerfilXATivo.Delete then
            raise Exception.Create (FDbNoPerfilXATivo.MessageInfo);

          _Cds.Next;

        end;
        _Cds.StatusFilter := [];
        if _Cds.ChangeCount >0 then _Cds.CancelUpdates;
        _Cds.Close;

        // fim do processo de exclusão
      end;
    end;
    Accept := true;
  except
    on E : Exception do begin
      Accept := false;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlPerfilCota.VerifPerfilCadastrado(
  const DescPerfil: string; const iIdPerfilCota: Integer): Boolean;
var
 sSQL : string;

begin
  Result := False;
  sSQL := 'SELECT IDPERFILCOTA FROM PERFILCOTA '                         + #13 +
          'WHERE UPPER(DESCRICAO) = ' + QuotedStr(AnsiUpperCase(DescPerfil));

  if iIdPerfilCota <> -1 then
    sSQL := sSQL + '   AND IDPERFILCOTA <> ' + IntToStr(iIdPerfilCota);

  _Cds.Data :=  GetDataPacket(sSQL);

  if _Cds.RecordCount > 0 then
  Result := True;

end;

end.
