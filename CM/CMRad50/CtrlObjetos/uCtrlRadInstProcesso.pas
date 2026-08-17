{-------------------------------------------------------------------------------
 Data       : 14.10.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 21792
 Descrição  : Criação da Control para ser utilizada com o RAD+ (novo RAD)
--------------------------------------------------------------------------------}
unit uCtrlRadInstProcesso;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRADPRocesso, uMidasUtil,uCMTypes;

Type
  TCtrlRadInstProcesso = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    //amf 14.10.2006: DbObject para a RADINSTPROCESSO (no RAD(antigo) existe a RADINSTPROCESSO)
    DbRadInstProcesso : TDbRadProcesso;
    Padroes        : TCtrlPadroes;
    FcdsRadInstProcesso: TClientDataSet;
    procedure SetcdsRadInstProcesso(const Value: TClientDataSet);
  public
      property cdsRadInstProcesso: TClientDataSet read FcdsRadInstProcesso write SetcdsRadInstProcesso;
      Constructor Create; Override;
      Destructor  Destroy;Override;

  end;

implementation

{ TCtrlRadInstProcesso }

procedure TCtrlRadInstProcesso.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlRadInstProcesso.Create;
begin
  inherited;

end;

destructor TCtrlRadInstProcesso.Destroy;
begin
  inherited;

end;

procedure TCtrlRadInstProcesso.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlRadInstProcesso.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlRadInstProcesso.SetcdsRadInstProcesso(
  const Value: TClientDataSet);
begin
  FcdsRadInstProcesso := Value;
end;

end.
