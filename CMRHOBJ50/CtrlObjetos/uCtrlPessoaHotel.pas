unit uCtrlPessoaHotel;

interface

Uses
   SysUtils, Classes, DbClient, uCmControlObject, uSistema,
   uCtrlPessoa, uCmTypes, uDbHotel;

type
  TCtrlPessoaHotel = class(TCtrlPessoa)
  private
  protected
    _DbHotel: TDbHotel;
    procedure DoChangeDataBase;  override;
//    procedure OnCreateAppServer; override;
    function ExecAppServer(Operacao: TOperacao): Boolean; override;
    function ProcessaOutros(Operacao: TOperacao;
                           Var Mensagem: String): Boolean; override;

  public
    constructor Create; Override;
    destructor Destroy; Override;
    function SelHotel(rIdPessoa: double): OleVariant;
  end;

implementation

{ TCtrlPessoaHotel }
uses uMidasUtil;
constructor TCtrlPessoaHotel.Create;
begin
  inherited;
  _DbHotel := TDbHotel.Create(self);
end;

destructor TCtrlPessoaHotel.Destroy;
begin
  inherited;
  _DbHotel.Free;

end;

procedure TCtrlPessoaHotel.DoChangeDataBase;
begin
  inherited;
  _DbHotel.DataBaseName := DataBaseName;
end;

function TCtrlPessoaHotel.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaHotel(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

function TCtrlPessoaHotel.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   try
      If ( Operacao = opApagar ) Then
      Begin
        EmptyCds([CdsSubTipo]);

        Result := ApplyCds(CdsSubTipo , _DbHotel, [], [] );
        If Not Result Then Raise Exception.Create(_DbHotel.MessageInfo);
      End
      Else
      Begin
        Result := ApplyCds(cdsSubTipo , _DbHotel, [_DbPessoa.Idpessoa], [_DbHotel.IdHotel] );
        If Not Result Then Raise Exception.Create(_DbHotel.MessageInfo);
      End;
   Except
      On E:Exception Do
      Begin
        Result := false;
        Mensagem := E.Message;
      End;
   End;

end;

function TCtrlPessoaHotel.SelHotel(rIdPessoa: double): OleVariant;
begin
  result := GetDataPacket('SELECT * FROM HOTEL WHERE IDHOTEL = ' + FloatToStr(rIdPessoa));
end;

end.
