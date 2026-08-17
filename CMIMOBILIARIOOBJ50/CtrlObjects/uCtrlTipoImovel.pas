{
========================================================
Alterações
========================================================
//***************************************************************************************
//Rotina.............: LookupAlteradoXTipoImo
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para definição de valor de base de tributos.
//***************************************************************************************
//Rotina.............: LookupAlteradoXTipoImo
//N. SIG.............: 89101
//Data da Alteração..: 05/08/2018
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da funcionalidade para a inclusão de Nota Fiscal de Serviço.
//***************************************************************************************
Analista.: Helen V. Bianchi
Data.....: 09/10/2011
SOL/Kintana: 136341 / 815095
Descrição: Criar rotina LookupBaixaConAltXTipoImo Utilizado na Confissão 
========================================================
SOL: 162907
Kintana: 1387467
Autor: Marcio Sanches Spinosa 
Descrição: Ajuste no select para trazer um valor em branco
========================================================
}
unit uCtrlTipoImovel;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCMTypes, uDBTipoImovel, uDBAlteradorXTipoImo;


type
  tCtrlTipoImovel = class(TCmControlObject)
  private
    FCdsTipoImovel: TCMClientDataSet;
    FdbTipoImovel: TDbTipoImovel;
    FCdsAlteradorXTipoImo: TCMClientDataSet;
    FdbAlteradorXTipoImo: TDbAlteradorXTipoimo;
    procedure SetCdsTipoImovel(const Value: TCMClientDataSet);
    procedure SetdbTipoImovel(const Value: TDbTipoImovel);
    procedure SetCdsAlteradorXTipoImo(const Value: TCMClientDataSet);
    procedure SetdbAlteradorXTipoImo(const Value: TDbAlteradorXTipoimo);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // tabela OutroDado
    property dbTipoImovel: TDbTipoImovel read FdbTipoImovel write SetdbTipoImovel;
    property CdsTipoImovel: TCMClientDataSet read FCdsTipoImovel write SetCdsTipoImovel;

    // tabela AlteradorXTipoImo
    property dbAlteradorXTipoImo: TDbAlteradorXTipoimo read FdbAlteradorXTipoImo write SetdbAlteradorXTipoImo;
    property CdsAlteradorXTipoImo: TCMClientDataSet read FCdsAlteradorXTipoImo write SetCdsAlteradorXTipoImo;

    function LookupTipoImovel(const sCodTipoImovel: string = ''): OLEVariant;
    function LookupAlteradoXTipoImo (const iIdPessoa: integer;
                                    const iCodAlterador: integer = -1;
                                    const sCodTipoImovel: string = '';
                                    const sRecPag: string = '';
                                    const sAcrescDecresc: string = '';
                                    const pForm : Integer = -1): OleVariant;//Marcio Sanches Spinosa SOL 162907 Kintana 1387467
	//Helen - SOL : 136341 Kintana : 815095
    function LookupBaixaConAltXTipoImo(const iIdPessoa: integer;const iCodAlterador: integer = -1; const sCodTipoImovel: string = ''; const sAcrescDecresc: string = ''; const iIdModulo: integer = -1): OleVariant;
    function GravaTipoImovel: boolean;
    function GravaAlteradorXTipoImo: boolean;

  published

end;

implementation

{ tCtrlTipoImovel }

constructor tCtrlTipoImovel.Create;
begin
  inherited;
  FdbTipoImovel := TDbTipoImovel.Create( Self );
  FdbAlteradorXTipoImo := TDbAlteradorXTipoimo.Create( Self );
end;

procedure tCtrlTipoImovel.onCreateAppServer;
begin
  inherited;
  FCdsTipoImovel := TCMClientDataSet.Create (nil);
  FCdsAlteradorXTipoImo := TCMClientDataSet.Create (nil);
end;

destructor tCtrlTipoImovel.Destroy;
begin
  inherited;
  FreeAndNil (FdbTipoImovel);
  FreeAndNil (FdbAlteradorXTipoImo);

  if isAppServer then begin
    FreeAndNil (FCdsTipoImovel);
    FreeAndNil (FCdsAlteradorXTipoImo);
  end;
end;

procedure tCtrlTipoImovel.AfterInitialize;
begin
  inherited;
  FdbTipoImovel.DataBaseName := DataBaseName;
  FdbAlteradorXTipoImo.DataBaseName := DataBaseName;
end;

function tCtrlTipoImovel.GravaTipoImovel: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaTipoImovel (CdsTipoImovel.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsTipoImovel, dbTipoImovel, [], []);
      sMsg := dbTipoImovel.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function tCtrlTipoImovel.GravaAlteradorXTipoImo: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaAlteradorXTipoImo (CdsAlteradorXTipoImo.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsAlteradorXTipoImo, dbAlteradorXTipoImo, [], []);
      sMsg := dbAlteradorXTipoImo.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function tCtrlTipoImovel.LookupTipoImovel(const sCodTipoImovel: string): OLEVariant;
