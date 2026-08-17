unit FMTNotaCompl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, CMProcuraSubTipo, Mask, wwdbedit, StdCtrls, TREdit,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, FrAgregados,
  uCtrlTipoAgregado, Db, DBClient, uCMClientDataSet;

type
  TFrmMTNotaCompl = class(TfrmOkCancelar)
    Label1: TLabel;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    Label5: TLabel;
    gbDatas: TGroupBox;
    lblData: TLabel;
    lblEmissao: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dblkpcmbClasFisc: TwwDBLookupCombo;
    dbenNumDoc: TDBRealEdit;
    dbeCompl: TwwDBEdit;
    dbrTotalNota: TDBRealEdit;
    dblcFornCli: TCMProcuraForCli;
    FrameAgregados1: TFrameAgregados;
    CdsClasFisc: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    TipoAgregado : TCtrlTipoAgregado;
  public
    { Public declarations }
  end;

var
  FrmMTNotaCompl: TFrmMTNotaCompl;

implementation

{$R *.DFM}

Uses uMensErro, FMTRecebMerc, uModulo, DBaseDados, uSistema;

procedure TFrmMTNotaCompl.FormShow(Sender: TObject);
begin
  inherited;
  FrameAgregados1.pnlTitulo.Caption := 'Agregados da Nota Complementar';
  dblkpcmbClasFisc.Enabled := Modulo.sIntegraLivro = 'S';
end;

procedure TFrmMTNotaCompl.FormCreate(Sender: TObject);
begin
  inherited;
  TipoAgregado := TCtrlTipoAgregado.Create;
  TipoAgregado.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  FrameAgregados1.TipoAgregado   := TipoAgregado;
  TipoAgregado.cdsValorAgregTela := FrameAgregados1.cdsAgregados;

  CdsClasFisc.Data := FrmMTRecebMerc.CdsClasFisc.Data;
  With FrmMTRecebMerc Do
  Begin
     If cdsNFCompl.IsEmpty Then
        cdsNFCompl.Insert
     Else
        cdsNFCompl.Edit;

     cdsNFCompl.FieldByName('DATAEMISNF').AsString    := Cds.FieldByName('DATAEMISNF').AsString;
     cdsNFCompl.FieldByName('DATAVENCTO').AsString    := Cds.FieldByName('DATAVENCTO').AsString;
     cdsNFCompl.FieldByName('DATAENTDEVOL').AsString  := Cds.FieldByName('DATAENTDEVOL').AsString;
     cdsNFCompl.FieldByName('VLRNOTAFISCAL').AsFloat  := FrameAgregNota.cdsAgregados.FieldByName('VALOR').AsFloat;
  End;
end;

procedure TFrmMTNotaCompl.bbtnConfirmarClick(Sender: TObject);
begin
 If Trim(dbeDataEmi.Text) = '' Then
     Begin
        MsgDlg('Data de Emissão não preenchida','Erro',MtError,[mbOk],0);
        dbeDataEmi.SetFocus;
        exit;
     End;
  If Trim(dbeDataLanc.Text) = '' Then
     Begin
        MsgDlg('Data de Vencimento não preenchida','Erro',MtError,[mbOk],0);
        dbeDataLanc.SetFocus;
        exit;
     End;

  FrmMTRecebMerc.CdsAgregNFCompl.Data := FrameAgregados1.cdsAgregados.Data;

  bbtnSairClick(Self);
  inherited;

end;

end.
