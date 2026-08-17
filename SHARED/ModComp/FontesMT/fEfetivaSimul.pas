unit fEfetivaSimul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, ExtCtrls, wwdblook, Mask, MskEdDlg, Db, DBTables, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, DBClient, fSairAjuda,
  uCMClientDataSet, uCtrlMotivo;

type
  TfrmEfetivaSimul = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsMotivo: TCMClientDataSet;
    gbxData: TGroupBox;
    DataEfet: TCMDateTimePicker;
    gbxTipo: TGroupBox;
    dblcTipoAlteracao: TwwDBLookupCombo;
    gbxImprimeEtiq: TRadioGroup;
    procedure DataEfetChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;

    FDataAlteracao: TDate;
    FIdMotivo: integer;
    FImprimirEtiquetas: boolean;
  public
    property DataAlteracao: TDate read FDataAlteracao;
    property IdMotivo: integer read FIdMotivo;
    property ImprimirEtiquetas: boolean read FImprimirEtiquetas; 
  end;

var
  frmEfetivaSimul: TfrmEfetivaSimul;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmEfetivaSimul.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');

  dblcTipoAlteracao.LookupValue := CdsMotivo.FieldByName('IDMOTIVO').asString;
  dblcTipoAlteracao.Update;
  DataEfet.Date := Date;
end;

procedure TfrmEfetivaSimul.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmEfetivaSimul.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmEfetivaSimul.DataEfetChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (DataEfet.Text <> '');
end;

procedure TfrmEfetivaSimul.bbtnConfirmarClick(Sender: TObject);
begin
  FDataAlteracao := DataEfet.Date;
  FIdMotivo := CdsMotivo.FieldByName('IDMOTIVO').asInteger;
  FImprimirEtiquetas := (gbxImprimeEtiq.ItemIndex = 0);
end;

end.