var sSql,sParam : String;
begin
  sParam := '';
  if sCodTipoImovel <> '' then sParam := sParam + ' AND CODTIPIMOVEL = ' + QuotedStr(sCodTipoImovel);

  sSql := 'SELECT TI.CODTIPIMOVEL,      TI.DESCTIPOIMOVEL,  TI.IDGRUPOTERRENO,    '+#13+
          '       TI.IDGRUPOEDIFICACAO, TI.IDGRUPOINST,     TI.IDGRUPOELET,       '+#13+
          '       TI.IDGRUPOAR,         TI.IDGRUPOVEICULO,  TI.IDGRUPOUTILITARIO, '+#13+
          '       TI.IDGRUPOMAQUINA,    TI.IDGRUPOMOVEL,    TI.CODALTMULTA,       '+#13+
          '       TI.CODALTJUROS,       TI.CODALTCORRMON,   TI.CODALTMTAL,        '+#13+
          '       TI.CODALTJRAL,        TI.CODALTCMAL,      TI.CODIMOVELSPC,      '+#13+
          '       TI.IDCARTEIRASPC,     TI.FLGTIPOINTERNO,  TI.CODALTCONFISSAO,   '+#13+
          '       NVL(TI.FLGCTBCONFISSAO,0) AS FLGCTBCONFISSAO,                   '+#13+
          '       TAM.DESCRICAO  AS ALTERADOR_MULTA,     '+#13+
          '       TAJ.DESCRICAO  AS ALTERADOR_JUROS,     '+#13+
          '       TAR.DESCRICAO  AS ALTERADOR_CORRECAO,  '+#13+
          '       TAM2.DESCRICAO AS ALTERADOR_MULTAAL,   '+#13+
          '       TAJ2.DESCRICAO AS ALTERADOR_JUROSAL,   '+#13+
          '       TAR2.DESCRICAO AS ALTERADOR_CORRECAOAL, '+#13+
          '       TAC.DESCRICAO  AS ALTERADOR_CONFISSAO '+#13+
          '  FROM TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR, '+#13+
          '       TIPOALTERADOR TAM2, TIPOALTERADOR TAJ2, TIPOALTERADOR TAR2, TIPOALTERADOR TAC '+#13+
          ' WHERE TI.CODALTMULTA   = TAM.CODALTERADOR(+)  '+#13+
          '   AND TI.CODALTJUROS   = TAJ.CODALTERADOR(+)  '+#13+
          '   AND TI.CODALTCORRMON = TAR.CODALTERADOR(+)  '+#13+
          '   AND TI.CODALTMTAL    = TAM2.CODALTERADOR(+) '+#13+
          '   AND TI.CODALTJRAL    = TAJ2.CODALTERADOR(+) '+#13+
          '   AND TI.CODALTCONFISSAO = TAC.CODALTERADOR(+) '+#13+
          '   AND TI.CODALTCMAL    = TAR2.CODALTERADOR(+) '+#13+ sParam +
          ' ORDER BY DESCTIPOIMOVEL ';

  Result := GetDataPacket( sSql );
end;

function tCtrlTipoImovel.LookupAlteradoXTipoImo(const iIdPessoa: integer; const iCodAlterador: integer;
                                                const sCodTipoImovel: string; const sRecPag: string;
                                                const sAcrescDecresc: string; const pForm : Integer): OleVariant;
