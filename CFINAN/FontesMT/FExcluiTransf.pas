unit FExcluiTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, Grids,
  Wwdbigrd, Wwdbgrid, CMProcura, uCtrlTransfFundos, usistema, uctrlPadroes,
  MontaSelect, CMProcuraSubTipo, uCmSqlParams, wwdbdatetimepicker,
  CMDateTimePicker, ImgList, TB97Ctls, uCtrlMovimFinanc, uMensErro,
  wwdblook, Mask, wwdbedit;

type
  TfrmExcluiTransf = class(TfrmOkCancelar)
    cds: TCMClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Ds: TDataSource;
    CMSqlParams1: TCMSqlParams;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    ImlPadrao: TImageList;
    edDataFim: TCMDateTimePicker;
    Label2: TLabel;
    sbtnProcurar: TToolbarButton97;
    Label3: TLabel;
    Label4: TLabel;
    MsOrigem: TMontaSelect;
    cdsFLGEXCLUIR: TStringField;
    cdsDATARETENCAO: TDateTimeField;
    cdsVLRRETIDO: TFloatField;
    cdsDATAEMISSAO: TDateTimeField;
    cdsNODOCUMENTO: TFloatField;
    cdsDATAPROGRAMADA: TDateTimeField;
    cdsSTATUS: TStringField;
    cdsCODLANCFINANCS: TFloatField;
    cdsCODLANCFINANCE: TFloatField;
    cdsIDIMPOSTORETIDO: TFloatField;
    cdsDATATRANSF: TDateTimeField;
    cdsCODDOCLANCADO: TFloatField;
    cdsPLNCODIGO: TFloatField;
    cdsVALORLANCFINAN: TFloatField;
    cdsCONTAORIGEM: TStringField;
    cdsCONTADESTINO: TStringField;
    MsDestino: TMontaSelect;
    cdsCODPORTADOR: TFloatField;
    edtOrigem: TwwDBEdit;
    edtDestino: TwwDBEdit;
    BtnOrigem: TBitBtn;
    btnDestino: TBitBtn;
    cdsCODLANCTRANSF: TFloatField;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure cdsFLGEXCLUIRChange(Sender: TField);
    procedure BtnOrigemClick(Sender: TObject);
    procedure btnDestinoClick(Sender: TObject);
    procedure edtOrigemExit(Sender: TObject);
    procedure edtDestinoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edtOrigemChange(Sender: TObject);
    procedure edtDestinoChange(Sender: TObject);


  private { Private declarations }

    _CtrlTransfFundos : TCtrlTransfFundos;
    _CtrlMovimFinanc : TCtrlMovimFinanc;
    bAlterouContaOrigem, bAlterouContaDestino: Boolean;


  public  { Public declarations }


  end;



var
  frmExcluiTransf: TfrmExcluiTransf;



implementation
{$R *.DFM}



procedure TfrmExcluiTransf.FormCreate(Sender: TObject);
begin
  inherited;
  bAlterouContaOrigem := false;
  bAlterouContaOrigem := false;
  _CtrlTransfFundos := TCtrlTransfFundos.Create(sistema.idempresa, sistema.idmodulo, sistema.idusuario, true);
  _CtrlTransfFundos.InitializeAs(padroes);
  Cds.Data := _CtrlTransfFundos.listaTranferencia(-1, -1);
end;



procedure TfrmExcluiTransf.FormDestroy(Sender: TObject);
begin
  _CtrlTransfFundos.Free;
  inherited;
end;



procedure TfrmExcluiTransf.sbtnProcurarClick(Sender: TObject);
var icodportadorOrigem, icodportadorDestino: integer;
begin
  inherited;
    if (trim(edtOrigem.text) <> '') and msOrigem.RetornouValor then
       icodportadorOrigem := strToIntDef(msOrigem.ValoresChave[0], 0)
    else
      icodportadorOrigem := 0;

    if (trim(edtDestino.text) <> '') and msDestino.RetornouValor then
       icodportadorDestino := strToIntDef(msDestino.ValoresChave[0], 0)
    else
      icodportadorDestino := 0;

    Cds.Data := _CtrlTransfFundos.listaTranferencia(0, 0, 0, edDataIni.Date, edDataFim.Date,
                                                    icodportadorOrigem, icodportadorDestino);
end;



