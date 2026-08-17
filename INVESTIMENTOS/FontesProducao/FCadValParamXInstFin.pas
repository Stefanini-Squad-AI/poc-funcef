unit FCadValParamXInstFin;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Mask, 
  TREdit, fconsultaregra, USistema, TB97Ctls, TB97Tlbr, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, CmEventosCadastro, ImgList, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmCadValParamInstFinOld = class(TfrmCadastroCS)
    QryParamXiNSTfIN: TwwQuery;
    DSParamXiNSTfIN: TwwDataSource;
    QryInstFin: TwwQuery;
    DSInstFin: TwwDataSource;
    Label13: TLabel;
    GroupBox10: TGroupBox;
    edRegraUsada: TEdit;
    bbtnVerRegra7: TBitBtn;
    bbCalcFator: TBitBtn;
    dsRegra: TDataSource;
    qryRegra: TQuery;
    qryRegraIDREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    GroupBox1: TGroupBox;
    LbParaml: TLabel;
    DBLkParam: TwwDBLookupCombo;
    Label2: TLabel;
    DBLkInstFin: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    LblData: TLabel;
    dbeDataRef: TCMDateTimePicker;
    Label1: TLabel;
    REdtValor: TRealEdit;
    QryInstFinIDINSTFIN: TFloatField;
    QryInstFinSIGLAINSTFIN: TStringField;
    qryProcura: TwwQuery;
    qryIDPARAMINSTFIN: TFloatField;
    qryIDINSTFIN: TFloatField;
    qryDATAREFPRINSTFIN: TDateTimeField;
    qryIDREGRAUSOINSTFIN: TFloatField;
    qryVLRPARAMINSTFIN: TFloatField;
    dblkplstRegra: TDBLookupListBox;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure dblkplstRegraDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblkplstRegraDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dblkplstRegraMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edRegraUsadaDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure edRegraUsadaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure bbtnVerRegra7Click(Sender: TObject);
    procedure DBLkInstFinExit(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);

    Function JaExiste : Boolean ;
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dblkplstRegraDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadValParamInstFinOld: TfrmCadValParamInstFinOld;
  CodRegraUsada : Real ;
implementation


Uses
  UMensErro, UOperComum ;
{$R *.DFM}

Function TfrmCadValParamInstFinOld.JaExiste ;
var
  sSql        : string ;
  Parametro ,
  Data,
  Instituicao     : string ;