var sSql,sParam : String;
begin
	//Marcio Sanches Spinosa SOL 162907 Kintana 1387467 - Inicio
  if (pForm = -1) then
  begin
    sParam := ' AND T.IDPESSOA = ' + IntToStr(iIdPessoa) +#13;
    if iCodAlterador  <> -1 then sParam := sParam + ' AND A.CODALTERADOR = '+ IntToStr(iCodAlterador)   +#13;



    // Marcio Motta - 18/02/2004 - Pendência: 16082
    if (sCodTipoImovel <> '') then
       if (pos(',',sCodTipoImovel) > 0) then
          sParam := sParam + ' AND A.CODTIPIMOVEL IN (' + sCodTipoImovel + ')' + #13
       else sParam := sParam + ' AND A.CODTIPIMOVEL = '+ QuotedStr(sCodTipoImovel) +#13;
    //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

    if sRecPag        <> '' then sParam := sParam + ' AND T.RECPAG = '+ QuotedStr(sRecPag) +#13;
    if sAcrescDecresc <> '' then sParam := sParam + ' AND T.ACRESDECRES = '+ QuotedStr(sAcrescDecresc)  +#13;

    sSql := 'SELECT A.CODTIPIMOVEL, A.CODALTERADOR, T.DESCRICAO,       '+#13+
            '       T.ACRESDECRES, T.RECPAG,                           '+#13+
            '       SUBSTR(TRIM(TO_CHAR(A.CODALTERADOR) || A.CODTIPIMOVEL), 0, 255) AS CHAVE '+#13+
            '       , NVL(T.FLGLANCANFS, ''N'') AS FLGLANCANFS         '+#13+ //Cássio Rovaroto - SIG nº 89101
            '       , NVL(T.FLGVALORBASE, ''N'') AS FLGVALORBASE       '+#13+ //Cássio Rovaroto - SIG nº 115585
            '  FROM ALTERADORXTIPOIMO A, TIPOALTERADOR T               '+#13+
            ' WHERE A.CODALTERADOR = T.CODALTERADOR '+#13+ sParam +
            ' ORDER BY T.DESCRICAO ';
  end
  else
  begin
	//Marcio Sanches Spinosa SOL 162907 Kintana 1387467 - Fim  
    sParam := ' AND T.IDPESSOA = ' + IntToStr(iIdPessoa) +#13;
    if iCodAlterador  <> -1 then sParam := sParam + ' AND A.CODALTERADOR = '+ IntToStr(iCodAlterador)   +#13;

    // Marcio Motta - 18/02/2004 - Pendência: 16082
    if (sCodTipoImovel <> '') then
       if (pos(',',sCodTipoImovel) > 0) then
          sParam := sParam + ' AND A.CODTIPIMOVEL IN (' + sCodTipoImovel + ')' + #13
       else sParam := sParam + ' AND A.CODTIPIMOVEL = '+ QuotedStr(sCodTipoImovel) +#13;
    //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

    if sRecPag        <> '' then sParam := sParam + ' AND T.RECPAG = '+ QuotedStr(sRecPag) +#13;
    if sAcrescDecresc <> '' then sParam := sParam + ' AND T.ACRESDECRES = '+ QuotedStr(sAcrescDecresc)  +#13;

    sSql := 'SELECT A.CODTIPIMOVEL, A.CODALTERADOR, T.DESCRICAO,       '+#13+
            '       T.ACRESDECRES, T.RECPAG,                           '+#13+
            '       TO_CHAR(A.CODALTERADOR) || A.CODTIPIMOVEL AS CHAVE '+#13+
            '  FROM ALTERADORXTIPOIMO A, TIPOALTERADOR T               '+#13+
            ' WHERE A.CODALTERADOR = T.CODALTERADOR '+#13+ sParam +
	//Marcio Sanches Spinosa SOL 162907 Kintana 1387467 - Inicio
            ' UNION ALL ' +#13+
            ' SELECT NULL AS CODTIPIMOVEL,  -1 AS CODALTERADOR, '' '' AS DESCRICAO, '+#13+
            '       ''C'' ACRESDECRES, ''R'' AS  RECPAG, '+#13+
            '       NULL AS CHAVE '+#13+
            '  FROM DUAL '+#13+
	//Marcio Sanches Spinosa SOL 162907 Kintana 1387467 - Fim
            ' ORDER BY DESCRICAO ';
  end;
  result := GetDataPacket (sSql);

end;


procedure tCtrlTipoImovel.SetCdsTipoImovel(const Value: TCMClientDataSet);
begin
  FCdsTipoImovel := Value;
end;

procedure tCtrlTipoImovel.SetdbTipoImovel(const Value: TDbTipoImovel);
begin
  FdbTipoImovel := Value;
end;

procedure tCtrlTipoImovel.SetCdsAlteradorXTipoImo( const Value: TCMClientDataSet);
begin
  FCdsAlteradorXTipoImo := Value;
end;

procedure tCtrlTipoImovel.SetdbAlteradorXTipoImo( const Value: TDbAlteradorXTipoimo);
begin
  FdbAlteradorXTipoImo := Value;
end;

function tCtrlTipoImovel.LookupBaixaConAltXTipoImo(const iIdPessoa: integer;
                  const iCodAlterador: integer; const sCodTipoImovel: string;
                  const sAcrescDecresc: string; const iIdModulo: integer): OleVariant;
var sSql,sParam : String;
begin
  //Helen - SOL : 136341 Kintana : 815095
  sParam := ' AND T.IDPESSOA = ' + IntToStr(iIdPessoa) +#13;
  if iCodAlterador  <> -1 then
     sParam := sParam + ' AND A.CODALTERADOR = '+ IntToStr(iCodAlterador)   +#13;
  if iIdModulo  <> -1 then
     sParam := sParam + ' AND A.IDMODULO = '+ IntToStr(iIdModulo)   +#13;
  if (sCodTipoImovel <> '') then
     if (pos(',',sCodTipoImovel) > 0) then
        sParam := sParam + ' AND A.CODTIPIMOVEL IN (' + sCodTipoImovel + ')' + #13
     else sParam := sParam + ' AND A.CODTIPIMOVEL = '+ QuotedStr(sCodTipoImovel) +#13;
  if sAcrescDecresc <> '' then sParam := sParam + ' AND T.ACRESDECRES = '+ QuotedStr(sAcrescDecresc)  +#13;

  sSql := 'SELECT A.CODTIPIMOVEL, A.CODALTERADOR, A.ACRESDECRES, T.DESCRICAO,      '+#13+
          '       TO_CHAR(A.CODALTERADOR) || A.CODTIPIMOVEL AS CHAVE '+#13+
          '  FROM BAIXACONTRAALTERADOR A, TIPOALTERADOR T             '+#13+
          ' WHERE A.CODALTERADOR = T.CODALTERADOR '+#13+ sParam +
          ' ORDER BY T.DESCRICAO ';
  result := GetDataPacket (sSql);
end;


end.
