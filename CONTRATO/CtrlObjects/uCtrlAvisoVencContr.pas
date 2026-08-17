{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: ListContratosVenc
Atender.........: WO10498
Data............: 13/05/2024
Responsável.....: Luis Ferrari
Descrição.......: Incluir Flag Vigencia Indeterminada para desobrigar a data prevista de encerramento do contrato
--------------------------------------------------------------------------------
Rotina..........: ListContratosVenc
N. SIG..........: WO10578
Data............: 09/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Adicionado o Status do contrato
--------------------------------------------------------------------------------
N. Sol..........: 174920
N. Kintana......: 1591690
Data............: 25/10/2012
Responsável.....: Thiago Melo
Descrição.......: Manter histórico de renovação de contratos
-------------------------------------------------------------------------------
Rotina..........: ListContratosVenc
N. Sol..........: 168270
N. Kintana......: 1481496
Data............: 15/02/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: incluir na pesquisa flag para informar que o contrato está em
                  processo de renovação e o responsável
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------}

unit uCtrlAvisoVencContr;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uCMTypes, uDbAditamento, uCtrlRAD;

type
   TCtrlAvisoVencContr = Class(TCmControlObject)

   private
      FDbAditamento  : TDbAditamento;
   public
      CtrlRAD : TCtrlRAD;
      constructor Create; override;
      destructor Destroy; override;

      function IniciaRenovacao(const ovDadosContratos: OleVariant; rIDPessoa, rIDUsuario: Double): Boolean;
      function ListContratosVenc(rIDPessoa,rIDUsuario: Double):OleVariant;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlAvisoVencContr }

constructor TCtrlAvisoVencContr.Create;
begin
   inherited;
   CtrlRAD:=TCtrlRAD.Create;
   FDbAditamento:=TDbAditamento.Create(Self);
end;

procedure TCtrlAvisoVencContr.OnCreateAppServer;
begin
   inherited;
end;

destructor TCtrlAvisoVencContr.Destroy;
begin
   inherited;
   CtrlRAD.Free;
   FDbAditamento.Free;
end;

procedure TCtrlAvisoVencContr.AfterInitialize;
begin
   inherited;
   CtrlRAD.InitializeAs(Self);
   CtrlRAD.OpenTransaction:=False;
end;

procedure TCtrlAvisoVencContr.DoChangeDataBase;
begin
   inherited;
   FDbAditamento.DataBaseName:=DataBaseName;
end;

function TCtrlAvisoVencContr.IniciaRenovacao(
  const ovDadosContratos: OleVariant; rIDPessoa, rIDUsuario: Double): Boolean;
var
   iIdProcesso : Integer;
begin
   Result:=True;
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.IniciaRenovacao(ovDadosContratos,rIDPessoa);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          with TCMClientDataSet.Create(nil) do
             try
                Data:=ovDadosContratos;

                Filtered:=False;
                Filter:='MARCADO = ''S''';
                Filtered:=True;

                First;
                while not(Eof) do
                begin
                   CtrlRAD.TipoProcesso:=Trunc(FieldByName('IDTIPOPROCESSORAD').AsFloat);
                   CtrlRAD.IdPessoa:=Trunc(rIDPessoa);
                   CtrlRAD.IdUsuario:=Trunc(rIDUsuario);
                   CtrlRAD.CodCentroRespon:=FieldByName('CODCENTRORESPON').AsString;
                   CtrlRAD.UnidNegoc:=Trunc(FieldByName('UNIDNEGOC').AsFloat);
                   CtrlRAD.OBS:='Renovação de Contrato: '+FieldByName('NOMECONTRATO').AsString;
                   CtrlRAD.Valor:=0;
                   CtrlRAD.CodGrupoProd:='';
                   iIdProcesso:=CtrlRAD.IniciarProcesso;

                   Result:=(iIdProcesso>0);
                   if not(Result) then
                    begin
                       MessageInfo:=CtrlRAD.MessageInfo;
                       Rollback;
                       Exit;
                    end
                   else
                    begin
                       FDbAditamento.Idcontrato.AsFloat:=FieldByName('IDCONTRATO').AsFloat;
                       FDbAditamento.Dataassaditamento.AsDateTime:=Now;
                       FDbAditamento.Descaditamento.AsString:='Renovação de Contrato';
                       FDbAditamento.Codaditamento.AsString:='*Renovação*';
                       FDbAditamento.Idprocesso.AsFloat:=iIdProcesso;
                       Result:=FDbAditamento.Insert;
                       if not(Result) then
                        begin
                           MessageInfo:=FDbAditamento.MessageInfo;
                           Rollback;
                           Exit;
                        end;
                    end;

                   Next;
                end;
             finally
                Free;
             end;

          if Result then Commit;
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

