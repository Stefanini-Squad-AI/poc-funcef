unit fCadTipoRelat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  Provider, DBTables
  {$IFNDEF VERSAO0505} ,uCMTypes, uCtrlTipoIndicador {$ENDIF};


type
  TfrmCadTipoRelat = class(TFrmCadastroMT)
    edDescricao: TwwDBEdit;
    Label1: TLabel;
    CdsIDTIPO: TFloatField;
    CdsDESCRICAO: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoIndicador : TCtrlTipoIndicador;
    procedure MsgTipoIndicador ( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  frmCadTipoRelat: TfrmCadTipoRelat;

implementation

uses dBaseDados, uSistema;

{$R *.DFM}

procedure TfrmCadTipoRelat.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoIndicador := TCtrlTipoIndicador.Create;
  CtrlTipoIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               MsgTipoIndicador);
  Cds.CreateDataSet;
end;


procedure TfrmCadTipoRelat.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Cds.Data := CtrlTipoIndicador.SelecionaTipoIndicador( StrToInt(MontaSelect.ValoresChave[0]) );

end;


procedure TfrmCadTipoRelat.MsgTipoIndicador(sMessageInfo: String);
begin
  ShowMessage ( sMessageInfo );
end;

procedure TfrmCadTipoRelat.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  CtrlTipoIndicador.CdsTipoIndicador.Data := Cds.Data;
  CtrlTipoIndicador.GravarTipoIndicador;
end;

procedure TfrmCadTipoRelat.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edDescricao.SetFocus;
end;

procedure TfrmCadTipoRelat.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDescricao.SetFocus;
end;

end.
