{-------------------------------------------------------------------------------------------------
Nº WO.......: 13599
Data........: 01/10/2024
Responsável.: Leandro Pocebon
Rotina......: LookupPadraoRateioFluxo
--------------------------------------------------------------------------------------------------
Nº SOL......: 159341
Nº KINTANA..: 1308968
Data........: 06/05/2010
Responsável.: Helen Vasquez Bianchi
Rotina......: VerificaRateio
--------------------------------------------------------------------------------------------------
Nº SOL......: 128685
Nº KINTANA..: 692049
Data........: 06/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
---------------------------------------------------------------------------------------------------}
unit uCtrlGrupoRateioFluxo;

interface

uses
  SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
  uDbGrupoRateioFluxo, uDbPadraoRateioFluxo,uCMMath;


type
  TCtrlGrupoRateioFluxo = class(TCMControlObject)
  private
    FDbGrupoRateioFluxo: TDbGrupoRateioFluxo;
    FCdsGrupoRateioFluxo: TCMClientDataSet;
    FDbPadraoRateioFluxo: TDbPadraoRateioFluxo;
    FCdsPadraoRateioFluxo: TCMClientDataSet;

    procedure SetDbGrupoRateioFluxo(const Value: TDbGrupoRateioFluxo);
    procedure SetCdsGrupoRateioFluxo(const Value: TCMClientDataSet);
    procedure SetDbPadraoRateioFluxo(const Value: TDbPadraoRateioFluxo);
    procedure SetCdsPadraoRateioFluxo(const Value: TCMClientDataSet);

    function VerificaRateio (var sMsgErro: String): Boolean;

  protected

    procedure AfterInitialize;   override;
    procedure OnCreateAppServer; override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbGrupoRateioFluxo   : TDbGrupoRateioFluxo  read FDbGrupoRateioFluxo   write SetDbGrupoRateioFluxo;
    property CdsGrupoRateioFluxo  : TCMClientDataSet     read FCdsGrupoRateioFluxo  write SetCdsGrupoRateioFluxo;
    property DbPadraoRateioFluxo  : TDbPadraoRateioFluxo read FDbPadraoRateioFluxo  write SetDbPadraoRateioFluxo;
    property CdsPadraoRateioFluxo : TCMClientDataSet     read FCdsPadraoRateioFluxo write SetCdsPadraoRateioFluxo;

    function GravaGrupoRateioFluxo: Boolean;
    function ExcluiGrupoRateioFluxo: Boolean;

    function ArredondaParaComparar(rValor:Real; iNumDecimais: Integer): Real;

    function LookupGrupoRateioFluxo(const IDGrupoRateioFluxo: Integer = -1): OleVariant;

    function LookupPadraoRateioFluxo(const IDGrupoRateioFluxo: Extended = -1;
                                     const IDEmpresaProp: Int64 = 1
                                    ): OLEVariant;

  published

  end;


implementation

{ TCtrlGrupoRateioFluxo }

constructor TCtrlGrupoRateioFluxo.Create;
begin
  inherited;
  FDbGrupoRateioFluxo  := TDbGrupoRateioFluxo.Create(Self);
  FDbPadraoRateioFluxo := TDBPadraoRateioFluxo.Create(Self);
end;

destructor TCtrlGrupoRateioFluxo.Destroy;
begin
  // Destrói os DbObjects criados
  FreeAndNil (FDbGrupoRateioFluxo);
  FreeAndNil (FDbPadraoRateioFluxo);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
  begin
    FreeAndNil(FCdsGrupoRateioFluxo);
    FreeAndNil(FCdsPadraoRateioFluxo);
  end;

  inherited;
end;

procedure TCtrlGrupoRateioFluxo.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbGrupoRateioFluxo.DataBaseName  := DataBaseName;
  FDbPadraoRateioFluxo.DataBaseName := DataBaseName;
end;


procedure TCtrlGrupoRateioFluxo.OnCreateAppServer;
begin
   inherited;
   // Cria os Cds somente no caso de execução pela aplicação servidora,
   // pq na aplicação cliente os mesmos já foram criados.
   FCdsGrupoRateioFluxo  := TCMClientDataSet.Create(nil);
   FCdsPadraoRateioFluxo := TCMClientDataSet.Create(nil);
end;



