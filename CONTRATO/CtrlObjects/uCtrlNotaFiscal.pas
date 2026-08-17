unit uCtrlNotaFiscal;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbModNotaFiscal, uDbCompNotaFiscal;

const
   iMaxCampo = 28;
        
type
   TCtrlNotaFiscal = Class(TCmControlObject)
   private
      FDbModNotaFiscal  : TDbModNotaFiscal;
      FDbCompNotaFiscal : TDbCompNotaFiscal;
      FCdsModeloNF      : TCMClientDataSet;
      FCdsCompNF        : TCMClientDataSet;
   public
      property cdsModeloNF: TCMClientDataSet read FCdsModeloNF  write FCdsModeloNF;
      property cdsCompNF: TCMClientDataSet read FCdsCompNF  write FCdsCompNF;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function AplicaAtualModNF: Boolean;
      function ExcluiModNF: Boolean;

      function ListModeloNF(rIDPessoa, rIDModeloNF: Double): OleVariant;
      function ListCompNF(rIDModeloNF: Double): OleVariant;
      function ListContrImpNF(rIDPessoa: Double): OleVariant;
      function ListCompImpNF(rIDModeloNF: Double): OleVariant;
      function ListDadosImpNF(rIDPessoa, rIDContrato: Double; dDataVenc: TDateTime): OleVariant;

      procedure GeraLinhasCompNF;
      procedure GeraLinhasCompNFFaltantes(rIDModeloNF: Double);
      function RetornaDescricao(iLinha: Integer): String;
      function GravaNumNF(rIDPessoa, rIdContrato, rNumNF: Double;
                          dDataEmissao, dDataVenc: TDateTime): Boolean;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlNotaFiscal }

constructor TCtrlNotaFiscal.Create;
begin
   inherited;
   FDbModNotaFiscal:=TDbModNotaFiscal.Create(Self);
   FDbCompNotaFiscal:=TDbCompNotaFiscal.Create(Self);
end;

procedure TCtrlNotaFiscal.OnCreateAppServer;
begin
   inherited;
   FCdsModeloNF:=TCMClientDataSet.Create(nil);
   FcdsCompNF:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlNotaFiscal.Destroy;
begin
   inherited;
   FDbModNotaFiscal.Free;
   FDbCompNotaFiscal.Free;
   if IsAppServer then
    begin
       FCdsModeloNF.Free;
       FcdsCompNF.Free;
    end;
end;

procedure TCtrlNotaFiscal.AfterInitialize;
begin
   inherited;

end;

procedure TCtrlNotaFiscal.DoChangeDataBase;
begin
   inherited;
   FDbModNotaFiscal.DataBaseName:=DataBaseName;
   FDbCompNotaFiscal.DataBaseName:=DataBaseName;
end;