function TCtrlAvisoVencContr.ListContratosVenc(rIDPessoa,
  rIDUsuario: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         //WO10578 - Helen V Bianchi - Inicio
         ' decode(c.flgfimcontrato, ''E'', ''Encerrado'',  '+
         '     decode(nvl(c.flgfase_encerramento, ''N''), ''S'', ''Em Encerramento'','+
         '     decode(nvl(c.flgrenovacao, ''N''), ''S'', ''Em Renovação'','+
         '     decode(c.flgfimcontrato, ''N'', ''Em Aberto'', ''S'', ''Vigente'', ''A'', '+
         '     ''Aprovado'', ''R'', ''Recusado'',  ''X'', ''Excluído'')))) as STATUS, '+
         //WO10578 - Helen V Bianchi - Fim
         ' ''N'' AS MARCADO, '+
         '   C.IDCONTRATO, '+
         '   C.NOMECONTRATO, '+
         '   C.DATAPREVENCERRA, '+
         '   C.AVISO, '+
         '   (TO_DATE(DATAPREVENCERRA,''dd/mm/yy'')-AVISO) DATAAVISO, '+
         '   (ROUND(TO_DATE(DATAPREVENCERRA,''dd/mm/yy'')-TO_DATE(SYSDATE,''dd/mm/yy''))) DIASFALTAM, '+
         '   C.FLGFIMCONTRATO, '+
         '   C.IDTIPOPROCESSORAD, '+
         '   C.CODCENTRORESPON, '+
         '   C.UNIDNEGOC, '+
         '   ADT.IDPROCESSO, '+
         '   RI.FLGOK, '+
         '   RI.OBS, '+
         '   DECODE(C.FLGRENOVACAO, ''S'', ''Sim'', '''') AS FLGRENOVACAO, '+  // Edilaine - SOL 168270 / KTN 1481496
//         '   C.RESPRENOVACAO '+  // Edilaine - SOL 168270 / KTN 1481496
         //  Thiago Melo SOL 174920 KINTANA 1591690 ini
         '   C.RESPRENOVACAO, '+         
         '   HST.DTANDAMENTO, ' +
         '   HST.DESCANDAMENTO ' +
         //  Thiago Melo SOL 174920 KINTANA 1591690 fim
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   (SELECT '+
         '       AD1.IDCONTRATO, '+
         '       AD1.IDPROCESSO '+
         '    FROM '+
         '       ADITAMENTO AD1 '+
         '    WHERE '+
         '       (AD1.IDADITAMENTO = (SELECT Max(IDADITAMENTO) '+
         '                            FROM ADITAMENTO AD2 '+
         '                            WHERE (AD2.IDCONTRATO=AD1.IDCONTRATO)))) ADT, '+
         '   (SELECT '+
         '       IDPROCESSO, '+
         '       FLGOK, '+
         '       OBS '+
         '    FROM RADINSTPROCESSO '+
         //  Thiago Melo SOL 174920 KINTANA 1591690 ini
//         '    WHERE (IDPESSOA='+FloatToStr(rIDPessoa)+')) RI ' +
         '    WHERE (IDPESSOA='+FloatToStr(rIDPessoa)+')) RI, ' +
         '   (SELECT CONTR.IDCONTRATO, ' +
         '           HIST1.IDHSTRENOVACONTRATO, ' +
         '           HIST1.DTANDAMENTO, ' +
         '           HIST1.DESCANDAMENTO ' +
         '      FROM CONTRATOCONTR CONTR ' +
         '     INNER JOIN HSTRENOVACONTRATO HIST1 ' +
         '        ON (HIST1.IDCONTRATO = CONTR.IDCONTRATO) ' +
         '     WHERE HIST1.IDHSTRENOVACONTRATO = ' +
         '           (SELECT MAX(IDHSTRENOVACONTRATO) FROM HSTRENOVACONTRATO HIST2 ' +
         '             WHERE (HIST2.IDCONTRATO = HIST1.IDCONTRATO))) HST ' +
         //  Thiago Melo SOL 174920 KINTANA 1591690 fim
         'WHERE (C.IDCONTRATO=ADT.IDCONTRATO(+)) AND '+
         '      (ADT.IDPROCESSO=RI.IDPROCESSO(+)) AND '+
         '      ((C.DATAPREVENCERRA-C.AVISO)<=SYSDATE) AND '+
         '      (NVL(C.FLGVIGENCIAINDETERMINADA, ''N'') = ''N'') AND '+          // WO10498 Ferrari
         '      (C.FLGFIMCONTRATO = ''S'') AND '+
         '      (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      (C.IDCONTRATO IN (SELECT CUS.IDCONTRATO '+
         '                        FROM CONTRATOUSUARIO CUS '+
         '                        WHERE  CUS.IDUSUARIO = '+FloatToStr(rIDUsuario)+')) ' +
         //  Thiago Melo SOL 174920 KINTANA 1591690 ini
         '  AND (C.IDCONTRATO = HST.IDCONTRATO(+)) ' +
         //  Thiago Melo SOL 174920 KINTANA 1591690 fim
         'ORDER BY DATAPREVENCERRA ';

   Result:=GetDataPacket(sSql);
end;

end.
