{
--------------------------------------------------------------------------------
Pendência   : SIG 22246
Responsável : Darivaldo Alencar
Data        : 04/08/2016
Descrição   : Criação deste fonte: funcionalidade Coluna do Mapa de Folha
Rotina      :
--------------------------------------------------------------------------------
}
unit uCtrlColMapaFolha;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
      uSistema, uCMTypes,  uDbColMapaFolha,UMensErro,Messages,Dialogs,
      Controls ;

const
   MSG1 = 'Campo obrigatório não preenchido.'+#13+' É necessário informar a descrição!';
   MSG2 = 'Não é possível realizar a exclusão deste registro,'+#13+' pois o mesmo se encontra relacionado a rubricas existentes.';
   MSG3 = 'Já existe registro com a descrição informada.';
   MSG4 = 'Confirma exclusão do registro?';

Type
  TCtrlColMapaFolha = class(TCmControlObject)

  private
    FCdsColMapaFolha: TCMClientDataSet;
    FCdsBusca       : TCMClientDataSet;
    FDbColMapaFolha: TDbColMapaFolha;
    procedure SetCdsColMapaFolha(const Value: TCMClientDataSet);
    procedure SetCdsBusca(const Value: TCMClientDataSet);
    procedure SetDbColMapaFolha(const Value: TDbColMapaFolha);

  public
    constructor Create;  override;
    destructor  Destroy; override;
    procedure DoChangeDataBase; Override;
    function ExisteDescricao( sDescricao : String ) : Boolean;
    function ExisteIDPROVDESC(sIdColuna: String): boolean;
    function getMsg(msg: string): boolean;
    function SelecionaColMapaFolha( iIdColunaMapa : Integer): OleVariant;
    function GravaColMapaFolha: Boolean;

  published
    property DbColMapaFolha : TDbColMapaFolha  read FDbColMapaFolha  write SetDbColMapaFolha;
    property CdsColMapaFolha : TCMClientDataSet  read FCdsColMapaFolha write SetCdsColMapaFolha;
    property CdsBusca : TCMClientDataSet  read FCdsBusca write setCdsBusca;
end;

implementation

constructor TCtrlColMapaFolha.Create;
begin
  inherited;
  FDbColMapaFolha  := TDbColMapaFolha.Create(Self);
  FCdsColMapaFolha := TCMClientDataSet.Create(Nil);
  FCdsBusca        := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlColMapaFolha.Destroy;
begin
  inherited;
   FDbColMapaFolha.free;
   FCdsColMapaFolha.free;
   FCdsBusca.free;
end;

procedure TCtrlColMapaFolha.DoChangeDataBase;
begin
  inherited;
  FDbColMapaFolha.DataBaseName := Self.DataBaseName;

end;

procedure TCtrlColMapaFolha.SetCdsColMapaFolha(
  const Value: TCMClientDataSet);
begin
  FCdsColMapaFolha := Value;
end;

procedure TCtrlColMapaFolha.SetCdsBusca(
  const Value: TCMClientDataSet);
begin
  FCdsBusca := Value;
end;

procedure TCtrlColMapaFolha.SetDbColMapaFolha(
  const Value: TDbColMapaFolha);
begin
  FDbColMapaFolha := Value;
end;

function TCtrlColMapaFolha.ExisteDescricao(sDescricao : String ) : Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    CdsColMapaFolha.Data := GetDataPacket(' SELECT  IDCOLUNAMAPA,DESCRICAO FROM COLUNAMAPA '+
                                          ' WHERE DESCRICAO = '+ QuotedStr(sDescricao));
    Result := ( Not CdsColMapaFolha.IsEmpty );
  end;
end;

function TCtrlColMapaFolha.getMsg(msg: string): boolean;
begin
 result:= true;
 if ((msg = MSG1) or (msg = MSG2) or (msg = MSG3)) then
    MsgDlg(msg,'Aviso',mtWarning,[mbOK],0)
 else
 if (msg = MSG4) then
   begin
     if(MsgDlg(msg,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo) then
        result:= false;
   end
end;

function TCtrlColMapaFolha.ExisteIDPROVDESC(sIdColuna: String): boolean;
begin
  if ConnectionSide = cnsclient then begin
     Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
     CdsBusca.Data := GetDataPacket('SELECT COUNT(1) AS QTDE                '+
                                   '  FROM COLUNAMAPA C, PROVDESC P        '+
                                   ' WHERE C.IDCOLUNAMAPA = P.IDCOLUNAMAPA '+
                                   '  AND C.IDCOLUNAMAPA = ' + sIdColuna
                                   );
     Result := not(CdsBusca.FieldByName('QTDE').asInteger = 0);
  end;
end;


function TCtrlColMapaFolha.SelecionaColMapaFolha(iIdColunaMapa : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaColMapaFolha( iIdColunaMapa );
  end else begin
    FDbColMapaFolha.iIdColunaMapa.asInteger := iIdColunaMapa;
    Result := GetDataPacket( FDbColMapaFolha.SSqlSelect );
  end;
end;

function TCtrlColMapaFolha.GravaColMapaFolha: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaColMapaFolha( CdsColMapaFolha.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds( CdsColMapaFolha, DbColMapaFolha, [], [] );
      Msg := DbColMapaFolha.MessageInfo;

      if not Result then raise Exception.Create( Msg );
      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


end.
