//******************************************************************************************
//N. Sol..........: 158685
//N. Kintana......: 1970463
//Data............: 06/05/2013
//Responsável.....: Monica sa Silva Gonzaga
//Monica sa Silva Gonzaga SOL158685 KTN1970463
//******************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 06/07/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusao de novos campos em ListNaoIdentNaoConc para
//                  atender a NOVA Conciliação Bancária
//******************************************************************************************

unit uCtrlRegNIDuplicados;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet,uCtrlFinanc, uString, uCtrlMensagens, uCMTypes;

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

      function DesfazRegularizacao(iIdModulo,iIdPessoa: integer): Boolean;

      function GravaRecbToPagto(const CodLancAnt, CodLancNovo : Double; dDataRegularizacao: TDateTime ) : Boolean; //Monica sa Silva Gonzaga SOL158685 KTN1970463

      function ListaLancIdentificados(rCodPortador,rIdPessoa,rValorInicial,rValorFinal: double; dDataConciliacao :TDateTime): OleVariant;
      function ListaLancConciliados(sIdRelacionani,sCodLancFinanc: string): OleVariant;

      procedure GerarIdRelacionaniCdsNaoIdentif;


   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlRegNIDuplicados }



constructor TCtrlRegNIDuplicados.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
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
  sSql := 'SELECT ' +
          '   0 AS IDRELACIONANI, ' +
          '   CODLANCFINANC, ' +
          '   PLNCODIGO, ' +
          '   IDMODULO, ' +
          '   HISTPADFINAN, ' +
          '   MOECODIGO, ' +
          '   IDUSUARIOINCLUSAO, ' +
          '   CODPORTADOR, ' +
          '   VALORLANCFINAN, ' +
          '   NUMCHQBORDERO, ' +
          '   DATALANCFINAN, ' +
          '   DATACONCILIACAO, ' +
          '   ENTRADASAIDA, ' +
          '   HISTORICO, ' +
          '   STATUSCONCILIA, ' +
          '   VALOROUTRAMOEDA, ' +
          '   IDPESSOA, ' +
          '   CODLANCTRANSF, ' +
          '   LOTETRANSMISSAO, ' +
          '   IDNFLIVRO, ' +
          '   DATADISPFINANC, ' +
          '   FLGESTORNADO, ' +
          // Sol 31714_38358 Kintana 523349_523362 - Paulo Nobre
          '   CONCILIADO, ' +
          '   DATACONCILIACAOBANCARIA ' +
          'FROM ' +
          '   MOVIMFINANC ' +
          'WHERE (CODPORTADOR    = ' + FloatToStr(rCodPortador)+ ') AND '+
          '      (IDPESSOA       = ' + FloatToStr(rIDPessoa)   + ') AND '+
          '      (STATUSCONCILIA = ' + QuotedStr(sStatus)      + ') AND '+
          '      ((FLGESTORNADO <> ''S'') OR (FLGESTORNADO IS NULL)) ';

  if (rValorInicial > 0) then
     sSql := sSql + '     AND (VALORLANCFINAN >= ' + StringReplace(FloatToStr(rValorInicial),',','.',[rfReplaceAll])+ ') ';

  if (rValorFinal > 0) then
     sSql := sSql + '     AND (VALORLANCFINAN <= ' + StringReplace(FloatToStr(rValorFinal),',','.',[rfReplaceAll]) + ') ';

  sSql := sSql + ' ORDER BY DATALANCFINAN, NUMCHQBORDERO';

  Result := GetDataPacket(sSql);
end;




function TCtrlRegNIDuplicados.Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double;
                                         bIntegraContabil: Boolean): Boolean;
var
   cdsAux,
   cdsEnvio            : TCMClientDataSet;
   rCodLancFinancAux : Double;
   rCodLancAnt       : Double;
   rCodLancNovo      : Double;
   sSQL              : String;
   CtrlMensagens     : TCtrlMensagens;
