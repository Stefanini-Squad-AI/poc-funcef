unit uCtrlEmailConexao;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, UCMTypes, Dialogs, uCtrlPadroes, uDbEmailConexao ;

type
   TCtrlEmailConexao = Class(TCmControlObject)
   private

     _DbEmailConexao: TDbEmailConexao;

   public
     _Cds: TCMClientDataSet;

      Function GravaDadosContaEmail: Boolean;
      Function CarregaCadEmailConexao(idEmailConexao: Integer): OleVariant;
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      function ListaConexoes : Olevariant;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlEmailConexao.Create;
begin
  inherited;
    _DbEmailConexao:= TDbEmailConexao.Create(self);
    _Cds:= TCMClientDataSet.Create(nil);

end;

destructor TCtrlEmailConexao.Destroy;
begin
    _DbEmailConexao.Free;

  if IsAppServer then
     _Cds.Free;

  inherited;
end;

procedure TCtrlEmailConexao.DoChangeDataBase;
begin
  inherited;
  _DbEmailConexao.DataBaseName := databasename;

end;

procedure TCtrlEmailConexao.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlEmailConexao.GravaDadosContaEmail: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDadosContaEmail;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(_Cds, _DbEmailConexao, [],[]);

          if not(Result) then
              Raise Exception.Create(_DbEmailConexao.MessageInfo);

           Commit;
           Result:= True;
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


function TCtrlEmailConexao.CarregaCadEmailConexao(IdEmailConexao: Integer): OleVariant;
begin

  Result := GetDataPacket('SELECT             ' +
                          '  IDEMAILCONEXAO,  ' +
                          '  SMTPSERVER,      ' +
                          '  FLGAUTENTIC,     ' +
                          '  PORTA,           ' +
                          '  NOMEEXIBICAO,    ' +
                          '  USERNAME,        ' +
                          '  PASSWORD,        ' +
                          '  DESCRICAO        ' +
                          'FROM               ' +
                          '  EMAILCONEXAO     ' +
                          'WHERE              ' +
                          '  IDEMAILCONEXAO = ' + IntToStr(idEmailConexao) +
                          'ORDER BY           ' +
                          '  NOMEEXIBICAO');

end;

function TCtrlEmailConexao.ListaConexoes: Olevariant;
begin
  Result := GetDataPacket( ' select * from emailconexao ' );
end;

end.
