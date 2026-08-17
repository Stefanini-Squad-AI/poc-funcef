{ --------------------------------------------------------------------------------------------------
Rotina    : Regulariza
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Colocada a rotina para gravar o CODLANCNAOIDENT na tabela RECBTOPAGTO para quando for
            feita a exclusão da baixa, retornar o registro para nao identificado
---------------------------------------------------------------------------------------------------}
unit uCtrlRegNIDuplicados;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet,uCtrlFinanc
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlRegNIDuplicados = Class(TCmControlObject)
   private
      FCdsNaoIdent : TCMClientDataSet;
      FCdsNaoConc  : TCMClientDataSet;

      FCdsIdent    : TCMClientDataSet;
      FCdsConc     : TCMClientDataSet;

      CtrlFinanc   : TCtrlFinanc;

      F_rIDPessoa         : Double;
      F_rIDModulo         : Double;
      F_rIDUsuario        : Double;
      F_bUsaPlanoPatro    : Boolean;

   public
      property CdsNaoIdent : TCMClientDataSet read FCdsNaoIdent write FCdsNaoIdent;
      property CdsNaoConc  : TCMClientDataSet read FCdsNaoConc  write FCdsNaoConc;

      property CdsIdent    : TCMClientDataSet read FCdsIdent write FCdsIdent;
      property CdsConc     : TCMClientDataSet read FCdsConc  write FCdsConc;

      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function ListNaoIdentNaoConc(rCodPortador,rIDPessoa: Double; sStatus: String;
                                   rValorInicial, rValorFinal: Double): OleVariant;

      function Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double;
                          bIntegraContabil: Boolean): Boolean;

      function DesfazRegularizacao(dDataRegularizacao: TDateTime; rIDPlano: Double;
                                  bIntegraContabil: Boolean): Boolean;

      function GravaRecbToPagto(const CodLancAnt, CodLancNovo : Double) : Boolean;

      function ListIdentConc(rCodPortador,rIDPessoa: Double; sStatus: String;
                             rValorInicial, rValorFinal: Double; dDataConcilia : TDateTime): OleVariant;


   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlRegNIDuplicados }

constructor TCtrlRegNIDuplicados.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   
   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
end;

destructor TCtrlRegNIDuplicados.Destroy;
begin
   CtrlFinanc.Free;
   if IsAppServer then
    begin
       FCdsNaoIdent.Free;
       FCdsNaoConc.Free;

       FCdsIdent.Free;
       FCdsConc.Free;
    end;
   inherited;
end;

procedure TCtrlRegNIDuplicados.DoChangeDataBase;
begin
  inherited;
  CtrlFinanc.Initialize(DataBase,True);
end;

procedure TCtrlRegNIDuplicados.OnCreateAppServer;
begin
   inherited;
   FCdsNaoIdent:=TCMClientDataSet.Create(nil);
   FCdsNaoConc:=TCMClientDataSet.Create(nil);

   FCdsIdent:=TCMClientDataSet.Create(nil);
   FCdsConc:=TCMClientDataSet.Create(nil);
end;

function TCtrlRegNIDuplicados.ListNaoIdentNaoConc(rCodPortador, rIDPessoa: Double;
  sStatus: String; rValorInicial, rValorFinal: Double): OleVariant;
var
   sSql : String;
