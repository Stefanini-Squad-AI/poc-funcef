unit uCtrlMontaFluxo;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uDbCompFluxo,
     uDbMontaFluxo, uCMClientDataSet, uCtrlPadroes
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlMontaFluxo = Class(TCmControlObject)

   private
      FDbMontaFluxo  : TDbMontaFluxo;
      FCdsMontaFluxo : TCMClientDataSet;
      FDbCompFluxo   : TDbCompFluxo;
      FCdsCompFluxo  : TCMClientDataSet;
      CtrlPadroes    : TCtrlPadroes;
   public
      property CdsMontaFluxo : TCMClientDataSet read FCdsMontaFluxo write FCdsMontaFluxo;
      property CdsCompFluxo  : TCMClientDataSet read FCdsCompFluxo  write FCdsCompFluxo;

      constructor Create; override;
      destructor Destroy; override;

      function IncluiAlteraFluxo(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
      function ExcluiFluxo(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
      function GravaOrdenacao(LinhasFluxo: OleVariant): Boolean;

      function ListCompFluxo(rIDPessoa, rCodLinhaFluxo: Double): OleVariant;
      function ListMontaFluxo(rIDPessoa,rCodLinhaFluxo: Double; bSoFaltantes: Boolean): OleVariant;
      function ListMapaFluxo(rIDPessoa: Double): OleVariant;
      function ListFaltantes: OleVariant;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;


implementation

{ TCtrlMontaFluxo }

constructor TCtrlMontaFluxo.Create;
begin
   inherited;
   FDbMontaFluxo:=TDbMontafluxo.Create(Self);
   FDbCompFluxo:=TDbCompFluxo.Create(Self);
   CtrlPadroes:=TCtrlPadroes.Create;
end;

destructor TCtrlMontaFluxo.Destroy;
begin
   FDbMontaFluxo.Free;
   FDbCompFluxo.Free;
   CtrlPadroes.Free;
   
   if IsAppServer then
    begin
       CdsMontaFluxo.Free;
       CdsCompFluxo.Free;
    end;

   inherited;
end;

procedure TCtrlMontaFluxo.OnCreateAppServer;
begin
   inherited;
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
   FDbMontaFluxo.DataBaseName:=DataBaseName;
   FDbCompFluxo.DataBaseName:=DataBaseName;
end;

function TCtrlMontaFluxo.IncluiAlteraFluxo(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.IncluiAlteraLinhaFluxo(FCdsMontaFluxo.Data,FCdsCompFluxo.Data);
       if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result := ApplyCds(FCdsMontaFluxo,FDbMontaFluxo,[],[]);

          if not(Result) then
           begin
              MessageInfo:=FDbMontaFluxo.MessageInfo;
              Rollback;
           end
          else
           begin
              //Grava LOG
              Result:=CtrlPadroes.GravaLogOperacoes(rIDPessoa,rIDModulo,rIDUsuario,
                                                   'Inclusão/Alteração da Montagem do Fluxo de Caixa',False);
              if not(Result) then
               begin
                  MessageInfo:=CtrlPadroes.MessageInfo;
                  Rollback;
               end
              else
               if (FDbMontaFluxo.Tipocalculo.AsString<>'T') then
                begin
                   Result:=ApplyCds(FCdsCompFluxo,FDbCompFluxo,[FDbMontaFluxo.Codlinhafluxo],
                                    [FDbCompFluxo.Codlinhafluxo]);

                   if not Result then
                    begin
                       MessageInfo:=FDbCompFluxo.MessageInfo;
                       Rollback;
                    end
                   else
                    Commit;
                end
               else
                Commit;
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

function TCtrlMontaFluxo.ExcluiFluxo(rIDPessoa,rIDModulo,rIDUsuario: Double): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiFluxo(FCdsMontaFluxo.Data,FCdsCompFluxo.Data);
       if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          FCdsCompFluxo.First;
          while not(FCdsCompFluxo.Eof) do FCdsCompFluxo.Delete;

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
                  //Grava LOG
                  Result:=CtrlPadroes.GravaLogOperacoes(rIDPessoa,rIDModulo,rIDUsuario,
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

function TCtrlMontaFluxo.GravaOrdenacao(LinhasFluxo: OleVariant): Boolean;
var
   cdsAux : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.GravaOrdenacao(LinhasFluxo);
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

function TCtrlMontaFluxo.ListMontaFluxo(rIDPessoa,rCodLinhaFluxo: Double; bSoFaltantes: Boolean): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   M.CODLINHAFLUXO, '+
         '   M.DESCRICAO, '+
         '   M.ORDEM, '+
         '   M.TIPOCALCULO, '+
         '   M.FLGACUMULA, '+
         '   M.IDPESSOA, '+
         '   M.POSICAOTOTAL, '+
         '   M.FLGIMPRIMELINHA '+
         'FROM '+
         '   MONTAFLUXO M '+
         'WHERE (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sFiltro:='';
   if bSoFaltantes then
      sFiltro:='   AND (M.CODLINHAFLUXO <> '+FloatToStr(rCodLinhaFluxo)+') AND '+
               '       (NOT Exists(SELECT CF.CODLINHAFLUXO '+
               '                   FROM COMPFLUXO CF '+
               '                   WHERE (CF.CODCOMPLINHA=M.CODLINHAFLUXO) AND '+
               '                         (CF.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+'))) '
   else
     if (rCodLinhaFluxo<>0) then
        sFiltro:='   AND (M.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+') ';

   sSql:=sSql+sFiltro+'ORDER BY M.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;