procedure TfrmExcluiTransf.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cds.DisableControls;
  cds.First;
  try
    while not cds.eof do
    begin
      if cds.fieldByName('FLGEXCLUIR').asString = 'S' then
        if not _CtrlTransfFundos.excluiTranferencia(cds.fieldByName('CODLANCFINANCS').asInteger, cds.fieldByName('CODDOCLANCADO').asInteger) then
        begin
          MsgDlg('Ocorreu o erro ao desfazer a(s) transferências: '+_CtrlTransfFundos.MessageInfo, 'Erro', mtError, [mbOk], 0);
          break;
        end;
      cds.Next;
    end;
  finally
    sbtnProcurarClick(sender);
    cds.EnableControls;
  end;
end;



procedure TfrmExcluiTransf.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  If (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
     ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('STATUS').asString = '2') Then
      AFont.Color := clSilver;
end;



procedure TfrmExcluiTransf.cdsFLGEXCLUIRChange(Sender: TField);
begin
  inherited;
  if (cds.FieldByName('STATUS').asString = '2') and (cds.FieldByName('FLGEXCLUIR').asString = 'S') then
  begin
    MsgDlg('Esta transferência possui um documento de CPMF baixado. '+
           'Para excluir esta transferência é necessário desfazer o processo de baixa de CPMF.', 'Erro', mtWarning, [mbOk], 0);
    cds.FieldByName('FLGEXCLUIR').asString := 'N';
  end;
end;



procedure TfrmExcluiTransf.BtnOrigemClick(Sender: TObject);
var i: integer;
begin
  inherited;
  if (not bbtnConfirmar.Focused) and (not bbtnCancelar.Focused) and
     (not bbtnSair.Focused) and (not bbtnAjuda.Focused) and (not btnDestino.focused) then
  begin
    msOrigem.ItemsBusca.Clear;
    if trim(edtOrigem.text) <> '' then
      for i:=0 to (msOrigem.Colunas.Count)-1  do
        if msOrigem.Colunas[i] = 'PORTADORCONTA.DESCRICAO' then
          msOrigem.ItemsBusca.add(edtOrigem.text)
        else
          msOrigem.ItemsBusca.add('');

    msOrigem.Executar;

    if msOrigem.retornouValor then
      edtOrigem.text := msOrigem.ValoresChave[1];
  end;
end;



procedure TfrmExcluiTransf.btnDestinoClick(Sender: TObject);
var i: integer;
begin
  inherited;
  if (not bbtnConfirmar.Focused) and (not bbtnCancelar.Focused) and
     (not bbtnSair.Focused) and (not bbtnAjuda.Focused) and (not BtnOrigem.focused) then
  begin
    msDestino.ItemsBusca.Clear;
    if trim(edtDestino.text) <> '' then
      for i:=0 to (msDestino.Colunas.Count)-1  do
        if msDestino.Colunas[i] = 'PORTADORCONTA.DESCRICAO' then
          msDestino.ItemsBusca.add(edtDestino.text)
        else
          msDestino.ItemsBusca.add('');

    msDestino.Executar;

    if msDestino.retornouValor then
      edtDestino.text := msDestino.ValoresChave[1];
  end;
end;



procedure TfrmExcluiTransf.edtOrigemExit(Sender: TObject);
begin
  inherited;
  if (trim(edtOrigem.text) <> '') and bAlterouContaOrigem then
  begin
    BtnOrigemClick(sender);
    bAlterouContaOrigem := false;
  end;
end;



procedure TfrmExcluiTransf.edtDestinoExit(Sender: TObject);
begin
  inherited;
  if (trim(edtDestino.text) <> '') and bAlterouContaDestino then
  begin
    BtnDestinoClick(sender);
    bAlterouContaDestino := false;
  end;
end;



procedure TfrmExcluiTransf.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtOrigem.Text  := '';
  edtDestino.Text := '';
  edDataIni.Text  := '';
  edDataFim.Text  := '';
  Cds.Data := _CtrlTransfFundos.listaTranferencia(-1, -1);
end;



procedure TfrmExcluiTransf.edtOrigemChange(Sender: TObject);
begin
  inherited;
  bAlterouContaOrigem := true;
end;



procedure TfrmExcluiTransf.edtDestinoChange(Sender: TObject);
begin
  inherited;
  bAlterouContaDestino := true;
end;



end.
