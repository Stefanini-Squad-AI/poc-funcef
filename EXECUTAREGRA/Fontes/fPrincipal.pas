unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Db, DBTables, wwstorep, CMNetUsers, uResource, CorreioCM,
  SConnect, MConnect, DBClient, AppEvnts, CMApplicationEvents, StdActns,
  ActnList, ImgList, IvDictio, IvAMulti, IvBinDic, Menus, IvMulti,
  IvEMulti, fcStatusBar, wwdblook, Mask, wwdbedit, StdCtrls, DBCtrls,
  ExtCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, TB97, fcLabel , uSistema, Wwquery;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    procedure FormPaint(Sender: TObject);
    procedure AppPadraoActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure TfrmPrincipal.FormPaint(Sender: TObject);
begin
  inherited;
  hide;
end;

procedure TfrmPrincipal.AppPadraoActivate(Sender: TObject);
begin
  exit;
  inherited;

end;

initialization
   Sistema.NomeModulo:= 'Executa Regras de Negócio';    // Nome do Módulo
   Sistema.IdModulo  := 245 ;                           // IdModulo Cadastrado no SAD
   Sistema.Versao := '1.0.0.0';
   Sistema.NomeAplicativo:= 'Executa Regras de Negócio';

finalization
end.