function TCtrlGrupoRateioFluxo.GravaGrupoRateioFluxo: Boolean;
var
   sMsg : String;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaGrupoRateioFluxo( CdsGrupoRateioFluxo.Data, CdsPadraoRateioFluxo.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;
         if VerificaRateio( sMsg ) then
         begin
            // Grava Pai
            Result := ApplyCds( CdsGrupoRateioFluxo, DbGrupoRateioFluxo, [], [] );
            if not(Result) then raise Exception.Create( DbGrupoRateioFluxo.MessageInfo );

            // Grava Filho 
            Result := ApplyCds( CdsPadraoRateioFluxo, DbPadraoRateioFluxo, [DbGrupoRateioFluxo.IdGrupoRateioFluxo], [DbPadraoRateioFluxo.IdGrupoRateioFluxo] );
            if not(Result) then raise Exception.Create( DbPadraoRateioFluxo.MessageInfo );

            Commit;
         end
         else
         begin
            raise Exception.Create( sMsg );
         end;

      except
         on E : Exception do begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlGrupoRateioFluxo.ExcluiGrupoRateioFluxo: Boolean;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiGrupoRateioFluxo( CdsGrupoRateioFluxo.Data, CdsPadraoRateioFluxo.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // Marca todos os filhos para exclusão
         CdsPadraoRateioFluxo.First;
         while not(CdsPadraoRateioFluxo.EOF) do CdsPadraoRateioFluxo.Delete;

         // Exclui PadraoRateioDoc ( Filho )
         Result := ApplyCds( CdsPadraoRateioFluxo, DbPadraoRateioFluxo, [], [] );
         if not(Result) then raise Exception.Create( DbPadraoRateioFluxo.MessageInfo );

         // Exclui Imóvel ( Pai )
         Result := ApplyCds( CdsGrupoRateioFluxo, DbGrupoRateioFluxo, [], [] );
         if not Result then raise Exception.Create( DbGrupoRateioFluxo.MessageInfo );

         Commit;
      except
         on E : Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlGrupoRateioFluxo.LookupGrupoRateioFluxo(const IDGrupoRateioFluxo: Integer = -1): OleVariant;
var
   sSql, sParam: string;
begin
   // Define Parâmetros
   sParam := '';
   if IDGrupoRateioFluxo <> -1 then sParam := sParam + ' AND IDGRUPORATEIOFLUXO = '+ IntToStr(IDGrupoRateioFluxo);

   // Define Sql
   //sSql := 'SELECT IDGRUPORATEIOFLUXO, GRRFDESCRICAO ' + #13 + // Leandro WO13599
   sSql := 'SELECT IDGRUPORATEIOFLUXO, GRRFDESCRICAO, TIPORATEIO ' + #13 +   //Leandro WO13599
           '  FROM GRUPORATEIOFLUXO '  + #13 +
           ' WHERE 1=1 ' + sParam + #13 +
           ' ORDER BY GRRFDESCRICAO ';

   Result := GetDataPacket(sSql);
end;



function TCtrlGrupoRateioFluxo.LookupPadraoRateioFluxo(const IDGrupoRateioFluxo: Extended;
                                                       const IDEmpresaProp: Int64
                                                      ): OLEVariant;
var
   sSql, sParam: string;
begin
   // Define Parâmetros
   sParam := '';
   if Trunc(IDGrupoRateioFluxo) <> -1 then sParam := sParam + #13 + '  AND PDR.IDGRUPORATEIOFLUXO = ' + FormatFloat('#0', trunc(IDGrupoRateioFluxo));

   sSQL :=
   'SELECT '                                                   + #13 +
   '  PDR.IDPADRAORATEIOFLUXO, '                               + #13 +
   '  PDR.IDGRUPORATEIOFLUXO, '                                + #13 +
   '  PDR.IDEMPRESAPROP, '                                     + #13 +
   '  PDR.UNIDNEGOC, UND.NOME AS UNIDNEGOCIO, '                + #13 +
   '  PDR.CODCENTRORESPON, CRE.NOME AS CENTRORESPON, '         + #13 +
   '  PDR.CODCENTROCUSTO, CC.NOME AS CENTROCUSTO, '            + #13 + //LEANDRO WO13599
   '  PDR.IDFLUXOCAIXA, FLC.DESCRICAO AS FLUXOCAIXA, '         + #13 +
   '  PDR.CODLINHAFLUXO, FLX.DESCRICAO AS LINHADEFLUXO, '      + #13 +
   '  PDR.RECPAG, '                                            + #13 +
   '  PDR.CODTIPRECDES, TRD.DESCRICAO AS TIPODESEMBOLSO, '     + #13 +
   '  PDR.IDSEGREGACRITER, SCR.DESCRICAO AS SEGREGACRITER, '   + #13 +
   '  PDR.IDPATRO, PTR.NOME AS PATRO, '                        + #13 +
   '  PDR.IDPLANOPREV, PLP.NOME AS PLANPREV, '                 + #13 +
   '  PDR.CODTIPDOC, TRP.DESCRICAO AS TIPODOCUMENTO, '         + #13 +
   '  PDR.MOECODIGO, MOE.MOEDESC AS MOEDA, '                   + #13 +
   '  PDR.IDPROGRAMA,  '                                       + #13 + //LEANDRO WO13599
   '  PRG.DESCPROGRAMA  AS PROGRAMA, '                         + #13 + //LEANDRO WO13599
   '  PDR.PERCENTRATEIO '                                      + #13 +
   'FROM '                                                     + #13 +
   '  PADRAORATEIOFLUXO PDR, '                                 + #13 +
   '  UNIDNEGOCIO UND, '                                       + #13 +
   '  CENTRESPON CRE, '                                        + #13 +
   '  CENTCUST CC, '                                           + #13 + //LEANDRO WO13599
   '  FLUXOCAIXA FLC, '                                        + #13 +
   '  PESSOA PTR, '                                            + #13 +
   '  SEGREGACRITER SCR, '                                     + #13 +
   '  PLANPREVCONTABIL PLP, '                                  + #13 +
   '  TIPODOCRECPAG TRP, '                                     + #13 +
   '  MOEDA MOE, '                                             + #13 +
   '  TIPORECEBDESEMB TRD, '                                   + #13 +
   '  PROGRAMA PRG,  '                                         + #13 + //LEANDRO WO13599
   '  MONTAFLUXO FLX '                                         + #13 +
   'WHERE '                                                    + #13 +
   '      PDR.IDEMPRESAPROP = ' + IntToStr(IDEmpresaProp)      + #13 +
   '  AND PDR.RECPAG = ''P'' '                                 + #13 +
   '  AND PDR.IDEMPRESAPROP = UND.IDPESSOA(+) '                + #13 +
   '  AND PDR.UNIDNEGOC = UND.UNIDNEGOC(+) '                   + #13 +
   '  AND PDR.IDEMPRESAPROP = CRE.IDPESSOA(+) '                + #13 +
   '  AND PDR.CODCENTRORESPON = CRE.CODCENTRORESPON(+) '       + #13 +
   '  AND PDR.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) '          + #13 +  //LEANDRO WO13599
   '  AND PDR.IDFLUXOCAIXA = FLC.IDFLUXOCAIXA(+) '             + #13 +
   '  AND PDR.IDSEGREGACRITER = SCR.IDSEGREGACRITER(+) '       + #13 +
   '  AND PDR.IDPATRO = PTR.IDPESSOA(+) '                      + #13 +
   '  AND PDR.IDPLANOPREV = PLP.IDPLANOPREV(+) '               + #13 +
   '  AND PDR.CODTIPDOC = TRP.CODTIPDOC(+) '                   + #13 +
   '  AND PDR.MOECODIGO = MOE.MOECODIGO(+) '                   + #13 +
   '  AND PDR.IDEMPRESAPROP = TRD.IDPESSOA(+) '                + #13 +
   '  AND PDR.RECPAG = TRD.RECPAG(+) '                         + #13 +
   '  AND PDR.CODTIPRECDES = TRD.CODTIPRECDES(+) '             + #13 +
   '  AND PDR.IDPROGRAMA = PRG.IDPROGRAMA(+)  '                + #13 + //LEANDRO WO13599
   '  AND PDR.CODLINHAFLUXO = FLX.CODLINHAFLUXO(+) ' + sParam  + #13 +
   'ORDER BY '                                                 + #13 +
   '  PDR.PERCENTRATEIO ';

   Result := GetDataPacket(sSql);
end;

procedure TCtrlGrupoRateioFluxo.SetDbGrupoRateioFluxo(const Value: TDbGrupoRateioFluxo);
begin
  FDbGrupoRateioFluxo := Value;
end;

procedure TCtrlGrupoRateioFluxo.SetCdsGrupoRateioFluxo(const Value: TCMClientDataSet);
begin
  FCdsGrupoRateioFluxo := Value;
end;

procedure TCtrlGrupoRateioFluxo.SetDbPadraoRateioFluxo(const Value: TDbPadraoRateioFluxo);
begin
  FDbPadraoRateioFluxo := Value;
end;

procedure TCtrlGrupoRateioFluxo.SetCdsPadraoRateioFluxo(const Value: TCMClientDataSet);
begin
  FCdsPadraoRateioFluxo := Value;
end;

function TCtrlGrupoRateioFluxo.VerificaRateio(var sMsgErro: String): Boolean;
var
   bTipoOk : Boolean;
   iPerc   : Extended;
begin
   Result   := True;
   sMsgErro := '';

   with CdsPadraoRateioFluxo do
   begin
      DisableControls;
      First;
      iPerc   := 0;
      bTipoOk := True;

      while not(EOF) do
      begin
         iPerc := ArredondaParaComparar(iPerc, 4) +
                  ArredondaParaComparar(FieldByName('PERCENTRATEIO').AsFloat, 4);
         Next;
      end;

      First;
      EnableControls;
      //Helen - SOL: 159341 KINTANA: 1308968
      //if iPerc > 100 then
      if RoundCm(iPerc,2) > 100 then
      begin
         sMsgErro := sMsgErro + 'Percentual total de rateio ultrapassa 100%';
         Result   := False;
      end;
   end;
end;

function TCtrlGrupoRateioFluxo.ArredondaParaComparar(rValor: Real;
  iNumDecimais: Integer): Real;
var
  sMascara, sAuxValor:String;
Begin
  If iNumDecimais < 0 then
    sMascara := '%17.0f'
  Else
    sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

  sAuxValor := Trim(Format(sMascara,[rValor]));

  while Pos('.',sAuxValor) <> 0 do
    Delete(sAuxValor,Pos('.',sAuxValor),1);

  Result := StrToFloat(sAuxValor)
End;

end.