begin
   MessageInfo       :='';
   rCodLancFinancAux :=0;

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
          // Alterado por Arnaldo V. Scarin, em 28/12/2009
          // SOL.: 128563 Kintana: 690151
          // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
          // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
          // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
          // específico para o PGA

          //Felipe de Oliveira
          // Sol 155431/4361 se a data for maior que 31/12/2009 e o plano for operações comuns
          //ele deve ser modificado para pga
          If (dDataRegularizacao >= StrToDate('31/12/2009')) and (rIDPlano = 110)  then
            CtrlFinanc.F_bUsaPlanoPatro2010 := True;

          CtrlMensagens := TCtrlMensagens.Create;

          cdsAux   := TCMClientDataSet.Create(nil);
          cdsEnvio := TCMClientDataSet.Create(nil);
          try
             cdsEnvio.Data := GetDataPacket(
              ' select 10000 as CODLANCFINANC, sysdate as DATACONCILIA, 123456.78 as VALOR from DUAL ' );
             cdsEnvio.Delete;

             cdsAux.Data := GetDataPacket(CtrlFinanc.sSqlRelacionados);
             StartTransaction;

             // Lançamentos Não-Identificados
             FCdsNaoIdent.First;
             while not(FCdsNaoIdent.Eof) do
             begin
                if (FCdsNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'J') then
                begin
                   cdsAux.Append;
                   cdsAux.FieldByName('CODLANCFINANC').AsFloat := FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;
                   cdsAux.FieldByName('DATADISP').AsDateTime   := dDataRegularizacao;
                   cdsAux.FieldByName('IDRELACIONANI').AsFloat := FCdsNaoIdent.FieldByName('IDRELACIONANI').AsFloat;
                   cdsAux.FieldByName('IDMODORIGEMREGU').AsInteger := 9;

                   cdsAux.FieldByName('FLGNI').AsString            := 'I';
                   cdsAux.FieldByName('FLGMARCADO').AsString       := 'N';
                   cdsAux.Post;

                   Result := CtrlFinanc.MudaStatusConcilia('J',
                                                           dDataRegularizacao,
                                                           FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat);

                   if not(Result) then
                      raise Exception.Create(CtrlFinanc.MessageInfo);

                   rCodLancFinancAux := FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;
                   rCodLancAnt       := FCdsNaoIdent.FieldByName('CODLANCFINANC').AsFloat;

                   Result := CtrlFinanc.EstornoFinanceiro(dDataRegularizacao,
                                                          dDataRegularizacao,
                                                          False,rCodLancFinancAux,
                                                          F_rIDPessoa,
                                                          F_rIDModulo,
                                                          F_rIDUsuario,
                                                          rIDPlano,
                                                          bIntegraContabil);

                   if not(Result) then
                      raise Exception.Create(CtrlFinanc.MessageInfo);

                end;

                FCdsNaoIdent.Next;
             end;

             // Lançamentos Conciliados
             FCdsNaoConc.First;
             while not(FCdsNaoConc.Eof) do
             begin
                if (FCdsNaoConc.FieldByName('STATUSCONCILIA').AsString='X') then
                begin
                   cdsAux.Append;
                   cdsAux.FieldByName('CODLANCFINANC').AsFloat := FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat;
                   cdsAux.FieldByName('DATADISP').AsDateTime   := FCdsNaoConc.FieldByName('DATADISPFINANC').AsDateTime;

                   cdsAux.FieldByName('IDRELACIONANI').AsFloat := FCdsNaoConc.FieldByName('IDRELACIONANI').AsFloat;

                   cdsAux.FieldByName('IDMODORIGEMREGU').AsInteger := 9;

                   cdsAux.FieldByName('FLGNI').AsString        := 'N';
                   cdsAux.FieldByName('FLGMARCADO').AsString   := 'N';
                   cdsAux.Post;


                   Result := CtrlFinanc.MudaStatusConcilia('X',
                                                           dDataRegularizacao,
                                                           FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat);
                   if not Result then
                      raise Exception.Create(CtrlFinanc.MessageInfo);

                   rCodLancNovo := FCdsNaoConc.FieldByName('CODLANCFINANC').AsFloat;

                   cdsEnvio.Append;
                   cdsEnvio.FieldByName('CODLANCFINANC').AsFloat   := rCodLancNovo;
                   cdsEnvio.FieldByName('DATACONCILIA').AsDateTime := dDataRegularizacao;
                   cdsEnvio.FieldByName('VALOR').AsFloat           := FCdsNaoConc.FieldByName('VALORLANCFINAN').AsFloat;
                   cdsEnvio.Post;

                end;

                FCdsNaoConc.Next;
             end;

             GravaRecbToPagto(rCodLancAnt, rCodLancNovo, dDataRegularizacao);//Monica sa Silva Gonzaga SOL158685 KTN1970463

             //Grava Relacionados
             Result := CtrlFinanc.GravaRelacionados(cdsAux.Data);
             if not(Result) then
                raise Exception.Create(CtrlFinanc.MessageInfo);

             Commit;

             if Result then
             begin
               CtrlMensagens.InitializeAs( Self );
               cdsEnvio.First;
               while not cdsEnvio.Eof do
               begin
                 CtrlMensagens.EnviaMensagemContexto( trunc( F_rIDUsuario ), 1,
                  [ 'CODLANCFINANC'    ,
                    'DATACONCILIA'     ,
                    'VALOR'          ] ,
                  [ cdsEnvio.FieldByName('CODLANCFINANC').AsString                                  ,
                    FormatDateTime( 'dd/mm/yyyy', cdsEnvio.FieldByName('DATACONCILIA').AsDateTime ) ,
                    FormatFloat( '#,##0.00', cdsEnvio.FieldByName('VALOR').AsFloat )              ] );
                 cdsEnvio.Next;
               end;
             end;

          finally
             cdsAux.Free;
             cdsEnvio.Free;
             CtrlMensagens.Free;
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