begin
  Result     := False ;
  Parametro := qry.FieldByName('IdParamInstFin').AsString ;
  Data      := qry.FieldByName('DataRefPrInstFin').AsString;
  Instituicao   := qry.FieldByName('IdInstFin').AsString;
  Try
   qryProcura.Sql.Clear;
   sSql := 'select VPI.IdParamInstFin, VPI.IdInstFin, VPI.DataRefPrInstFin,VPI.IdRegraUsoInstFin,VPI.vlrParamInstFin from ValParamXInstFin VPI ';
   sSql := sSql + ' WHERE  VPI.IDPARAMINSTFIN = ' + Parametro ;
   sSql := sSql +  ' and VPI.DATAREFPRINSTFIN = TO_DATE(''' + FormatDatetime('yyyymmdd',dbedataref.date) + ''',''yyyymmdd'' )' + ' and  VPI.IDINSTFIN = ' + Instituicao ;
   qryProcura.SQL.Add(sSQL);
   qryProcura.Open;
   Result := not qryProcura.IsEmpty;
   qryProcura.Close;
  Except raise ;
  end;
end;

procedure TfrmCadValParamInstFinOld.CmeCadastroFind(Sender: TObject);
begin
 if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
   qry.Locate('IdParamInstFin;IdInstFin;DataRefPrInstFin',
     VarArrayOf([MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1],
     MontaSelect.ValoresChave[2]]), [loPartialKey]);
  end;
 inherited;
end;


procedure TfrmCadValParamInstFinOld.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('VlrParamInstFin').Asfloat := RedtValor.Value;
  qry.FieldByName('IdRegraUsoInstFin').Asfloat := CodRegraUsada ;
end;

procedure TfrmCadValParamInstFinOld.dblkplstRegraDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  if (Sender is TDBlookupListBox) and (Source is TEdit) then
    TDBLookupListBox(Source).EndDrag(true);

end;

procedure TfrmCadValParamInstFinOld.dblkplstRegraDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;

end;

procedure TfrmCadValParamInstFinOld.dblkplstRegraMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TDBLookupListBox(Sender).BeginDrag(true);

end;

procedure TfrmCadValParamInstFinOld.edRegraUsadaDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  edRegraUsada.Text := qryRegra.FieldByName('nomeRegra').AsString;
  CodRegraUsada := qryRegra.FieldByName('IdRegra').AsFloat;
end;

procedure TfrmCadValParamInstFinOld.edRegraUsadaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TfrmCadValParamInstFinOld.bbtnVerRegra7Click(Sender: TObject);
begin
 inherited;
 if edRegraUsada.Text <> '' then
    OperComum.ChamaRegra(edRegraUsada.Text,1);
 EdRegraUsada.Text := usDescEscolhido ;
end;

procedure TfrmCadValParamInstFinOld.DBLkInstFinExit(Sender: TObject);
begin
  inherited;
  qryParamXInstFin.Close;
  qryParamXInstFin.Open;
end;

procedure TfrmCadValParamInstFinOld.qryAfterPost(DataSet: TDataSet);
begin
  inherited;
  Redtvalor.Value := 0;
  EdRegraUsada.text := '';
end;

procedure TfrmCadValParamInstFinOld.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RedtValor.Value := qry.FieldByName('VlrParamInstFin').Asfloat  ;
  CodRegraUsada := qry.FieldByName('IdRegraUsoInstFin').AsFloat ;
  qryRegra.Open;
  qryRegra.Locate('IDREGRA', CodRegraUsada, []);
  edRegraUsada.Text := qryRegra.FieldByName('nomeRegra').AsString;
end;

procedure TfrmCadValParamInstFinOld.bbtnConfirmarClick(Sender: TObject);
begin
 if Trim(dblkInstFin.Text) = '' then
  begin
   MsgDlg('Instituição deve ser informada . ','Erro',mtError,[mbOK],0);
   dblkInstFin.SetFocus;
   exit;
  end
 else
  if Trim(dblkParam.Text) = '' then
   begin
    MsgDlg('Parâmetro deve ser informado . ','Erro',mtError,[mbOK],0);
    dblkParam.SetFocus;
    exit;
   end
  else
   if Trim(RedtValor.Text) = '' then
    begin
     MsgDlg('Valor deve ser informado . ','Erro',mtError,[mbOK],0);
     RedtValor.SetFocus;
     exit;
    end
   else
     if Trim(dbeDataRef.Text) = '' then
      begin
       MsgDlg('Data deve ser informada . ','Erro',mtError,[mbOK],0);
       dbeDataRef.SetFocus;
       exit;
      end
     else
     if Trim(EdRegraUsada.Text) = '' then
      begin
       MsgDlg('Regra deve ser informada . ','Erro',mtError,[mbOK],0);
       EdRegraUsada.SetFocus;
       exit;
      end
     else
      if (ds.dataset.state  in [dsInsert, dsEdit]) then
       if JaExiste then
        begin
         MsgDlg('Parâmetro já Cadastrado para essa data . ','Erro',mtError,[mbOK],0);
         dblkInstFin.SetFocus;
         exit;
        end;

 inherited;
 RedtValor.Value := 0;
 EdRegraUsada.text := '';
end;

procedure TfrmCadValParamInstFinOld.dblkplstRegraDblClick(Sender: TObject);
begin
 edRegraUsada.Text := qryRegra.FieldByName('nomeRegra').AsString;
 CodRegraUsada := qryRegra.FieldByName('IdRegra').AsFloat;
 inherited;
end;

procedure TfrmCadValParamInstFinOld.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
  QryRegra.Open;
  QryParamXiNSTfIN.Open;
  QryInstFin.Open;
end;

procedure TfrmCadValParamInstFinOld.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryRegra.Close;
  QryParamXiNSTfIN.Close;
  QryInstFin.Close;
end;

end.
