// *************************************************************************************************
//Pendência   : SOL 227909/16859 PPM 627826
//Responsável : Fernando Xavier
//Data        : 19/03/2015
//Descrição   : Alteração do Extrato de Institutos e Gerar Arquivo Excel
// *************************************************************************************************
unit UctrlExtratoDesligamento;

interface

Uses SysUtils, uCmControlObject, uCmDbObject,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uCmClientDataSet, uMidasUtil, UCMFileUtils;


  type

  TCtrlExtratoDesligamento = class(TCmControlObject)
    public

    Procedure MontaSQLPercCusteioRisco(iIdUsuario, iIdPlanoPrev: Integer; cds: TCMClientDataSet);
    Procedure MontaSQLGeral(iIdUsuario: Integer; cds: TCMClientDataSet);
    Procedure MontaSQLRegReplan(iIdUsuario: Integer; cds: TCMClientDataSet);
    Procedure MontaSQLRegReplanSaldado(iIdUsuario: Integer; cds: TCMClientDataSet);
    Procedure MontaSQLNovoPlano(iIdUsuario: Integer; cds: TCMClientDataSet);
    Procedure MontaSQLReb(iIdUsuario: Integer; cds: TCMClientDataSet);

    protected
    procedure DoChangeDataBase; Override;
  end;


implementation



{ TCtrlExtratoDesligamento }

procedure TCtrlExtratoDesligamento.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlExtratoDesligamento.MontaSQLGeral(iIdUsuario: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin

    sSql := ' select tmp.IDPESSOA, tmp.IDPLANOPREV,  '+
            '        nvl(tmp.proxplano,tmp.IDPLANOPREV) proxplano, '+
            '        tmp.proxpessoa, '+
            '        tmp.IDSITPLANOPREV  from '+
            ' ( select  IDPESSOA,   '+
            ' Nvl(lag(IDPESSOA) over (order by IDPLANOPREV, IDPESSOA),0) as proxpessoa, '+
            ' IDPLANOPREV,    '+
            ' lead(IDPLANOPREV) over (order by IDPLANOPREV, IDPESSOA) as proxplano, '+
            ' IDSITPLANOPREV  '+
            ' from relextratodosinstitutos   '+
            ' where IDSITPLANOPREV <> 3 AND OBSERVACAO IS NULL  AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) +
            ' order by IDPESSOA, IDPLANOPREV) tmp   ';     //    where tmp.IDPESSOA <> tmp.proxpessoa

    //sSql := ' SELECT DISTINCT IDPESSOA, IDSITPLANOPREV, IDPLANOPREV FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL AND IDSITPLANOPREV <> 3 order by  IDPLANOPREV, IDPESSOA   ';
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

   { if cds.recordcount <= 1 then
    begin

      sSql := ' select tmp.IDPESSOA, tmp.IDPLANOPREV,  '+
              '        nvl(tmp.proxplano,tmp.IDPLANOPREV) proxplano, '+
              '        tmp.proxpessoa, '+
              '        tmp.IDSITPLANOPREV  from '+
              ' ( select  IDPESSOA,   '+
              ' Nvl(lag(IDPESSOA) over (order by IDPLANOPREV, IDPESSOA),0) as proxpessoa, '+
              ' IDPLANOPREV,    '+
              ' lead(IDPLANOPREV) over (order by IDPLANOPREV, IDPESSOA) as proxplano, '+
              ' IDSITPLANOPREV  '+
              ' from relextratodosinstitutos   '+
              ' where IDSITPLANOPREV <> 3 AND OBSERVACAO IS NULL  AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) +
              ' order by IDPESSOA, IDPLANOPREV) tmp ';     //

      //sSql := ' SELECT DISTINCT IDPESSOA, IDSITPLANOPREV, IDPLANOPREV FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL AND IDSITPLANOPREV <> 3 order by  IDPLANOPREV, IDPESSOA   ';
      cds.Close;
      cds.Data := GetDataPacket(sSQL);      

    end;      }
end;


procedure TCtrlExtratoDesligamento.MontaSQLPercCusteioRisco(iIdUsuario, iIdPlanoPrev: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin
    if  iIdPlanoPrev = 66 then
    begin
      sSql := ' SELECT 1 qtde  FROM VALTABGENER  WHERE CODTABELA = ''TAB_REB_2002CEF''   '+
              ' AND CODCAMPO in (''BRISCO_PATROC'', ''DES_ADM_PATR'')    AND NUMLINHA = (SELECT MAX(NUMLINHA)   '+
              '         FROM VALTABGENER WHERE CODTABELA = ''TAB_REB_2002CEF'' AND CODCAMPO in (''BRISCO_PATROC'', ''DES_ADM_PATR'')) ';
    end
    else
    if  iIdPlanoPrev = 74 then
    begin
      sSql := '  SELECT 1 qtde   FROM VALTABGENER '+
              '   WHERE CODTABELA = ''TAB_NOVOPLANO''    AND CODCAMPO in (''BRISCO_PATROC'', ''DES_ADM_PATR'') '+
              '   AND NUMLINHA = (SELECT MAX(NUMLINHA) FROM VALTABGENER WHERE CODTABELA = ''TAB_NOVOPLANO'' '+
              '   AND CODCAMPO in (''BRISCO_PATROC'', ''DES_ADM_PATR'')) ';    end;
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

end;





procedure TCtrlExtratoDesligamento.MontaSQLRegReplan(iIdUsuario: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin

    sSql := ' SELECT * FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL  AND IDSITPLANOPREV <> 25 AND IDPLANOPREV = 2 AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) + ' ORDER BY IDPESSOA, IDPLANOPREV  ';
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

end;

procedure TCtrlExtratoDesligamento.MontaSQLRegReplanSaldado(iIdUsuario: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin

    sSql := ' SELECT * FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL AND IDSITPLANOPREV = 25 AND IDPLANOPREV = 2 AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) + ' ORDER BY IDPESSOA, IDPLANOPREV ';
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

end;

procedure TCtrlExtratoDesligamento.MontaSQLNovoPlano(iIdUsuario: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin

    sSql := ' SELECT * FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL AND IDPLANOPREV = 74 AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) + ' ORDER BY IDPESSOA, IDPLANOPREV ';
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

end;
procedure TCtrlExtratoDesligamento.MontaSQLReb(iIdUsuario: Integer; cds: TCMClientDataSet);
var sSql,sCampo : String;

begin

    sSql := ' SELECT * FROM RELEXTRATODOSINSTITUTOS WHERE OBSERVACAO IS NULL AND IDPLANOPREV = 66 AND IDSESSAO = '+FloatToStr(iIdUsuario)+formatdatetime('ddmmyyyy',now) + ' ORDER BY IDPESSOA, IDPLANOPREV ';
    cds.Close;
    cds.Data := GetDataPacket(sSQL);

end;

end.
