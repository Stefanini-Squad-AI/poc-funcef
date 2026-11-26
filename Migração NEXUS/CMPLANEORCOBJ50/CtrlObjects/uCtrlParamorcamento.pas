// Alterações:
{ --------------------------------------------------------------------------------------------------
Data      : 25/08/2011
Autor     : Ricardo de Freitas Araújo
SOL/KTN   : 159212 / 1337867
Descrição : Métodos de Listagens e Tipo de Despesa e Programa
{ --------------------------------------------------------------------------------------------------
Data      : 28/08/2006
Autor     : Rodolpho da Silva
Pendencia : 22851
Descrição : Implementação de rotinas para a gravação de códigos para o códgigo das contas, por
            Atividade/Projeto
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 09/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Fonte re-organizado, porém as alterações intoduzidas foram passadas para as
            uCtrlPlanPrevContabil e uCtrlPatro, da CMGlobalObj50
---------------------------------------------------------------------------------------------------}

unit uCtrlParamorcamento;

interface


uses
   DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider,
   uDbParamorcamento, uCMTypes, Classes;


Type
   TCtrlParamorcamento = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      _dbParamorcamento : TdbParamorcamento;
      FCdsParamorcamento: TClientDataSet;
      FCdsAtivProj: TClientDataSet;

      procedure SetCdsParamorcamento(const Value: TClientDataSet);
      procedure SetCdsAtivProj(const Value: TClientDataSet);

   public

      constructor Create; override;
      destructor  Destroy; override;

      function  AplicaOperacaoParamOrcamento : Boolean;

      function  Procurar(idpessoa:Double): OleVariant;
      function  ListaMoeda : OleVariant;
      function  ListaParamOrcamento(pidEmpresa: Integer): OleVariant;
      function  ListaPlanoOrc: OleVariant;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      function ListaProgramaOrcamentario():OleVariant;

      //Ricardo de Freitas SOL: 159212 - Kintana 1337867
      function ListaTipoDespesaOrcamentario():OleVariant;

      function ListaAtivProj(iIdPessoa: integer): OleVariant;


      procedure AltIdcontaorcresult(idcontaorcresult: string; idpessoa:integer);
      procedure AltIdcontaorcde(idcontaorcde: string; idpessoa:integer);
      procedure AltIdcontaorcpara(idcontaorcpara: string; idpessoa:integer);

      property  CdsParamorcamento: TClientDataSet read FCdsParamorcamento write SetCdsParamorcamento;

      property CdsAtivProj: TClientDataSet read FCdsAtivProj write SetCdsAtivProj;
  end;



implementation


procedure TCtrlParamorcamento.DoChangeDataBase;
begin
   inherited;
   _dbParamorcamento.DatabaseName   := DataBaseName;
end;



procedure TCtrlParamorcamento.OnCreateAppServer;
begin
   inherited;
   FCdsParamorcamento   := TClientDataSet.Create(nil);
end;



constructor TCtrlParamorcamento.Create;
begin
   inherited;
   _dbParamorcamento    := TdbParamorcamento.Create(Self);
end;



destructor TCtrlParamorcamento.Destroy;
begin
   inherited;
   _dbParamorcamento.Free;

   if isAppServer then
   begin
      FreeCds([FCdsParamorcamento]);
   end;
end;



function TCtrlParamorcamento.AplicaOperacaoParamOrcamento: Boolean;
var
  sCodOrc: string; 
begin
   If ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoParamOrcamento( FCdsParamorcamento.Data );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsParamorcamento,_DbParamorcamento,[],[]);
         If Not Result Then
            raise Exception.Create(_DbParamorcamento.MessageInfo);

         FCdsAtivProj.First;
         while not FCdsAtivProj.Eof do
         begin
            if FCdsAtivProj.UpdateStatus = usModified then
            begin
               sCodOrc := FCdsAtivProj.FieldByName('CODORCAMEN').AsString;
               if Trim(sCodOrc) = '' then
                  sCodOrc := ' NULL ';

               Result := ExecSQL('UPDATE UNIDNEGOCIO ' +
                                 'SET CODORCAMEN = ' + sCodOrc + ' ' +
                                 'WHERE UNIDNEGOC = ' + FCdsAtivProj.FieldByName('UNIDNEGOC').AsString);
               if not Result then
                  raise Exception.Create(MessageInfo);

            end;
            FCdsAtivProj.Next;
         end;

         Commit;
      Except
         On E:Exception Do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlParamorcamento.Procurar(idpessoa:Double): OleVariant;