function TCtrlMontaFluxo.ListCompFluxo(rIDPessoa,
  rCodLinhaFluxo: Double): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   C.IDSEQUENCIA, '+
         '   C.CODLINHAFLUXO, '+
         '   C.CODTIPRECDES, '+
         '   C.RECPAG, '+
         '   C.IDPESSOA, '+
         '   C.CODCOMPLINHA, '+
         '   C.CODTIPDOC, '+
         '   DECODE(M.TIPOCALCULO,''R'',T.DESCRICAO, '+
         '                        ''P'',T.DESCRICAO, '+
         '                        ''C'',D.DESCRICAO, '+
         '                        ''D'',D.DESCRICAO, '+
         '                        ''L'',M1.DESCRICAO,null) AS DESCLINHA '+
         'FROM '+
         '   COMPFLUXO C, '+
         '   MONTAFLUXO M, '+
         '   MONTAFLUXO M1, '+
         '   TIPORECEBDESEMB T, '+
         '   TIPODOCRECPAG D ';
   sFiltro:='WHERE '+
         '   (C.IDPESSOA = M1.IDPESSOA(+)) AND '+
         '   (C.CODCOMPLINHA = M1.CODLINHAFLUXO(+)) AND '+
         '   (C.IDPESSOA = M.IDPESSOA(+)) AND '+
         '   (C.CODLINHAFLUXO = M.CODLINHAFLUXO(+)) AND '+
         '   (C.CODTIPRECDES = T.CODTIPRECDES(+)) AND '+
         '   (C.RECPAG = T.RECPAG(+)) AND '+
         '   (C.CODTIPDOC = D.CODTIPDOC(+)) AND '+
         '   (C.RECPAG = D.RECPAG(+)) ';
   if (rIDPessoa<>0) then
      sFiltro:=sFiltro+'   AND (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   if (rCodLinhaFluxo<>0) then
      sFiltro:=sFiltro+'   AND (C.CODLINHAFLUXO = '+FloatToStr(rCodLinhaFluxo)+') ';

   sSql:=sSql+sFiltro;
   Result:=GetDataPacket(sSql);
end;

function TCtrlMontaFluxo.ListMapaFluxo(rIDPessoa: Double): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT '+
         '   MF.DESCRICAO AS LINHAFLUXO, '+
         '   CF.IDSEQUENCIA AS GRUPO, '+
         '   TRD.CODTIPRECDES, '+
         '   DECODE(CF.CODCOMPLINHA,MF.CODLINHAFLUXO, TRD.DESCRICAO, LS.DESCRICAO) AS TIPORECDES, '+
         '   TRD.RECPAG, '+
         '   CF.CODTIPDOC, '+
         '   TDC.DESCRICAO AS TIPODOC, '+
         '   TDC.RECPAG AS RECPAGDOC, '+
         '   DECODE(RTrim(CF.CODTIPDOC),null,0,1) AS TIPOLINHA, '+
         '   MF.ORDEM '+
         'FROM '+
         '   MONTAFLUXO MF, '+
         '   COMPFLUXO CF, '+
         '   TIPORECEBDESEMB TRD, '+
         '   TIPODOCRECPAG TDC, '+
         '   (SELECT '+
         '       CODLINHAFLUXO, '+
         '       DESCRICAO '+
         '    FROM '+
         '       MONTAFLUXO '+
         '    WHERE '+
         '       (IDPESSOA= '+FloatToStr(rIDPessoa)+')) LS '+
         'WHERE '+
         '   (MF.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (MF.CODLINHAFLUXO=CF.CODLINHAFLUXO(+)) AND '+
         '   (MF.IDPESSOA=CF.IDPESSOA(+)) AND '+
         '   (RTrim(CF.CODTIPRECDES)=SUBSTR(TRD.CODTIPRECDES(+),1,Length(RTrim(CF.CODTIPRECDES)))) AND '+
         '   (CF.RECPAG=TRD.RECPAG(+)) AND '+
         '   (CF.CODTIPDOC=TDC.CODTIPDOC(+)) AND '+
         '   (CF.IDPESSOA=TRD.IDPESSOA(+)) AND '+
         '   (CF.CODCOMPLINHA=LS.CODLINHAFLUXO(+)) '+
         'ORDER BY MF.ORDEM,TRD.CODTIPRECDES,TIPORECDES ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlMontaFluxo.ListFaltantes: OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   ''123456789012345'' AS CODIGO, '+
                         '   ''12345678901234567890123456789012345'' AS DESCRICAO, '+
                         '   ''X'' AS RECPAG '+
                         'FROM DUAL '+
                         'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/ ');
end;

end.
