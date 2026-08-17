unit uCtrlAcertoImposto;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
     uCtrlParamIntegra, Wwquery, Classes, uCtrlImpostoRetido
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};
type
   TCtrlAcertoImposto = Class(TCmControlObject)

   private
      FMaxProgresso    : Longint;
      CtrlImpostoRetido: TCtrlImpostoRetido;
   public
      property MaxProgresso: Longint read FMaxProgresso;

      constructor Create; override;
      destructor Destroy; override;

      function AcertaImposto(rIDPessoa: Double): Boolean;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;      
   end;

implementation

{ TCtrlAcertoImposto }

constructor TCtrlAcertoImposto.Create;
begin
   inherited;
   CtrlImpostoRetido:=TCtrlImpostoRetido.Create;
end;

destructor TCtrlAcertoImposto.Destroy;
begin
   CtrlImpostoRetido.Free;
   inherited;
end;

procedure TCtrlAcertoImposto.OnCreateAppServer;
begin
   inherited;
end;

procedure TCtrlAcertoImposto.DoChangeDataBase;
begin
   inherited;
end;

procedure TCtrlAcertoImposto.AfterInitialize;
begin
   inherited;
   CtrlImpostoRetido.InitializeAs(Self);
   CtrlImpostoRetido.OpenTransaction:=False;
end;

function TCtrlAcertoImposto.AcertaImposto(rIDPessoa: Double): Boolean;
var
   cdsDocumento: TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AcertaImposto(rIDPessoa);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       cdsDocumento:=TCMClientDataSet.Create(nil);
       try
          try
             cdsDocumento.Data:=GetDataPacket('SELECT '+
                                              '   D.CODDOCUMENTO, '+
                                              '   D.CODTIPDOC, '+
                                              '   D.RECPAG, '+                                              
                                              '   DECODE(L.VLRLIQUIDO,NULL,0,L.VLRLIQUIDO) AS VLRLIQUIDO, '+
                                              '   L.VALOR, '+
                                              '   D.DATAPROGRAMADA, '+
                                              '   D.IDFORCLI, '+
                                              '   L.DATALANCTO, '+
                                              '   D.DATAEMISSAO, '+
                                              '   L.DEBCRE, '+
                                              '   L.NUMLANCTO, '+
                                              '   D.OPERACAO '+
                                              'FROM '+
                                              '   DOCUMENTO D, '+
                                              '   TIPODOCRECPAG T, '+
                                              '   LANCTODOCUM L '+
                                              'WHERE '+
                                              '   ((D.OPERACAO = ''1 '') OR (D.OPERACAO = ''2 '')) AND '+
                                              '   (D.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                                              '   (D.RECPAG = ''P'') AND '+
                                              '   ((D.STATUS <> ''2'') OR (D.STATUS IS NULL)) AND '+
                                              '   (D.CODTIPDOC = T.CODTIPDOC) AND '+
                                              '   (L.CODDOCUMENTO = D.CODDOCUMENTO) AND '+
                                              '   (L.OPERACAO = D.OPERACAO) AND '+
                                              '   (L.ESTORNO IS NULL) AND '+
                                              '   ((T.FLGDOCFISCAL IS NULL) OR (T.FLGDOCFISCAL = ''S'')) AND '+
                                              '   (NOT EXISTS (SELECT '+
                                              '                   M.CODDOCUMENTO '+
                                              '                FROM '+
                                              '                   LANCTODOCUM M '+
                                              '                WHERE '+
                                              '                   (M.CODALTERADOR IS NOT NULL) AND '+
                                              '                   (M.CODDOCUMENTO = D.CODDOCUMENTO))) ');

              FMaxProgresso:=cdsDocumento.RecordCount;
              ParamIntegra.GetParams(Trunc(rIDPessoa),0,'INTEGRACONTAB','PARAMCAP',tiCAP);

              StartTransaction;
              cdsDocumento.First;
              while not(cdsDocumento.Eof) do
              begin
                 CtrlImpostoRetido.DataProgramada:=
                                   cdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
                 CtrlImpostoRetido.OperacaoDocumento:=
                                   cdsDocumento.FieldByName('OPERACAO').AsString;
                 CtrlImpostoRetido.IdForCli:=
                                   cdsDocumento.FieldByName('IDFORCLI').AsInteger;
                 CtrlImpostoRetido.CodDocumento:=
                                   cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
                 CtrlImpostoRetido.NumLancto:=
                                   cdsDocumento.FieldByName('NUMLANCTO').AsInteger;
                 CtrlImpostoRetido.ValorLancto:=
                                   cdsDocumento.FieldByName('VALOR').AsFloat;
                 CtrlImpostoRetido.ValorLiquido:=
                                   cdsDocumento.FieldByName('VLRLIQUIDO').AsFloat;
                 CtrlImpostoRetido.DataLancto:=
                                   cdsDocumento.FieldByName('DATALANCTO').AsDateTime;
                 CtrlImpostoRetido.DataEmissao:=
                                   cdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
                 CtrlImpostoRetido.DebCre:=
                                   cdsDocumento.FieldByName('DEBCRE').AsString;

                 CtrlImpostoRetido.RecPag:=
                                   cdsDocumento.FieldByName('RECPAG').AsString[1];
                 CtrlImpostoRetido.IdEmpresa:=Trunc(rIDPessoa);


                 CtrlImpostoRetido.MomentoLancamento:=mlLancamento;
                 //CtrlImpostoRetido.CodTipDoc:=
                 //                  cdsDocumento.FieldByName('CODTIPDOC').AsFloat;
                 CtrlImpostoRetido.Incluir;
                 cdsDocumento.Next;
                 MessageInfo:='*';
              end;
              Commit;
              Result:=True;

              ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);              
          finally
              cdsDocumento.Free;
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

end.