function TCtrlRegNIDuplicados.GravaRecbToPagto(const CodLancAnt, CodLancNovo: Double; dDataRegularizacao: TDateTime) : Boolean;
var sSQL : String;
    cdsParam : TclientDataset;
begin
   Result := True;

   cdsParam := TclientDataset.Create(nil);
   try
     cdsParam.Data := GetDataPacket( ' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = '+ formatFloat('0', F_rIDPessoa) );

     if CodLancAnt <> -1 then
     begin
        sSQL := ' UPDATE RECBTOPAGTO SET CODLANCNAOIDENT = ' + FloatToStr(CodLancAnt);

        if (cdsParam.FieldByName('FLGALTDTBAIXA').asString = 'S') and
           (FCdsNaoIdent.FieldByName('STATUSCONCILIA').AsString[1] in ['I', 'J']) then
        begin
          cdsParam.data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = '+ FloatToStr(CodLancAnt) );
//Monica sa Silva Gonzaga SOL158685 KTN1970463 - inicio
///          sSQL := sSQL + ', DATABAIXA = TO_DATE('+ quotedStr( formatDateTime('dd/mm/yyyy', cdsParam.fieldByName('DATALANCFINAN').asDateTime) )+ ') ';
//Monica sa Silva Gonzaga SOL158685 KTN1970463 - fim
             sSQL := sSQL + ', DATABAIXA = TO_DATE('+ quotedStr( formatDateTime('dd/mm/yyyy', dDataRegularizacao) )+ ') ';
        end;

        sSQL := sSQL + ' WHERE CODLANCFINANC = ' + FloatToStr(CodLancNovo);
     end
     else
     begin
       sSQL := ' UPDATE RECBTOPAGTO SET CODLANCNAOIDENT = NULL ';

       if (cdsParam.FieldByName('FLGALTDTBAIXA').asString = 'S') and
          (FCdsNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'I') then
       begin
         cdsParam.data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = '+ FloatToStr(CodLancNovo) );
//Monica sa Silva Gonzaga SOL158685 KTN1970463 - inicio
////         sSQL := sSQL + ', DATABAIXA = TO_DATE('+ quotedStr( formatDateTime('dd/mm/yyyy', cdsParam.fieldByName('DATALANCFINAN').asDateTime) )+ ') ';
//Monica sa Silva Gonzaga SOL158685 KTN1970463 - fim	
                  sSQL := sSQL + ', DATABAIXA = TO_DATE('+ quotedStr( formatDateTime('dd/mm/yyyy', dDataRegularizacao) )+ ') ';

       end;

       sSQL := sSQL + ' WHERE CODLANCFINANC = ' + FloatToStr(CodLancNovo);
     end;

     try
        ExecSql(sSQL);
     except
        Result := False;
     end;

   finally
     cdsParam.Free;
   end;
end;




function TCtrlRegNIDuplicados.DesfazRegularizacao(iIdModulo,iIdPessoa: integer): Boolean;
begin
   MessageInfo:='';

   if ConnectionSide=cnsClient then
   begin
       Result:=Connection.AppServer.DesfazRegularizacao(iIdModulo,iIdPessoa,
                                                        FcdsIdent.Data,
                                                        FcdsConc.Data);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
   end
   else
   begin
       try
          StartTransaction;

          // Loop dos lançamentos conciliados e selecionados para desfazerem a a regularização
          //===========================================================================
          FCdsConc.Filtered := false;
          FCdsConc.Filter   := 'STATUSCONCILIA = ''I''';
          FCdsConc.Filtered := true;
          FCdsConc.First;
          while not(FCdsConc.Eof) do
          begin
             if not CtrlFinanc.DesfazerRegularizacao(FCdsConc.FieldByName('CODLANCFINANC').AsInteger,iIdPessoa,iIdModulo) then
                raise Exception.Create(CtrlFinanc.MessageInfo);

             FCdsConc.Next;
          end;

          Commit;
          FCdsConc.Filtered := false;


       except
          on E:Exception do
          begin
             FCdsConc.Filtered := false;
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
   end;
end;



function TCtrlRegNIDuplicados.ListaLancIdentificados(rCodPortador,
  rIdPessoa, rValorInicial, rValorFinal: double;
  dDataConciliacao: TDateTime): OleVariant;
