unit uCtrlCancelaNF;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbParcelaRealContr;
type
   TCtrlCancelaNF = Class(TCmControlObject)

   private
      FDbParcelaRealContr  : TDbParcelaRealContr;
      FCdsNotasFiscais     : TCMClientDataSet;
   public
      property CdsNotasFiscais: TCMClientDataSet read FCdsNotasFiscais
                                                write FCdsNotasFiscais;
      constructor Create; override;
      destructor Destroy; override;

      function ListNotasFiscais(rIDPessoa, rNumNotaFiscal: Double; dDataEmissao: TDateTime): OleVariant;
      function ListParcelasNF(rIDPessoa, rNumNotaFiscal: Double): OleVariant;
      function AplicaCancelamentoNF: Boolean;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlContratos }

constructor TCtrlCancelaNF.Create;
begin
   inherited;
   FDbParcelaRealContr:=TDbParcelaRealContr.Create(Self);
end;

procedure TCtrlCancelaNF.OnCreateAppServer;
begin
   inherited;
   FCdsNotasFiscais:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlCancelaNF.Destroy;
begin
   inherited;
   FDbParcelaRealContr.Free;
   if IsAppServer then FCdsNotasFiscais.Free;
end;

procedure TCtrlCancelaNF.AfterInitialize;
begin
   inherited;
end;

procedure TCtrlCancelaNF.DoChangeDataBase;
begin
   inherited;
   FDbParcelaRealContr.DataBaseName:=DataBaseName;
end;

function TCtrlCancelaNF.ListNotasFiscais(rIDPessoa, rNumNotaFiscal: Double;
                                         dDataEmissao: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.NOMECONTRATO, '+
         '   C.IDPESSOA, '+
         '   PS.RAZAOSOCIAL, '+
         '   P.*, '+
         '   ''N'' AS CANCELANOTA '+
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   (SELECT '+
         '       IDCONTRATO, '+
         '       DATAVENCPARCELA, '+
         '       NUMNOTAFISCAL '+
         '    FROM '+
         '       PARCELAREALCONTR  '+
         '    WHERE '+
         '       (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rNumNotaFiscal<>0) then
       sSql:=sSql+'       AND (NUMNOTAFISCAL = '+FloatToStr(rNumNotaFiscal)+') '
   else
       sSql:=sSql+'       AND (NUMNOTAFISCAL IS NOT NULL) ';

   if (dDataEmissao<>0) then
       sSql:=sSql+'       AND (DATAEMISSNF = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataEmissao)+
                                                     ''',''dd/mm/yyyy'')) ';

   sSql:=sSql+'    GROUP BY IDCONTRATO,DATAVENCPARCELA,NUMNOTAFISCAL) P, '+
              '    PESSOA PS '+
              'WHERE '+
              '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
              '   (C.IDCONTRATO = P.IDCONTRATO) AND '+
              '   (C.IDFORCLI = PS.IDPESSOA) '+
              'ORDER BY C.IDCONTRATO, P.DATAVENCPARCELA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlCancelaNF.ListParcelasNF(rIDPessoa, rNumNotaFiscal: Double): OleVariant;
var
   sSql: String;
begin
   sSql:='    SELECT * '+
         '    FROM '+
         '       PARCELAREALCONTR '+
         '    WHERE '+
         '       (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (NUMNOTAFISCAL = '+FloatToStr(rNumNotaFiscal)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlCancelaNF.AplicaCancelamentoNF: Boolean;
var
   cdsAux : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaCancelamentoNF(FCdsNotasFiscais.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       cdsAux:=TCMClientDataSet.Create(nil);
       try
          StartTransaction;
          try
             FCdsNotasFiscais.First;
             while not(FCdsNotasFiscais.Eof) do
             begin
                if (FCdsNotasFiscais.FieldByName('CANCELANOTA').AsString='N') then
                 begin
                    FCdsNotasFiscais.Next;
                    Continue;
                 end;

                //Busca Parcelas da NotaFiscal
                cdsAux.Close;
                cdsAux.Data:=ListParcelasNF(FCdsNotasFiscais.FieldByName('IDPESSOA').AsFloat,
                                            FCdsNotasFiscais.FieldByName('NUMNOTAFISCAL').AsFloat);

                //Limpa as Datas e os Números de NF
                cdsAux.First;
                while not(cdsAux.Eof) do
                begin
                   cdsAux.Edit;
                   cdsAux.FieldByName('NUMNOTAFISCAL').Clear;
                   cdsAux.FieldByName('DATAEMISSNF').Clear;
                   cdsAux.Post;
                   cdsAux.Next;
                end;

                Result:=ApplyCds(cdsAux,FDbParcelaRealContr,[],[]);
                if not(Result) then
                 begin
                    MessageInfo:=FDbParcelaRealContr.MessageInfo;
                    Rollback;
                    Exit;
                 end;

                FCdsNotasFiscais.Next;
             end;
             Commit;
          except
             on E:Exception do
             begin
                MessageInfo := E.Message;
                Rollback;
             end;
          end;
       finally
          cdsAux.Free;
       end;
    end;
end;

end.
