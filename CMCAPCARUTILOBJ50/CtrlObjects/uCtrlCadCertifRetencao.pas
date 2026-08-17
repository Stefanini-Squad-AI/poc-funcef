{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Fábio Barros                    }
{ Atualizado Em: 25/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlCadCertifRetencao;

interface

uses sysutils, uCmControlObject, DbClient, uCMTypes, uDbCertificagreg,
uCtrlConfigRelatorio;

type

  TCtrlCadCertifRetencao = class(TCtrlConfigRelatorio)
  protected
    procedure DoChangeDataBase; override;
    procedure ProcessaCds(ovCds: OleVariant); override;
  private
    _DbCertificagreg: TDbCertificagreg;

  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TCtrlConfigRelatorio }

constructor TCtrlCadCertifRetencao.Create;
begin
  inherited;
  _DbCertificagreg := TDbCertificagreg.Create(Self);
end;

destructor TCtrlCadCertifRetencao.Destroy;
begin
  _DbCertificagreg.Free;
  inherited;
end;

procedure TCtrlCadCertifRetencao.DoChangeDataBase;
begin
  inherited;
  _DbCertificagreg.DataBaseName := DataBaseName;
end;

procedure TCtrlCadCertifRetencao.ProcessaCds(ovCds: OleVariant);
begin
  if ConnectionSide = cnsClient then
  begin
    Connection.AppServer.CadCertifRetencaoProcessaCds(ovCds);
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
    if not ApplyCds(_Cds, _DbCertificagreg,
      [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm],
      [_DbCertificagreg.Idreports, _DbCertificagreg.Origemcm]) then
      raise Exception.Create(_DbCertificagreg.MessageInfo)
  end;
end;

end.

