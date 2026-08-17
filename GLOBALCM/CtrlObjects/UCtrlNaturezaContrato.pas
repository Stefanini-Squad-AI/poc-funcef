unit UCtrlNaturezaContrato;
{*******************************************************}
{                                                       }
{ Softtek do Brasil                                     }
{ Analista Responsável: Thaise Amaral Martins           }
{                                                       }
{*******************************************************}

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbNaturezacontr, Forms;

Type
  TCtrlNaturezaContrato = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbNatureza: TDbNaturezacontr;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  public
    property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function  Gravar: Boolean;
    function SelecionaNaturezaContr(IdNatureza: Integer): OleVariant;
    function Aviso(Msg: String; Abortar: Boolean; TpMsg: Integer): Boolean;
  end;


implementation

{ TCtrlNaturezaContrato }

function TCtrlNaturezaContrato.Aviso(Msg: String; Abortar: Boolean;
  TpMsg: Integer): Boolean;
begin
  Result:= True;
  if Abortar then
  begin
    Application.MessageBox(Pchar(Msg), Pchar(ExtractFileName(Application.Title)), TpMsg);
    Result:= False;
  end;
end;

constructor TCtrlNaturezaContrato.Create;
begin
  inherited;
  _DbNatureza := TDbNaturezacontr.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlNaturezaContrato.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbNatureza.Free;
  inherited;
end;

procedure TCtrlNaturezaContrato.DoChangeDataBase;
begin
  inherited;
  _DbNatureza.DataBaseName := DatabaseName;
end;

function TCtrlNaturezaContrato.Gravar: Boolean;
Var
  Msg: String;
begin
   Try
      StartTransaction;
      Result := ApplyCds( fcds, _DbNatureza, [], [] );
      Msg    := _DbNatureza.MessageInfo;

      If Not Result Then
         Raise Exception.Create( Msg );

      Commit;
   Except
      On E:Exception Do
      Begin
         Rollback;
         Result := False;
         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlNaturezaContrato.SelecionaNaturezaContr(IdNatureza: Integer): OleVariant;
var sSql: String;
begin
  sSql:= 'SELECT * FROM NATUREZACONTR' +
         ' WHERE IDNATUREZA = ' + InttoStr(IdNatureza) + 
         ' ORDER BY DESCRICAO';

  Result:= GetDataPacket(sSql);
end;

procedure TCtrlNaturezaContrato.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
