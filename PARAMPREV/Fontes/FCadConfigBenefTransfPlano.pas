unit FCadConfigBenefTransfPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdbedit, wwdblook,  CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, CmEventosCadastro,
  ImgList;
type
  TfrmCadConfigBenefTransfPlano = class(TfrmCadMestreDetalheCS)
    dbedTitulo: TwwDBEdit;
    qryPlano: TwwQuery;
    updDet: TUpdateSQL;
    dbedCodigoCargoExt: TDBEdit;
    Label2: TLabel;
    lblCodigo: TLabel;
    dblkpcmbPlanoDestino: TwwDBLookupCombo;
    qryDet: TwwQuery;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dblkpcmbPlanoOrigem: TwwDBLookupCombo;
    dblkpcmbBeneficioOrigem: TwwDBLookupCombo;
    dblkpcmbBeneficioDestino: TwwDBLookupCombo;
    qryBenefOrigem: TwwQuery;
    qryBenefDestino: TwwQuery;
    qryRegra: TwwQuery;
    Label6: TLabel;
    dblkpcmbRegraCalculo: TwwDBLookupCombo;
    Label7: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dblkpcmbPlanoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmCadConfigBenefTransfPlano: TfrmCadConfigBenefTransfPlano;

implementation

uses FPrincipal, UDataBase, UMensErro, USistema;

{$R *.DFM}

procedure TfrmCadConfigBenefTransfPlano.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count <=  0) or (MontaSelect.ValoresChave[0] = '')
  then Exit;

  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryDet.Open;
end;


procedure TfrmCadConfigBenefTransfPlano.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
   try
      AplicaAlteracoes([qryDet])
   except
      raise;
   end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end; 

procedure TfrmCadConfigBenefTransfPlano.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; 


procedure TfrmCadConfigBenefTransfPlano.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value   := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value   := 0;
  qryDet.Open;


  qryRegra.Close;
  qryRegra.Open;

  qryPlano.Close;
  qryPlano.Open;

  qryBenefOrigem.Close;
  qryBenefOrigem.ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByname('IDPLANOPREV').AsInteger;
  qryBenefOrigem.Open;

  qryBenefDestino.Close;
  qryBenefDestino.ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByname('IDPLANOPREV').AsInteger;
  qryBenefDestino.Open;

end;

procedure TfrmCadConfigBenefTransfPlano.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dblkpcmbPlanoOrigem.Text = '' then
  begin
    MsgDlg('Plano de Origem não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbPlanoOrigem.SetFocus;
    Abort;
  end;

  if dblkpcmbPlanoDestino.Text = '' then
  begin
    MsgDlg('Plano Destino não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbPlanoDestino.SetFocus;
    Abort;
  end;

  if dblkpcmbBeneficioOrigem.Text = '' then
  begin
    MsgDlg('Benefício do Plano de Origem não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbBeneficioOrigem.SetFocus;
    Abort;
  end;

  if dblkpcmbBeneficioDestino.Text = '' then
  begin
    MsgDlg('Benefício do Plano Destino não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbBeneficioDestino.SetFocus;
    Abort;
  end;

  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryDet.FieldByName('IDBENEFTRANSFPLAN').AsInteger := LeUltRegistro(nil, 'BENEFTRANSFPLANO');
  end;

  qryDet.FieldByName('PLANOORIGEM').AsString      := dblkpcmbPlanoOrigem.Text;
  qryDet.FieldByName('PLANODESTINO').AsString     := dblkpcmbPlanoDestino.Text;
  qryDet.FieldByName('BENEFICIOORIGEM').AsString  := dblkpcmbBeneficioOrigem.Text;
  qryDet.FieldByName('BENEFICIODESTINO').AsString := dblkpcmbBeneficioDestino.Text;
end;

procedure TfrmCadConfigBenefTransfPlano.dblkpcmbPlanoOrigemCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryBenefOrigem.Close;
  qryBenefOrigem.ParamByName('IDPLANOPREV').AsInteger := qryDet.FieldByname('IDPLANOORIGEM').AsInteger;
  qryBenefOrigem.Open;


end;

procedure TfrmCadConfigBenefTransfPlano.dblkpcmbPlanoDestinoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryBenefDestino.Close;
  qryBenefDestino.ParamByName('IDPLANOPREV').AsInteger := qryDet.FieldByname('IDPLANODEST').AsInteger;
  qryBenefDestino.Open;
end;

end.
