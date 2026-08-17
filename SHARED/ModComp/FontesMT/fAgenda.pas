unit fAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet,
  uCtrlProcessoTrab, uCtrlEtapaProcesso;

type
  TfrmAgenda = class(TfrmSairAjuda)
    dsEtapa: TwwDataSource;
    dbGrd: TwwDBGrid;
    CdsEtapa: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);

  if not(CtrlEtapaProcesso.UsuarioComAgenda(Sistema.IdUsuario)) then
  begin
    Close;
    exit;
  end;
  
  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CdsEtapa.Data := CtrlProcessoTrab.ListAgendaDoUsuario(Sistema.IdUsuario);
  if not(CdsEtapa.IsEmpty) then
    ShowModal;
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEtapaProcesso);
  if Assigned(CtrlProcessoTrab) then
    FreeAndNil(CtrlProcessoTrab);
  inherited;
end;

end.
