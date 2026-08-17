unit uCtrlCarteiraSPC;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbCarteiraSPC, DB, dbclient;

type
  TCtrlCarteiraSPC = class(TCMControlObject)

  private
    FCdsCarteiraSPC: TCMClientDataSet;
    FDbCarteiraSPC: TDbCarteiraSPC;
    procedure SetCdsCarteiraSPC(const Value: TCMClientDataSet);
    procedure SetDbCarteiraSPC(const Value: TDbCarteiraSPC);

  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbCarteiraSPC          : TDbCarteiraSPC   read FDbCarteiraSPC  write SetDbCarteiraSPC;
    property CdsCarteiraSPC         : TCMClientDataSet read FCdsCarteiraSPC write SetCdsCarteiraSPC;

    function GravaCarteiraSPC       : Boolean;
    function ListaCarteiraSPCAtivos (iIdPerfilCota : integer): OleVariant;
    function ListaCarteiraSPC       (const IDCarteiraSPC : integer =  -1) : OleVariant;
    function ListaSegmentoSPC       : OleVariant;
    function VerificaCarteiraCadastrada (const sDescricao : string; const iCodSegmento : integer; const iIdCarteira : integer = -1) : Boolean;


  published

end;

implementation

{ TCtrlCarteiraSPC }

procedure TCtrlCarteiraSPC.AfterInitialize;
begin
  inherited;
  FDbCarteiraSPC.DataBaseName := DataBaseName;
end;

constructor TCtrlCarteiraSPC.Create;
begin
  inherited;
  FDbCarteiraSPC := TDbCarteiraSpc.Create( Self );
end;


destructor TCtrlCarteiraSPC.Destroy;
begin
  FreeAndNil (FDbCarteiraSPC);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsCarteiraSPC);
  end;
  inherited;
end;


function TCtrlCarteiraSPC.GravaCarteiraSPC: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCarteiraSPC( CdsCarteiraSPC.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsCarteiraSPC, DbCarteiraSPC, [], [] );
      if not Result then raise Exception.Create( DbCarteiraSPC.MessageInfo );

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


function TCtrlCarteiraSPC.ListaCarteiraSPC(const IDCarteiraSPC : integer): OleVariant;
{ Esta função retorna todos os tipos de carteiras cadastradas
 PENDÊNCIA Nº 17426}
var
sSQL: string;

begin
  sSQL := 'SELECT C.IDCARTEIRASPC,C.DESCARTEIRASPC,'                     + #13 +
          'C.CODTIPOCART, S.DESCRICAO, C.CODSEGMENTO'                    + #13 +
          'FROM SEGMENTOSPC S, CARTEIRASPC C'                            + #13 +
          'WHERE C.CODSEGMENTO = S.CODSEGMENTO(+)'                       + #13 +
          'ORDER BY DESCARTEIRASPC';
  Result := GetDataPacket(sSQL);

end;


function TCtrlCarteiraSPC.ListaCarteiraSPCAtivos(iIdPerfilCOta : integer): OleVariant;
{ Esta função irá retornar os ativos baseados na tabela CARTEIRASPC
 PENDÊNCIA Nº 17426}
var
sSQL: string;

