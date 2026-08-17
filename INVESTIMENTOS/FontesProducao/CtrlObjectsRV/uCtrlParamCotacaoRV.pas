//SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
//******************************************************************************
// Rotina     : ListParamCotacaoRV2
// SOL        : 122382
// Kintana    : 605342
// Data       : 21/08/2009
// Responsável: Thiago Passos
// Descrição  : Criação da Rotina ListParamCotacaoRV2
//******************************************************************************
// Rotina     : 
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************

unit uCtrlParamCotacaoRV; 

interface
                                            
uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uDbParamCotacaoRV ,Wwquery
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlParamCotacaoRV = Class(TCmControlObject)
   private
    FCdsParamCotacaoRV: TClientDataSet;
    FDbParamCotacaoRV: TDbParamCotacaoRV;
    procedure SetCdsParamCotacaoRV(const Value: TClientDataSet);
    procedure SetDbParamCotacaoRV(const Value: TDbParamCotacaoRV);

   public

      property CdsParamCotacaoRV : TClientDataSet read FCdsParamCotacaoRV write SetCdsParamCotacaoRV;
      property DbParamCotacaoRV : TDbParamCotacaoRV read FDbParamCotacaoRV write SetDbParamCotacaoRV;


      constructor Create; override;

      destructor  Destroy; override;

      procedure   OnCreateAppServer; override;


      function AplicaAtualParamCotacaoRV: boolean;

      function ListParamCotacaoRV(iParamCotacaoRV : Integer = -1;
                                  dDataVigencia   : TDateTime = 0): OleVariant;

      function ListParamCotacaoRV2(out sTipo : String;iParamCotacaoRV : Integer = -1;
                                  dDataVigencia   : TDateTime = 0  ): String;

      function RetornaCotacaoVigente(dDataVigencia: TDateTime; out sTipo : String ): String;


   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{ TCtrlParamCotacaoRV }

function TCtrlParamCotacaoRV.AplicaAtualParamCotacaoRV: boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualParamCotacaoRV(FCdsParamCotacaoRV.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsParamCotacaoRV ,DbParamCotacaoRV,[],[]);

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbParamCotacaoRV.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

constructor TCtrlParamCotacaoRV.Create;
begin
  inherited;
    FDbParamCotacaoRV  := TDbParamCotacaoRV.Create(Self);
end;

destructor TCtrlParamCotacaoRV.Destroy;
begin
  inherited;
   FreeAndNil(FDbParamCotacaoRV);
   if IsAppServer then FreeAndNil(FCdsParamCotacaoRV);
end;

procedure TCtrlParamCotacaoRV.DoChangeDataBase;
begin
  inherited;
   FDbParamCotacaoRV.DataBaseName := DataBaseName;
end;

function TCtrlParamCotacaoRV.ListParamCotacaoRV(iParamCotacaoRV: Integer;
                                                dDataVigencia: TDateTime): OleVariant;
var sSql : String;
    bPrimeiro : Boolean;
   // QryAux :TwwQuery;
//    DsAux:TDataSource;
begin
   sSql := '';
   sSql := sSql + 'SELECT PARAMCOTACAORV.IDPARAMCOTACAORV, ';
   sSql := sSql + '       PARAMCOTACAORV.DATAVIGENCIA, ';
   sSql := sSql + '       PARAMCOTACAORV.TIPOCOTACAO, ';
   sSql := sSql + '       case PARAMCOTACAORV.TIPOCOTACAO ';
   sSql := sSql + '        when ''A'' then ''Abertura''';
   sSql := sSql + '        when ''F'' then ''Fechamento''';
   sSql := sSql + '        when ''M'' then ''Média''';
   sSql := sSql + '        when ''N'' then ''Mínimo''';
   sSql := sSql + '        when ''X'' then ''Máximo''';
   sSql := sSql + '        else ';
   sSql := sSql + '             ''Campo em branco ou valor incorreto''';
   sSql := sSql + '        end as DESCRICAO ';
   sSql := sSql + 'FROM PARAMCOTACAORV ';
   bPrimeiro := (iParamCotacaoRV > 0);
   if iParamCotacaoRV >= 0 then
      sSql := sSql + 'WHERE PARAMCOTACAORV.IDPARAMCOTACAORV = ' + IntToStr(iParamCotacaoRV);

   if dDataVigencia > 0 then
   begin
      if bPrimeiro then
         sSql := sSql + 'AND '
      else
         sSql := sSql + 'WHERE ';

      sSql := sSql + ' PARAMCOTACAORV.DATAVIGENCIA = (SELECT MAX(P.DATAVIGENCIA) AS DATAVIGENCIA ';
      sSql := sSql + ' FROM PARAMCOTACAORV P ';
      sSql := sSql + ' WHERE ';
      sSql := sSql + '      P.DATAVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(dDataVigencia))+','+QuotedStr('DD/MM/YYYY')+'))';
   end;

   sSql := sSql + 'ORDER BY PARAMCOTACAORV.DATAVIGENCIA DESC';

   Result := GetDataPacket(sSql);