begin
  sSql:='SELECT * FROM MOVIMFINANC '+
        'WHERE (CODPORTADOR = '+FloatToStr(rCodPortador)+') AND '+
        '      (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
        '      (STATUSCONCILIA = '''+sStatus+''') AND '+
        '      ((FLGESTORNADO <> ''S'') OR (FLGESTORNADO IS NULL)) ';

  if (rValorInicial>0) then
     sSql:=sSql+'     AND (VALORLANCFINAN >= '+FloatToStr(rValorInicial)+ ') ';

  if (rValorFinal>0) then
     sSql:=sSql+'     AND (VALORLANCFINAN <= '+FloatToStr(rValorFinal)+ ') ';

  sSql:=sSql+' ORDER BY DATALANCFINAN, NUMCHQBORDERO';

  Result:=GetDataPacket(sSql);
end;

function TCtrlRegNIDuplicados.Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double;
                                         bIntegraContabil: Boolean): Boolean;
var
   cdsAux            : TCMClientDataSet;
   rCodLancFinancAux : Double;
   rCodLancAnt       : Double;
   rCodLancNovo      : Double;
   sSQL              : String;
begin
   MessageInfo:='';
   rCodLancFinancAux:=0;
   
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.Regulariza(dDataRegularizacao,
                                               rIDPlano,
                                               bIntegraContabil,
                                               F_rIDPessoa,
                                               F_rIDModulo,
                                               F_rIDUsuario,
                                               F_bUsaPlanoPatro,
                                               FcdsNaoIdent.Data,
                                               FcdsNaoConc.Data);
                                               
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          cdsAux:=TCMClientDataSet.Create(nil);
          try
             cdsAux.Data:=GetDataPacket(CtrlFinanc.sSqlRelacionados);
             StartTransaction;

             FCdsNaoIdent.First;
             while not(FCdsNaoIdent.Eof) do
             begin
                if (FCdsNaoIdent.FieldByName('STATUSCONCILIA').AsString='J') then
                 begin
                    cdsAux.Append;
                    cdsAux.FieldByName('CODLANCFINANC').AsFloat:=
                                FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;
                    cdsAux.FieldByName('DATADISP').AsDateTime:=
                                FCdsNaoIdent.FieldByName('DATADISPFINANC').AsDateTime;
                    cdsAux.FieldByName('FLGNI').AsString:='I';
                    cdsAux.FieldByName('FLGMARCADO').AsString:='N';                    
                    cdsAux.Post;

                    {Result:=CtrlFinanc.MudaStatusConcilia('J',
                                       FCdsNaoIdent.FieldByName('DATACONCILIACAO').AsDateTime,
                                       FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat);}

                    Result:=CtrlFinanc.MudaStatusConcilia('J',
                                       dDataRegularizacao,
                                       FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat);

                    if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end;

                    rCodLancFinancAux:=FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;
                    rCodLancAnt       := FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;

                    Result:=CtrlFinanc.EstornoFinanceiro(dDataRegularizacao,
                                              FCdsNaoIdent.FieldByName('DATADISPFINANC').AsDateTime,
                                              False,rCodLancFinancAux,
                                              F_rIDPessoa,
                                              F_rIDModulo,
                                              F_rIDUsuario,
                                              rIDPlano,
                                              bIntegraContabil);

                    if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end;

                 end;
                FCdsNaoIdent.Next;
             end;

             FCdsNaoConc.First;
             while not(FCdsNaoConc.Eof) do
             begin
                if (FCdsNaoConc.FieldByName('STATUSCONCILIA').AsString='X') then
                 begin
                    cdsAux.Append;
                    cdsAux.FieldByName('CODLANCFINANC').AsFloat:=
                                FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat;
                    cdsAux.FieldByName('DATADISP').AsDateTime:=
                                FCdsNaoConc.FieldByName('DATADISPFINANC').AsDateTime;
                    cdsAux.FieldByName('FLGNI').AsString:='N';
                    cdsAux.FieldByName('FLGMARCADO').AsString:='N';
                    cdsAux.Post;

                    {Result:=CtrlFinanc.MudaStatusConcilia('X',
                                       FCdsNaoConc.FieldByName('DATACONCILIACAO').AsDateTime,
                                       FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat);}

                    Result:=CtrlFinanc.MudaStatusConcilia('X',dDataRegularizacao,
                                       FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat);

                    rCodLancNovo      := FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat;


                    if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end;
                 end;
                FCdsNaoConc.Next;
             end;

             // Marchetti - Pendencia 14404
             GravaRecbToPagto(rCodLancAnt, rCodLancNovo);
             
             //Grava Relacionados
             Result:=CtrlFinanc.GravaRelacionados(cdsAux.Data);
             if not(Result) then
              begin
                 MessageInfo:=CtrlFinanc.MessageInfo;
                 Rollback;
                 Exit;
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

function TCtrlRegNIDuplicados.GravaRecbToPagto(const CodLancAnt, CodLancNovo: Double): Boolean;
var sSQL : String;
begin
   // Marchetti - Pendencia 14404
   Result := True;
   if CodLancAnt <> -1 then
   begin
      sSQL :=
      'UPDATE RECBTOPAGTO SET CODLANCNAOIDENT = ' + FloatToStr(CodLancAnt) + #13 +
      'WHERE CODLANCFINANC = ' + FloatToStr(CodLancNovo);
   end
   else
   begin
      sSQL :=
      'UPDATE RECBTOPAGTO SET CODLANCNAOIDENT = NULL ' + #13 +
      'WHERE CODLANCFINANC = ' + FloatToStr(CodLancNovo);
   end;

   try
      ExecSql(sSQL);
   except
      Result := False;
   end;
end;

function TCtrlRegNIDuplicados.DesfazRegularizacao(dDataRegularizacao: TDateTime; rIDPlano: Double; bIntegraContabil: Boolean): Boolean;
var
   cdsAux            : TCMClientDataSet;
   rCodLancFinancAux : Double;
   rCodLancAnt       : Double;
   rCodLancNovo      : Double;
   sSQL              : String;
begin
   MessageInfo:='';
   rCodLancFinancAux:=0;

   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.DesfazRegularizacao(dDataRegularizacao,
                                                        rIDPlano,
                                                        bIntegraContabil,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario,
                                                        F_bUsaPlanoPatro,
                                                        FcdsIdent.Data,
                                                        FcdsConc.Data);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          try
             cdsAux := TCMClientDataSet.Create(nil);
             StartTransaction;

             FCdsConc.First;
             while not(FCdsConc.Eof) do
             begin
                if (FCdsConc.FieldByName('STATUSCONCILIA').AsString='I') then
                 begin
                    ExecSql('UPDATE MOVIMFINANC SET STATUSCONCILIA = ''N'' WHERE CODLANCFINANC = ' + FCdsConc.FieldByName('CODLANCFINANC').AsString);
                 end;
                FCdsConc.Next;
             end;

             FCdsIdent.First;
             while not(FCdsIdent.Eof) do
             begin
                if (FCdsIdent.FieldByName('STATUSCONCILIA').AsString='I') then
                 begin

                    cdsAux.Data := GetDataPacket(
                                                 'SELECT CODLANCFINANC FROM MOVIMFINANC WHERE FLGESTORNADO = ''S'' AND NUMCHQBORDERO = ' + QuotedStr(FCdsIdent.FieldByName('NUMCHQBORDERO').AsString)
                                                );

                    if not cdsAux.IsEmpty then
                       CtrlFinanc.ExcluiFinanceiro(cdsAux.FieldByName('CODLANCFINANC').AsFloat);

                    Result:=CtrlFinanc.MudaStatusConcilia('I',
                                       dDataRegularizacao,
                                       FCdsIdent.FieldByName('CODLANCFINANC').AsFloat);

                    if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end;

                 end;
                FCdsIdent.Next;
             end;


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



function TCtrlRegNIDuplicados.ListIdentConc(rCodPortador, rIDPessoa: Double; sStatus: String; rValorInicial, rValorFinal: Double; dDataConcilia: TDateTime): OleVariant;
var
   sSql : String;
begin
  sSql:='SELECT * FROM MOVIMFINANC '+
        'WHERE (CODPORTADOR = '+FloatToStr(rCodPortador)+') AND '+
        '      (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
        '      (STATUSCONCILIA = '''+sStatus+''') AND '+
        '      ((FLGESTORNADO <> ''S'') OR (FLGESTORNADO IS NULL)) AND '+
        '      DATACONCILIACAO = TO_DATE('+ QuotedStr(DateToStr(dDataConcilia)) + ',''dd/mm/yyyy'') ';

  if (rValorInicial>0) then
     sSql:=sSql+'     AND (VALORLANCFINAN >= '+FloatToStr(rValorInicial)+ ') ';

  if (rValorFinal>0) then
     sSql:=sSql+'     AND (VALORLANCFINAN <= '+FloatToStr(rValorFinal)+ ') ';

  sSql:=sSql+' ORDER BY DATALANCFINAN, NUMCHQBORDERO';

  Result:=GetDataPacket(sSql);
end;

end.