begin
  sSQL := 'SELECT ATIVOS.IDATIVOCOTA, S.CODSEGMENTO,S.DESCRICAO, '                      + #13 +
          'ATIVOS.MESTRE, C.IDCARTEIRASPC, C.DESCARTEIRASPC, '                          + #13 +
          'ATIVOS.DESCINVESTIMENTO '                                                    + #13 +
          'FROM '                                                                       + #13 +
          '  SEGMENTOSPC S, CARTEIRASPC C, '                                            + #13 +
          ' (SELECT '                                                                   + #13 +
          '  A.IDATIVOCOTA, '                                                           + #13 +
          '  IMO.CODTIPIMOVEL, IMO.MESTRE, '                                            + #13 +
          '   DECODE ( A.IDIMOVEL, NULL, '                                              + #13 +
          '     DECODE ( A.IDTIPOCONTREMPTMO, NULL, '                                   + #13 +
          '       DECODE ( A.IDINVESTIMENTO, NULL, '                                    + #13 +
          '         DECODE ( A.IDFUNDOINVEST, NULL, A.DESCRICAO, F.DESCFUNDOINVEST), '  + #13 +
          '       INV.DESCINVESTIMENTO ), '                                             + #13 +
          '     EMP.TCEDESCRICAO ), '                                                   + #13 +
          '   IMO.IMONOME) AS DESCINVESTIMENTO, '                                       + #13 +

          '   DECODE ( A.IDIMOVEL, NULL, '                                              + #13 +
          '    DECODE ( A.IDTIPOCONTREMPTMO, NULL, '                                    + #13 +
          '      DECODE ( A.IDINVESTIMENTO, NULL, '                                     + #13 +
          '        DECODE ( A.IDFUNDOINVEST, NULL, A.IDCARTEIRASPC, F.IDCARTEIRASPC), ' + #13 +
          '      INV.IDCARTEIRASPC ), '                                                 + #13 +
          '    EMP.IDCARTEIRASPC ), '                                                   + #13 +
          '   IMO.IDCARTEIRASPC) AS IDCARTEIRASPC '                                     + #13 +

          ' FROM '                                                                      + #13 +
          '   ATIVOCOTA A, FUNDOINVEST F, '                                             + #13 +
          '   (SELECT * FROM TIPOCONTREMPTMO T WHERE T.FLGSITUACAO = ''A'' ) EMP, '     + #13 +
          '   (SELECT IDINVESTIMENTO, DESCINVESTIMENTO, IDCARTEIRASPC '                 + #13 +
          '      FROM INVESTIMENTO I WHERE NVL(FLGATIVO, ''S'') = ''S'' ) INV, '        + #13 +

          '   (SELECT I.IDIMOVEL, I.CODTIPIMOVEL, I.IMONOME,IM.IMONOME AS MESTRE, '     + #13 +
          '      DECODE ( I.IDCARTEIRASPC, NULL, T.IDCARTEIRASPC, I.IDCARTEIRASPC) '    + #13 +
          '      AS IDCARTEIRASPC '                                                     + #13 +
          '    FROM IMOVEL I, IMOVEL IM, TIPOIMOVEL T '                                 + #13 +
          '    WHERE I.CODTIPIMOVEL   IS NOT NULL '                                     + #13 +
          '    AND   I.CODTIPIMOVEL = T.CODTIPIMOVEL '                                  + #13 +
          '    AND I.IDIMOVELMESTRE = IM.IDIMOVEL '                                     + #13 +
          '   )IMO, '                                                                   + #13 +

          '  (SELECT IDATIVOCOTA,IDCARTEIRASPC,DESCRICAO '                              + #13 +
          '     FROM ATIVOCOTA '                                                        + #13 +
          '   WHERE IDCARTEIRASPC IS NOT NULL '                                         + #13 +
          '   ) COTA '                                                                  + #13 +

          ' WHERE '                                                                     + #13 +
          '   A.IDIMOVEL              =  IMO.IDIMOVEL(+) '                              + #13 +
          '   AND A.IDATIVOCOTA       =  COTA.IDATIVOCOTA(+) '                          + #13 +
          '   AND A.IDINVESTIMENTO    =  INV.IDINVESTIMENTO(+) '                        + #13 +
          '   AND A.IDFUNDOINVEST     =  F.IDFUNDOINVEST(+) '                           + #13 +
          '   AND A.IDTIPOCONTREMPTMO =  EMP.IDTIPOCONTREMPTMO(+) ';

          if iIdPerfilCota <> -1 then
            sSQL := sSQL + 'AND A.IDATIVOCOTA NOT IN ( SELECT A.IDATIVOCOTA '           + #13 +
                           'FROM NOPERFILXATIVO A, NOPERFILCOTA N '                     + #13 +
                           'WHERE N.IDPERFILCOTA = ' + IntToStr(iIDPerfilCota)          + #13 +
                           'AND A.IDNOPERFILCOTA = N.IDNOPERFILCOTA) ';
          sSQL := sSQL + ' ) ATIVOS '                                                   + #13 +
                         'WHERE '                                                       + #13 +
                         ' C.CODSEGMENTO = S.CODSEGMENTO '                              + #13 +
                         ' AND C.IDCARTEIRASPC = ATIVOS.IDCARTEIRASPC(+) '              + #13 +
                         'ORDER BY S.CODSEGMENTO, C.DESCARTEIRASPC, ATIVOS.MESTRE,'     + #13 +
                         ' ATIVOS.DESCINVESTIMENTO ';
  Result := GetDataPacket(sSQL);
end;


function TCtrlCarteiraSPC.ListaSegmentoSPC: OleVariant;
begin
  Result := GetDataPacket('SELECT CODSEGMENTO, DESCRICAO FROM SEGMENTOSPC');
end;


procedure TCtrlCarteiraSPC.OnCreateAppServer;
begin
  inherited;
  FCdsCarteiraSPC := TCMClientDataSet.Create( nil );
end;


procedure TCtrlCarteiraSPC.SetCdsCarteiraSPC(
  const Value: TCMClientDataSet);
begin
  FCdsCarteiraSPC := Value;
end;

procedure TCtrlCarteiraSPC.SetDbCarteiraSPC(const Value: TDbCarteiraSPC);
begin
  FDbCarteiraSPC := Value;
end;



function TCtrlCarteiraSPC.VerificaCarteiraCadastrada(
  const sDescricao: string; const iCodSegmento : integer; const iIdCarteira: integer): Boolean;
var
sSQL : string;

begin
  Result := False;
  sSQL := 'SELECT IDCARTEIRASPC FROM CARTEIRASPC '                                + #13 +
          'WHERE UPPER(DESCARTEIRASPC) = ' + QuotedStr(AnsiUpperCase(sDescricao)) + #13 +
          'AND CODSEGMENTO = ' + IntToStr(iCodSegmento);
          if iIdCarteira <> -1 then
          sSQL := sSQL + ' AND IDCARTEIRASPC <> ' + IntToStr(iIdCarteira);

  _Cds.Data := GetDataPacket(sSQL);
  if _Cds.RecordCount > 0 then
  Result := True;

end;

end.





