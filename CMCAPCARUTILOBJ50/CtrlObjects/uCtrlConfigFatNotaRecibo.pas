{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlConfigFatNotaRecibo;

interface

uses sysutils, uCmControlObject, DbClient, uCMTypes, uDbConfigFatNotaRecibo,
  uCtrlConfigRelatorio;

type

  TCtrlConfigFatNotaRecibo = class(TCtrlConfigRelatorio)
  protected
    procedure DoChangeDataBase; override;
    procedure ProcessaCds(ovCds: OleVariant); override;
  private
    _DbConfigFatNotaRecibo: TDbConfigFatNotaRecibo;

  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TCtrlConfigRelatorio }

constructor TCtrlConfigFatNotaRecibo.Create;
begin
  inherited;
  _DbConfigFatNotaRecibo := TDbConfigFatNotaRecibo.Create(Self);
end;

destructor TCtrlConfigFatNotaRecibo.Destroy;
begin
  _DbConfigFatNotaRecibo.Free;
  inherited;
end;

procedure TCtrlConfigFatNotaRecibo.DoChangeDataBase;
begin
  inherited;
  _DbConfigFatNotaRecibo.DataBaseName := DataBaseName;
end;

procedure TCtrlConfigFatNotaRecibo.ProcessaCds(ovCds: OleVariant);
begin
  if ConnectionSide = cnsClient then
  begin
    Connection.AppServer.ConfigFatNotaReciboProcessaCds(ovCds);
  end
  else
  begin
    if _Cds.Active then
      _Cds.Close;
    _Cds.Data := ovCds;
    if _Operacao = OpApagar then
    begin
      while not _Cds.Eof do
        _Cds.Delete;
    end;
    if not ApplyCds(_Cds, _DbConfigFatNotaRecibo,
      [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm],
      [_DbConfigFatNotaRecibo.Idreports, _DbConfigFatNotaRecibo.Origemcm]) then
      raise Exception.Create(_DbConfigFatNotaRecibo.MessageInfo)
  end;
end;

end.

