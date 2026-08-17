unit FParamRegraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes, {$ENDIF}
  uCtrlParamRegra, DBCtrls, Wwdatsrc;

type
  TFrmParamRegraMT = class(TfrmOkCancelar)
    Cds: TCMClientDataSet;
    CdsFLGCAMPO: TFloatField;
    CdsFLGVARIAVEL: TFloatField;
    ds: TwwDataSource;
    GroupBox1: TGroupBox;
    SbtnAlterar: TSpeedButton;
    sbtnAcertar: TSpeedButton;
    DbRbCampo: TDBRadioGroup;
    DbRbVariavel: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamRegra : TCtrlParamRegra;
    procedure MessageCtrlParamRegra( sMessageInfo : String);
  public
    { Public declarations }
  end;

var
  FrmParamRegraMT: TFrmParamRegraMT;

implementation

Uses uSistema, dBaseDados;

{$R *.DFM}

procedure TFrmParamRegraMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria e Inicializa Classes de Controles }
  CtrlParamRegra := TCtrlParamRegra.Create;
  CtrlParamRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            MessageCtrlParamRegra );
  Cds.CreateDataSet;

  Cds.Data := CtrlParamRegra.ListaParamRegra;

end;

procedure TFrmParamRegraMT.MessageCtrlParamRegra(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo);
end;

procedure TFrmParamRegraMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  { Confirma Dados }
  If Cds.State In [ dsEdit ] Then Begin
    CtrlParamRegra.CdsParamRegra.Data := Cds.Data;
    CtrlParamRegra.AtualizaParamRegra(Cds.FieldByName('FLGCAMPO').AsInteger,
                                      Cds.FieldByName('FLGVARIAVEL').AsInteger);
  End;
end;

end.
