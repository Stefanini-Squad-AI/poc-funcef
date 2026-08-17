// Alterações:
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

      procedure SetCdsParamorcamento(const Value: TClientDataSet);

   public

      constructor Create; override;
      destructor  Destroy; override;

      function  AplicaOperacaoParamOrcamento : Boolean;

      function  Procurar(idpessoa:Double): OleVariant;
      function  ListaMoeda : OleVariant;
      function  ListaParamOrcamento(pidEmpresa: Integer): OleVariant;
      function  ListaPlanoOrc: OleVariant;

      procedure AltIdcontaorcresult(idcontaorcresult: string; idpessoa:integer);
      procedure AltIdcontaorcde(idcontaorcde: string; idpessoa:integer);
      procedure AltIdcontaorcpara(idcontaorcpara: string; idpessoa:integer);

      property  CdsParamorcamento: TClientDataSet read FCdsParamorcamento write SetCdsParamorcamento;
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
begin
   If ConnectionSide = cnsClient then begin

      Result := Connection.AppServer.AplicaOperacaoParamOrcamento( FCdsParamorcamento.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end Else begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsParamorcamento,_DbParamorcamento,[],[]);
         If Not Result Then begin
            MessageInfo := _DbParamorcamento.MessageInfo;
            Abort;
         end Else
            Commit;
      Except
         On E:Exception Do begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
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
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
      SqlLocal.Add( 'SELECT * FROM PARAMORCAMENTO WHERE IDPESSOA = ' + IntToStr( pidEmpresa ) );
      Result := GetDataPacket( SqlLocal.Text );
   finally
      SqlLocal.Free;
   end;
end;



function TCtrlParamOrcamento.ListaPlanoOrc : OleVariant;
var
   SqlLocal : TStringList;

begin
   SqlLocal := TStringList.Create;

   try
      SqlLocal.Add( 'SELECT * FROM PLANOORCAMENTARIO ORDER BY NOMEPLANOORC' );

      Result := GetDataPacket( SqlLocal.Text );
   finally

      SqlLocal.Free;
   end;
end;




end.