begin
   _DbParamorcamento.Idpessoa.AsFloat := idpessoa;
   Result := GetDataPacket(_DbParamorcamento.SSqlSelect);
end;



procedure TCtrlParamorcamento.SetCdsParamorcamento(const Value: TClientDataSet);
begin
   FCdsParamorcamento := Value;
end;



procedure TCtrlParamorcamento.AltIdcontaorcresult(idcontaorcresult: string; idpessoa:integer);
var
   sSql: string;
begin
   sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCRESULT = ''' +
          idcontaorcresult + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
   ExecSQL(sSql);
end;



procedure TCtrlParamorcamento.AltIdcontaorcde(idcontaorcde: string; idpessoa:integer);
var
   sSql: string;
begin
   sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCDE = ''' +
          idcontaorcde + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
   ExecSQL(sSql);
end;



procedure TCtrlParamorcamento.AltIdcontaorcpara(idcontaorcpara: string; idpessoa:integer);
var
   sSql: string;
begin
   sSql := 'UPDATE PARAMORCAMENTO SET IDCONTAORCPARA = ''' +
          idcontaorcpara + ''' WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ')';
   ExecSQL(sSql);
end;



function TCtrlParamOrcamento.ListaMoeda : OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
      SqlLocal.Add( 'SELECT MOECODIGO,MOEDESC FROM MOEDA ORDER BY MOEDESC' );
      Result := GetDataPacket( SqlLocal.Text );
   finally
      SqlLocal.Free;
   end;
end;



function TCtrlParamOrcamento.ListaParamOrcamento( pidEmpresa : Integer ) : OleVariant;
begin
   Result := GetDataPacket('SELECT * FROM PARAMORCAMENTO ' +
                           'WHERE IDPESSOA = ' + IntToStr(pidEmpresa));
end;



function TCtrlParamOrcamento.ListaPlanoOrc : OleVariant;
begin
   Result := GetDataPacket('SELECT * FROM PLANOORCAMENTARIO ORDER BY NOMEPLANOORC');
end;


function TCtrlParamorcamento.ListaAtivProj(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  ''S'' AS VALIDAR, ' +
                           '  UNIDNEGOC, ' +
                           '  NOME, ' +
                           '  CODORCAMEN, ' +
                           '  DECODE(UNETIPO,''A'',''Analítico'',''S'',''Sintético'') AS TIPO ' +
                           'FROM ' +
                           '   UNIDNEGOCIO ' +
                           'WHERE IDPESSOA = ' + IntToStr(iIdPessoa) + ' AND ' +
                           '      UNETIPO = ''A'' ' +
                           'ORDER BY ' +
                           '   NOME ');
end;


procedure TCtrlParamorcamento.SetCdsAtivProj(const Value: TClientDataSet);
begin
  FCdsAtivProj := Value;
end;

function TCtrlParamorcamento.ListaProgramaOrcamentario: OleVariant;
Var
  SqlLocal : TStringList;

Begin
  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT * FROM CM.PROGRAMAORCAMEN ORDER BY IDPROGRAMAORCAMEN' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
end;

function TCtrlParamorcamento.ListaTipoDespesaOrcamentario: OleVariant;
Var
  SqlLocal : TStringList;

Begin
  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT * FROM CM.TIPO_DESPESAORCAMEN ORDER BY IDTIPO_DEPESAORCAMEN' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
end;

end.