function TCtrlNotaFiscal.AplicaAtualModNF: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualModNF(FCdsModeloNF.Data, FCdsCompNF.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsModeloNF,FDbModNotaFiscal,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbModNotaFiscal.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=ApplyCds(FCdsCompNF,FDbCompNotaFiscal,[FDbModNotaFiscal.Idmodelonf],
                                                            [FDbCompNotaFiscal.Idmodelonf]);
              if not(Result) then
               begin
                  MessageInfo:=FDbCompNotaFiscal.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlNotaFiscal.ExcluiModNF: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiModNF(FCdsModeloNF.Data, FCdsCompNF.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          FcdsCompNF.First;
          while not(FCdsCompNF.IsEmpty) do cdsCompNF.Delete;

          Result:=ApplyCds(FCdsCompNF,FDbCompNotaFiscal,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbCompNotaFiscal.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=ApplyCds(FCdsModeloNF,FDbModNotaFiscal,[],[]);
              if not(Result) then
               begin
                  MessageInfo:=FDbModNotaFiscal.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

procedure TCtrlNotaFiscal.GeraLinhasCompNF;
var
   iX : Integer;
begin
   for iX := 1 to iMaxCampo do
   begin
      FCdsCompNF.Append;
      FCdsCompNF.FieldByName('IDCompNF').AsFloat:=iX;
      FCdsCompNF.FieldByName('DESCRICAO').AsString:=RetornaDescricao(iX);
      FCdsCompNF.FieldByName('Coluna').AsFloat:=0;
      FCdsCompNF.FieldByName('Linha').AsFloat:=0;
      FCdsCompNF.FieldByName('Tamanho').AsFloat:=0;
      FCdsCompNF.FieldByName('NumMaxLinhas').AsFloat:=1;
      FCdsCompNF.FieldByName('FlgAlinhamento').AsString:='D';
      FCdsCompNF.FieldByName('FlgImposto').AsString:='N';
      FCdsCompNF.FieldByName('FlgTotalizada').AsString:='N';
      FCdsCompNF.Post;
   end;
end;

procedure TCtrlNotaFiscal.GeraLinhasCompNFFaltantes(rIDModeloNF: Double);
var
   iX : Integer;
begin
   if (FCdsCompNF.RecordCount=iMaxCampo) then Exit;
   for iX := 1 to iMaxCampo do
   begin
      if not(FCdsCompNF.Locate('IDCompNF',iX,[])) then
       begin
          FCdsCompNF.Append;
          FCdsCompNF.FieldByName('IDCompNF').AsFloat:=iX;
          FCdsCompNF.FieldByName('DESCRICAO').AsString:=RetornaDescricao(iX);
          FCdsCompNF.FieldByName('Coluna').AsFloat:=0;
          FCdsCompNF.FieldByName('Linha').AsFloat:=0;
          FCdsCompNF.FieldByName('Tamanho').AsFloat:=0;
          FCdsCompNF.FieldByName('NumMaxLinhas').AsFloat:=1;
          FCdsCompNF.FieldByName('FlgAlinhamento').AsString:='D';
          FCdsCompNF.FieldByName('FlgImposto').AsString:='N';
          FCdsCompNF.FieldByName('FlgTotalizada').AsString:='N';
          FCdsCompNF.FieldByName('IDModeloNF').AsInteger :=Trunc(rIDModeloNF);
          FCdsCompNF.Post;
       end;
   end;
end;

function TCtrlNotaFiscal.RetornaDescricao(iLinha: Integer): String;
begin
   Result:='';
   //OBS: Sempre que acrescentar uma linha neste Case lembre-se de alterar o valor do MaxCampo lá
   //no começo do Fonte
   case iLinha of
      1: Result := 'Numero da Nota';
      2: Result := 'Natureza dos Serviços';
      3: Result := 'Data da Emissão';
      4: Result := 'Valor Total da Nota';
      5: Result := 'Número de Ordem';
      6: Result := 'Data de Vencimento';
      7: Result := 'Desconto';
      8: Result := 'Condição Especial';
      9: Result := 'Nome do Cliente';
     10: Result := 'Endereço';
     11: Result := 'Bairro/Distrito';
     12: Result := 'Município';
     13: Result := 'U.F.';
     14: Result := 'C.E.P.';
     15: Result := 'Praça de Pagamento';
     16: Result := 'CNPJ';
     17: Result := 'Inscrição Est./Mun.';
     18: Result := 'Valor por Extenso';
     19: Result := 'Descrição do Produto';
     20: Result := 'Unidade de Medida';
     21: Result := 'Quantidade';
     22: Result := 'Valor Unitário';
     23: Result := 'Valor Total';
     24: Result := 'Valor Total da Nota';
     25: Result := 'IRRF';
     26: Result := 'Valor Líquido';
     27: Result := 'Texto Descritivo do Imposto';
     28: Result := 'Prestação de Serviços';
   end;
end;

function TCtrlNotaFiscal.ListModeloNF(rIDPessoa,
  rIDModeloNF: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * '+
         'FROM '+
         '   ModNotaFiscal '+
         'WHERE '+
         '   (IDPessoa = '+FloatToStr(rIDPessoa)+') ';

   if (rIDModeloNF<>0) then
      sSql:=sSql+'   AND (IDModeloNF = '+FloatToStr(rIDModeloNF)+')  ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlNotaFiscal.ListCompNF(rIDModeloNF: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   IDMODELONF, '+
         '   IDCOMPNF, '+
         '   COLUNA, '+
         '   LINHA, '+
         '   TAMANHO, '+
         '   FLGALINHAMENTO, '+
         '   FLGIMPOSTO, '+
         '   FLGTOTALIZADA, '+
         '   NUMMAXLINHAS, '+
         '   VALORDEFAULT, '+
         '   DESCRICAO '+
         'FROM '+
         '   COMPNOTAFISCAL '+
         'WHERE '+
         '   (IDModeloNF = '+FloatToStr(rIDModeloNF)+') '+
         'ORDER BY IDCOMPNF ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlNotaFiscal.ListContrImpNF(rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.IDCONTRATO, '+
         '   C.IDFORCLI, '+
         '   C.NOMECONTRATO, '+
         '   PS.RAZAOSOCIAL, '+
         '   (RTRIM(E.LOGRADOURO)||'' - ''||E.NUMERO||DECODE(RTRIM(E.COMPLEMENTO),'''','''',''/'''+
                                '||E.COMPLEMENTO)) AS LOGRADOURO, '+
         '   E.BAIRRO, '+
         '   CD.NOME AS CIDADE, '+
         '   ES.CODESTADO AS ESTADO, '+
         '   E.CEP, '+
         '   PS.NUMDOCUMENTO AS CNPJ, '+
         '   P.DATAVENCPARCELA, '+
         '   D.NODOCUMENTO, '+
         '   ''N'' AS IMPRIMENOTA '+
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   ENDPESS E, '+
         '   CIDADES CD, '+
         '   ESTADO ES, '+
         '   PESSOA PS, '+
         '   (SELECT '+
         '       IDCONTRATO, '+
         '       DATAVENCPARCELA, '+
         '       CODDOCUMENTO '+
         '    FROM '+
         '       PARCELAREALCONTR '+
         '    WHERE '+
         '       (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (NUMNOTAFISCAL IS NULL) '+
         '    GROUP BY IDCONTRATO,DATAVENCPARCELA,CODDOCUMENTO) P, '+
         '    DOCUMENTO D '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (C.IDENDCOBRANCA = E.IDENDERECO(+)) AND '+
         '   (C.IDFORCLI = E.IDPESSOA(+)) AND '+
         '   (C.IDCONTRATO = P.IDCONTRATO) AND '+
         '   (P.CODDOCUMENTO = D.CODDOCUMENTO) AND '+
         '   (PS.IDPESSOA = C.IDFORCLI) AND '+
         '   (E.IDCIDADES = CD.IDCIDADES(+)) AND '+
         '   (CD.IDESTADO = ES.IDESTADO(+)) '+
         'ORDER BY C.IDCONTRATO, P.DATAVENCPARCELA';
   Result:=GetDataPacket(sSql);
end;

function TCtrlNotaFiscal.ListCompImpNF(rIDModeloNF: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT  * '+
         'FROM '+
         '   COMPNOTAFISCAL '+
         'WHERE '+
         '    (IDMODELONF = '+FloatToStr(rIDModeloNF)+') AND '+
         '    (COLUNA>0) AND '+
         '    (LINHA>0) AND '+
         '    (TAMANHO>0) '+
         'ORDER BY LINHA, COLUNA ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlNotaFiscal.ListDadosImpNF(rIDPessoa,
  rIDContrato: Double; dDataVenc: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   P.IDITEM, '+
         '   I.NOME_ITEM, '+
         '   P.IDOBJETO, '+
         '   O.NOMEOBJETO, '+
         '   P.CODDOCUMENTO, '+
         '   P.QTDEPARCELA, '+
         '   P.VALOROBJPARCELA, '+
         '   P.VLRMOEDACORRENTE, '+
         '   P.NUMNOTAFISCAL, '+
         '   P.DATAEMISSNF, '+
         '   P.OBSERVACAO, '+
         '   P.IDPARCELA '+
         'FROM '+
         '   PARCELAREALCONTR P, '+
         '   ITEMCONTRATUAL I, '+
         '   OBJETOCONTRATUAL O '+
         'WHERE '+
         '   (P.IDITEM = I.IDITEM) AND '+
         '   (P.IDOBJETO = O.IDOBJETO) AND '+
         '   (P.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (O.IDPESSOA = P.IDPESSOA) AND '+
         '   (I.IDPESSOA = P.IDPESSOA) AND '+
         '   (P.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '   (P.DATAVENCPARCELA = TO_DATE('''+
         FormatDateTime('dd/mm/yyyy',dDataVenc)+''',''dd/mm/yyyy''))';
   Result:=GetDataPacket(sSql);
end;

function TCtrlNotaFiscal.GravaNumNF(rIDPessoa, rIdContrato, rNumNF: Double;
                                    dDataEmissao, dDataVenc: TDateTime): Boolean;
begin
   MessageInfo:='';
   Result:=ExecSQL('UPDATE PARCELAREALCONTR '+
                   'SET NUMNOTAFISCAL = '+FloatToStr(rNumNF)+','+
                   '    DATAEMISSNF = TO_DATE('''+
                   FormatDateTime('dd/mm/yyyy',dDataVenc)+''',''dd/mm/yyyy'') ' +
                   'WHERE '+
                   '   (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                   '   (IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                   '   (DATAVENCPARCELA = TO_DATE('''+
                   FormatDateTime('dd/mm/yyyy',dDataVenc)+''',''dd/mm/yyyy''))');
end;

end.
