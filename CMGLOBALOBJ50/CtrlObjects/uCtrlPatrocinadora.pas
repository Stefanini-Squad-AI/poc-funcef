// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 26/08/2006
Pendencia : 22217
Descrição : Criado o Ctrl
---------------------------------------------------------------------------------------------------}

unit uCtrlPatrocinadora;

interface

uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCtrlPessoa, uDBPatro, uCmTypes;

type
   TCtrlPatrocinadora = class(TCtrlPessoa)

   protected
      procedure DoChangeDataBase; override;

      function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Override;
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

      function SelPatrocinadora(rIdpessoa: Double): OleVariant;
      function SelDadosPatro(rIdEmpresa, rIdForCli: Double; aCdsSubTipo: TCLientDataSet): Boolean;

      function ListaPatrocinadora(IDPatro: Double = 0): OleVariant;
      function Gravar: Boolean;
  end;


implementation

Uses uMidasUtil;

{ TCtrlPatrocinadora }

function TCtrlPatrocinadora.SelPatrocinadora(rIdpessoa: Double): OleVariant;
begin
  _DbPatro.Idpessoa.AsFloat := rIdpessoa;
  Result := GetDataPacket(_DbPatro.sSqlSelect);
end;

function TCtrlPatrocinadora.Gravar: Boolean;
var
   sMsg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.Gravar(Fcds.Data);

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

function TCtrlPatrocinadora.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   Try
      If ( Operacao = opApagar ) Then
      Begin
        EmptyCds([CdsSubTipo]);

        Result := ApplyCds(CdsSubTipo , _DbPatro, [], [] );
        If Not Result Then Raise Exception.Create(_DbPatro.MessageInfo);
      End
      Else
      Begin
        Result := ApplyCds(CdsSubTipo , _DbPatro, [_DbPessoa.Idpessoa], [_DbPatro.Idpessoa] );
        If Not Result Then Raise Exception.Create(_DbPatro.MessageInfo);
      End;
   Except
      On E:Exception Do
      Begin
        Result := false;
        Mensagem := E.Message;
      End;
   End;
end;


constructor TCtrlPatrocinadora.Create;
begin
   inherited;
   _DbPatro := TDbPatro.Create(Self);
   FCds     := TClientDataSet.Create( nil );
end;

destructor TCtrlPatrocinadora.Destroy;
begin
   if Fcds.Active then Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _DbPatro.Free;

   inherited;
end;

procedure TCtrlPatrocinadora.DoChangeDataBase;
begin
   inherited;
   _DbPatro.DataBaseName := DatabaseName;
end;

function TCtrlPatrocinadora.ListaPatrocinadora(IDPatro: Double = 0): OleVariant;
var
  sSQL, sParam: String;
begin
  sParam := '';
  if IDPatro <> 0 then
     sParam := sParam + '  AND ( PTR.IDPESSOA =  ' + FormatFloat('#0', IDPatro) + ' ) ' + #13;

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

function TCtrlPatrocinadora.SelDadosPatro(rIdEmpresa, rIdForCli: Double; aCdsSubTipo: TCLientDataSet): Boolean;
Var
  ovSubTipo: OleVariant;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.SelDadosPatro(rIdEmpresa, rIdForCli, ovSubTipo);

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo
     Else
     Begin
        aCdsSubTipo.Data := ovSubTipo;
     End;
  End
  Else
  Begin
     Try
       aCdsSubTipo.Data := SelPatrocinadora(rIdForCli);

       Result := True;
     Except
       On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
     End;
  End;
end;


procedure TCtrlPatrocinadora.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