end;

function TCtrlParamCotacaoRV.ListParamCotacaoRV2( out sTipo : String;iParamCotacaoRV: Integer;
  dDataVigencia: TDateTime): String;
var sSql : String;
    bPrimeiro : Boolean;
    QryAux :TwwQuery;

begin
   Try
     sSql := '';
     sSql := sSql + 'SELECT PARAMCOTACAORV.IDPARAMCOTACAORV, ';
     sSql := sSql + '       PARAMCOTACAORV.DATAVIGENCIA, ';
     sSql := sSql + '       PARAMCOTACAORV.TIPOCOTACAO, ';
     sSql := sSql + '       case PARAMCOTACAORV.TIPOCOTACAO ';
     sSql := sSql + '        when ''A'' then ''Abertura''';
     sSql := sSql + '        when ''F'' then ''Fechamento''';
     sSql := sSql + '        when ''M'' then ''Média''';
     sSql := sSql + '        when ''N'' then ''Mínimo''';
     sSql := sSql + '        when ''X'' then ''Máximo''';
     sSql := sSql + '        else ';
     sSql := sSql + '             ''Campo em branco ou valor incorreto''';
     sSql := sSql + '        end as DESCRICAO ';
     sSql := sSql + 'FROM PARAMCOTACAORV ';
     bPrimeiro := (iParamCotacaoRV > 0);
     if iParamCotacaoRV >= 0 then
        sSql := sSql + 'WHERE PARAMCOTACAORV.IDPARAMCOTACAORV = ' + IntToStr(iParamCotacaoRV);

     if dDataVigencia > 0 then
     begin
        if bPrimeiro then
           sSql := sSql + 'AND '
        else
           sSql := sSql + 'WHERE ';

        sSql := sSql + ' PARAMCOTACAORV.DATAVIGENCIA = (SELECT MAX(P.DATAVIGENCIA) AS DATAVIGENCIA ';
        sSql := sSql + ' FROM PARAMCOTACAORV P ';
        sSql := sSql + ' WHERE ';
        sSql := sSql + '      P.DATAVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(dDataVigencia))+','+QuotedStr('DD/MM/YYYY')+'))';
     end;

     sSql := sSql + 'ORDER BY PARAMCOTACAORV.DATAVIGENCIA DESC';

     QryAux :=TwwQuery.Create(Nil);
     QryAux.DatabaseName:= 'BaseDados';
     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Add(sSQL);
     QryAux.Open;

     sTipo := QryAux.FieldByname('TipoCotacao').AsString;

       if QryAux.RecordCount > 0 then
        begin
               if QryAux.FieldByName('TIPOCOTACAO').AsString = 'A' then
                   Result := 'VLRABERTURA'
                else if QryAux.FieldByName('TIPOCOTACAO').AsString = 'F' then
                   Result := 'VLRFECHAMENTO'
                else if QryAux.FieldByName('TIPOCOTACAO').AsString = 'M' then
                   Result := 'VLRMEDIA'
                else if QryAux.FieldByName('TIPOCOTACAO').AsString = 'N' then
                   Result := 'VLRMINIMA'
                else if QryAux.FieldByName('TIPOCOTACAO').AsString = 'X' then
                   Result := 'VLRMAXIMA'
                else
                   Result := 'VLRMEDIA';
         end else
                   Result := 'VLRMEDIA';
   Finally
     QryAux.Close;
     FreeAndNil(QryAux);
   end;
end;


procedure TCtrlParamCotacaoRV.OnCreateAppServer;
begin
  inherited;
   FCdsParamCotacaoRV   := TClientDataSet.Create(nil);
end;

function TCtrlParamCotacaoRV.RetornaCotacaoVigente(dDataVigencia: TDateTime; out sTipo : String): String;

begin
   Result := ListParamCotacaoRV2(sTipo,-1, dDataVigencia);
end;

procedure TCtrlParamCotacaoRV.SetCdsParamCotacaoRV(const Value: TClientDataSet);
begin
  FCdsParamCotacaoRV := Value;
end;

procedure TCtrlParamCotacaoRV.SetDbParamCotacaoRV(const Value: TDbParamCotacaoRV);
begin
  FDbParamCotacaoRV := Value;
end;

end.
