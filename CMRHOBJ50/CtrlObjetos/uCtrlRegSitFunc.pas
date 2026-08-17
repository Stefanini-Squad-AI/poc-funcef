{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
                    VerificaPreenchimentoProcesso
 Nº SOL:            250386/17325
 Nº PPM             832403
 Data da Alteração: 15/06/2015
 Alteração Form:    Criação do campo "Indicativo de Pagamento em Juizo"
 Responsável:       Higor Nayde Ferreira
 Descrição:         Criação do campo "Indicativo de Pagamento em Juizo".
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegSitFunc;

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbHstSitFunc;

type
  TCtrlRegSitFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbHstSitFunc;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListHistSitFunc(IdPessoa: double): OleVariant;

    function Gravar: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegSitFunc }

constructor TCtrlRegSitFunc.Create;
begin
  inherited;
  FDbDet := TDbHstSitFunc.Create(Self);
end;

destructor TCtrlRegSitFunc.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlRegSitFunc.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegSitFunc.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlRegSitFunc.ListHistSitFunc(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  HST.IDPESSOA, HST.IDSITFUNC, HST.IDMOTIVOOFIC, HST.IDMOTIVOGER,'+CR_LF+
    '  HST.IDMOVCONTRCAGED, HST.DATASITFUNC, MO1.DESCRICAO AS MOT_OFICIAL,'+CR_LF+
    '  MO2.DESCRICAO AS MOT_GERENCIAL, ST.DESCRICAO AS SITUACAO,'+CR_LF+
    //'  MV.DESCRICAO AS MOVCONTRCAGED, HST.NUMPROCESSO, HST.DATAREINT, HST.DATARETORNO, HST.PAGTOJUIZO '+CR_LF+  // Higor Nayde 229881/16646   //Higor Nayde Ferreira Nº SOL: 250386/17325 //Everson Cunha - SIG38475
    '  MV.DESCRICAO AS MOVCONTRCAGED, HST.NUMPROCESSO, HST.DATAREINT, HST.DATARETORNO '+CR_LF+  // Higor Nayde 229881/16646   //Higor Nayde Ferreira Nº SOL: 250386/17325 //Everson Cunha - SIG38475
    'FROM'+CR_LF+
    '  HSTSITFUNC HST, SITFUNC ST, MOTIVO MO1, MOTIVO MO2, MOVCONTRCAGED MV'+CR_LF+
    'WHERE'+CR_LF+
    '  (HST.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (HST.IDSITFUNC       = ST.IDSITFUNC) AND'+CR_LF+
    '  (HST.IDMOTIVOOFIC    = MO1.IDMOTIVO(+)) AND'+CR_LF+
    '  (HST.IDMOTIVOGER     = MO2.IDMOTIVO(+)) AND'+CR_LF+
    '  (HST.IDMOVCONTRCAGED = MV.IDMOVCONTRCAGED(+))');
end;

function TCtrlRegSitFunc.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
