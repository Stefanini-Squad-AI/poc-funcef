{-------------------------------------------------------------------------------

  Eventos de sistema:
  ===================

  ID   Módulo             Evento
  --   ----------------   -----------------------------------
  -1   Contas a receber   Liberação de reimpressão de boletos
  -2   Contas a receber   Registro de impressão de ficha de compensação


-------------------------------------------------------------------------------}


unit FTipoEventoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlEventoDocum, Mask, wwdbedit, DBCtrls;

type
  TFrmCadTipoEvento = class(TFrmCadastroMT)
    lblDescricao: TLabel;
    dbedDescricao: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoDocum: TCtrlEventoDocum;
    Procedure Seleciona( IdTipoEventoDocum: Double );
  public
    { Public declarations }
  end;

var
  FrmCadTipoEvento: TFrmCadTipoEvento;

implementation

Uses uMensErro, dBasedados, uSistema;

{$R *.DFM}

procedure TFrmCadTipoEvento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEventoDocum := TCtrlEventoDocum.Create;
  CtrlEventoDocum.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CtrlEventoDocum.CdsTipoEventoDocum := cds;

  MontaSelect.Filtro.Add( 'TIPOEVENTODOCUM.IDMODULO = ' + IntToStr( Sistema.IdModulo ) );

  Seleciona( -999 );                                                                         
end;

procedure TFrmCadTipoEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlEventoDocum.Free;
  inherited;
end;

procedure TFrmCadTipoEvento.Seleciona(IdTipoEventoDocum: Double);
begin
  Cds.Data := CtrlEventoDocum.ListaTipoEventoDocum( IdTipoEventoDocum );
  dbedDescricao.ReadOnly := ( cds.FieldByName('IDTIPOEVENTODOCUM').AsInteger <= 0 );
end;

procedure TFrmCadTipoEvento.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
  cds.FieldByName('FLGATIVO').AsInteger := 1;
  dbedDescricao.SetFocus;
end;

procedure TFrmCadTipoEvento.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoDocum.GravarTipoEventoDocum;

  if not Accept then
    MsgDlg( CtrlEventoDocum.MessageInfo, 'Erro', mtWarning, [mbOK], 0 );
end;

procedure TFrmCadTipoEvento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;


procedure TFrmCadTipoEvento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TFrmCadTipoEvento.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoDocum.GravarTipoEventoDocum;

  if not Accept then
    MsgDlg( CtrlEventoDocum.MessageInfo, 'Erro', mtWarning, [mbOK], 0 )
  else
    Seleciona( cds.FieldByName('IDTIPOEVENTODOCUM').AsInteger );
end;

procedure TFrmCadTipoEvento.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnApagar.Enabled := ( cds.FieldByName('IDTIPOEVENTODOCUM').AsInteger > 0 );
end;

end.
