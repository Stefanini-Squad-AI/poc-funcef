// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPatroParaOrcamento
Data      : 21/05/2004
Pendencia : -
Descrição : Incluído o campo IDPATRO na query (necessário para o Orçamento)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPatroParaOrcamento
Data      : 17/12/2003
Pendencia : 14451
Descrição : Nova Segregação. Não trazer na query a informação da patro parametrizada
            no PARAMGLOGAL.IDPATRO.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPatroParaOrcamento
Data      : 24/09/2003
Pendencia : 10065
Descrição : Encontrado problema na gravação do código da Patro nos parâmetros do sistema: é
            necessário trazer TODOS os campos de uma tabela, pq o método ApplyCds passará NULL
            para os campos que não forem trazidos. Corrigindo.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/09/2003
Pendencia : 10065
Descrição : Retirado o FlgOrcamento: alterações de acordo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 04/09/2003
Pendencia : 10065
Descrição : Criado o Ctrl
---------------------------------------------------------------------------------------------------}

unit uCtrlPatro;

interface

uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPatro;

type
   TCtrlPatro = class(TCmControlObject)

   protected
      procedure DoChangeDataBase; override;


   private
      //--------------------------------------------------------------------------------------------
      //    Classes de Persistência
      //--------------------------------------------------------------------------------------------

      _DbPatro : TDbPatro;
      Fcds     : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);


   public

      property cds: TClientDataSet read Fcds write Setcds;

      //--------------------------------------------------------------------------------------------
      //    Métodos
      //--------------------------------------------------------------------------------------------

      constructor Create;  override;
      destructor  Destroy; override;

      //--------------------------------------------------------------------------------------------
      //    Metodos da Regra de Negócio
      //--------------------------------------------------------------------------------------------

      function  ListaPatroParaOrcamento(IDPatro: Double = 0; iExcluiIdPatro: integer = 0): OleVariant;
      function  Gravar: Boolean;

  end;




implementation



{$IFNDEF VERSAO0505}
uses
   uCmTypes;
{$ENDIF}



function TCtrlPatro.Gravar: Boolean;
var
   sMsg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarPatro(Fcds.Data);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
        StartTransaction;
        Result := ApplyCds(Fcds, _DbPatro, [], [] );
        sMsg   := _DbPatro.MessageInfo;

        if not(Result) then Raise Exception.Create(sMsg);

        Commit;
      except
         on E:Exception do
         begin
            Rollback;
            Result       := False;
            MessageInfo  := E.Message;
         end;
      end;
   end;
end;



constructor TCtrlPatro.Create;
begin
   inherited;
   _DbPatro := TDbPatro.Create(Self);
   FCds     := TClientDataSet.Create( nil );
end;



destructor TCtrlPatro.Destroy;
begin
   if Fcds.Active then Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _DbPatro.Free;

   inherited;
end;



procedure TCtrlPatro.DoChangeDataBase;
begin
   inherited;
   _DbPatro.DataBaseName := DatabaseName;
end;



function TCtrlPatro.ListaPatroParaOrcamento(IDPatro: Double; iExcluiIdPatro: integer): OleVariant;
var
  sSQL, sParam: String;
begin
  // 17/12/03 - pend 14451
  // Excluir da query o id registrado no parâmetro do global IDPATRO

  sParam := '';
  if IDPatro <> 0        then sParam := sParam + '  AND ( PTR.IDPESSOA =  ' + FormatFloat('#0', IDPatro)        + ' ) ' + #13;
  if iExcluiIdPatro <> 0 then sParam := sParam + '  AND ( PTR.IDPESSOA <> ' + FormatFloat('#0', iExcluiIdPatro) + ' ) ' + #13;

  sSQL   := 'SELECT  '                             + #13 +
            '  PPA.NOME, '                         + #13 +
            '  PTR.IDPESSOA AS IDPATRO, '          + #13 +  //  21/05/2004
            '  PTR.* '                             + #13 +
            'FROM '                                + #13 +
            '  PESSOA PPA, '                       + #13 +
            '  PATRO  PTR '                        + #13 +
            'WHERE '                               + #13 +
            '      PTR.IDPESSOA = PPA.IDPESSOA '   + #13 +
            sParam +
            'ORDER BY NOME ';

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlPatro.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;



end.
