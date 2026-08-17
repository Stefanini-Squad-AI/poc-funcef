{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCtrlMensagemCM;

interface

Uses uCmControlObject, classes, Sysutils, uDbMensagemcm, uDbMensagensEnviadas, DbClient, uCMTypes, uCMFileUtils;

Type

  TCtrlMensagemCM = class(TCmControlObject)

  protected
    _DbMensagemcm: TDbMensagemcm;
    _DbMensagensEnviadas: TDbMensagensEnviadas;
    procedure DoChangeDataBase; Override;

  private
    FCdsMensagem: TClientDataSet;
    procedure SetCdsMensagem(const Value: TClientDataSet);

  public
    Constructor Create; Override;
    Destructor Destroy; Override;


    //Incluído um parâmetro para enviar mesnagens dentro de transações.
    function ProcessaMensagem( OperacaoMensagem: TOperacaoMensagem; IdMensagem: LongInt; bMensEnviada: Boolean = false;
                               bInTransaction : Boolean = False ): Boolean;

    property CdsMensagem: TClientDataSet read FCdsMensagem write SetCdsMensagem;
  End;

Var
  MensagemCM: TCtrlMensagemCM;

implementation

{ TCtrlMensagemCM }

constructor TCtrlMensagemCM.Create;
begin
  inherited;
  _DbMensagemcm := TDbMensagemcm.Create(self);
  _DbMensagensEnviadas := TDbMensagensEnviadas.Create(self);;
  
  FCdsMensagem := TClientDataSet.Create(nil);
end;

destructor TCtrlMensagemCM.Destroy;
begin
  _DbMensagemcm.Free;
  _DbMensagensEnviadas.Free;
  FCdsMensagem.Free;
  inherited;
end;

procedure TCtrlMensagemCM.DoChangeDataBase;
begin
  inherited;

  _DbMensagemcm.DataBaseName := DataBaseName;
  _DbMensagensEnviadas.DataBaseName := DataBaseName;
    
end;

function TCtrlMensagemCM.ProcessaMensagem(OperacaoMensagem: TOperacaoMensagem; IdMensagem: Integer;
 bMensEnviada: Boolean = false; bInTransaction : Boolean = False): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaMensagem(FCdsMensagem.Data, Integer(OperacaoMensagem), IdMensagem);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Try
        Result := False;

        if not bInTransaction then
          StartTransaction;

        Case OperacaoMensagem of
          omEnviar:
          begin
             Result := ApplyCds(FCdsMensagem, _DbMensagemcm, [], []);

             if Result then
             begin
                Result := ApplyCds(FCdsMensagem, _DbMensagensEnviadas, [], []);

                if not result then
                   MessageInfo := _DbMensagemcm.MessageInfo;
             end
             else
                MessageInfo := _DbMensagemcm.MessageInfo;
          end;
          omMarcaLida:
             Result := ExecSQL('UPDATE MENSAGEMCM SET LIDA = 1 WHERE IDMENSAGEM = '+ IntToStr(IdMensagem));
          omMarcaNaoLida:
             Result := ExecSQL('UPDATE MENSAGEMCM SET LIDA = 0 WHERE IDMENSAGEM = '+ IntToStr(IdMensagem));
          omExcluir:
             if bMensEnviada then
                Result := ExecSQL('DELETE FROM MENSAGENSENVIADAS WHERE IDMENSAGEM = '+ IntToStr(IdMensagem))
             else
                Result := ExecSQL('DELETE FROM MENSAGEMCM WHERE IDMENSAGEM = '+ IntToStr(IdMensagem));
        End;

        If Not Result Then
           Raise Exception.Create(MessageInfo)
        Else
          if not bInTransaction then
           Commit;
     except
        On E:Exception Do
         Begin
            Result := False;
            if InTransaction then Rollback;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

procedure TCtrlMensagemCM.SetCdsMensagem(const Value: TClientDataSet);
begin
  FCdsMensagem := Value;
end;

end.