var
  sSQL: string;

begin
   sSQL := ' SELECT '                                                                             +
           '    R.IDRELACIONANI AS CODREL, '                                                      +
           '    M.STATUSCONCILIA, '                                                               +
           '    M.CODLANCFINANC, '                                                                +
           '    M.NUMCHQBORDERO, '                                                                +
           '    M.CODPORTADOR, '                                                                  +
           '    M.DATALANCFINAN, '                                                                +
           '    M.DATACONCILIACAO, '                                                              +
           '    DECODE(M.ENTRADASAIDA,''E'',''Entrada'',''S'',''Saída'') AS DESCENTRADASAIDA, '   +
           '    M.ENTRADASAIDA, '                                                                 +
           '    M.VALORLANCFINAN, '                                                               +
           '    M.VALOROUTRAMOEDA, '                                                              +
           '    M.HISTORICO, '                                                                    +
           // Sol 31714_38358 Kintana 523349_523362 - Paulo Nobre
           '    M.CONCILIADO, ' +
           '    M.DATACONCILIACAOBANCARIA ' +
           ' FROM '                                                                               +
           '    MOVIMFINANC M, '                                                                  +
           '    RELACIONANI R  '                                                                  +
           ' WHERE '                                                                              +
           '    (M.CODLANCFINANC  = R.CODLANCFINANC) AND '                                        +
           '    (M.STATUSCONCILIA = ''J'') AND '                                                  +
           '    (M.IDPESSOA       = ' + FloatToStr(rIdPessoa)     + ')  AND ';

           if rCodPortador > 0 then
              sSQL := sSQL + ' (M.CODPORTADOR    = ' + FloatToStr(rCodPortador)  + ')  AND ';

           DecimalSeparator := '.';
           if rValorInicial > 0 then
              sSQL := sSQL + ' (M.VALORLANCFINAN >= ' +  FloatToStr(rValorInicial) +  ') AND';

           if rValorFinal > 0 then
              sSQL := sSQL + ' (M.VALORLANCFINAN <= ' + FloatToStr(rValorFinal)   + ') AND';

           DecimalSeparator := ',';

           sSQL := sSQL + ' M.DATACONCILIACAO = ' + QuotedStr(DateToStr(dDataConciliacao));

  Result := GetDataPacket(sSQL);
end;




function TCtrlRegNIDuplicados.ListaLancConciliados(sIdRelacionani,sCodLancFinanc: string): OleVariant;
var
   sSQL: string;

begin
   sSQL := ' SELECT '                                                                             +
           '    R.IDRELACIONANI AS CODREL, '                                                      +
           '    M.STATUSCONCILIA, '                                                               +
           '    M.CODLANCFINANC, '                                                                +
           '    M.NUMCHQBORDERO, '                                                                +
           '    M.CODPORTADOR, '                                                                  +
           '    M.DATALANCFINAN, '                                                                +
           '    M.DATACONCILIACAO, '                                                              +
           '    DECODE(M.ENTRADASAIDA,''E'',''Entrada'',''S'',''Saída'') AS DESCENTRADASAIDA, '   +
           '    M.ENTRADASAIDA, '                                                                 +
           '    M.VALORLANCFINAN, '                                                               +
           '    M.VALOROUTRAMOEDA, '                                                              +
           '    M.HISTORICO, ' +
           // Sol 31714_38358 Kintana 523349_523362 - Paulo Nobre
           '    M.CONCILIADO, ' +
           '    M.DATACONCILIACAOBANCARIA ' +
           ' FROM '                                                                               +
           '    MOVIMFINANC M, '                                                                  +
           '    RELACIONANI R  '                                                                  +
           ' WHERE '                                                                              +
           '    (M.CODLANCFINANC  = R.CODLANCFINANC) AND '                                        +
           '    (R.IDRELACIONANI IN ('     + sIdRelacionani + ')) AND '                           +
           '    (M.CODLANCFINANC NOT IN (' + sCodLancFinanc + '))';            

  Result := GetDataPacket(sSQL);
end;



procedure TCtrlRegNIDuplicados.GerarIdRelacionaniCdsNaoIdentif;
begin
  try
     FCdsNaoIdent.DisableControls;
     FCdsNaoIdent.First;
     while not FCdsNaoIdent.Eof do
     begin
        FCdsNaoIdent.Edit;
        FCdsNaoIdent.FieldByName('IDRELACIONANI').AsFloat := GetSequence('RELACIONANI');
        FCdsNaoIdent.Post;
        FCdsNaoIdent.Next;
     end;
     FCdsNaoIdent.First;
  finally
     FCdsNaoIdent.EnableControls;
  end;
end;



end.
