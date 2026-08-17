unit fCadPesqEmpr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, Mask, DBCtrls, TREdit;

type
  TfrmCadPesqEmpr = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    gbxPesquisa: TGroupBox;
    dbedCodPesqui: TDBEdit;
    dbedData: TDBEdit;
    dbedCodCargo: TDBEdit;
    lstSalNom: TListBox;
    lstSalReal: TListBox;
    qryPesqui: TwwQuery;
    qryEntid: TwwQuery;
    qryCargo: TwwQuery;
    dblcPesquisa: TwwDBLookupCombo;
    dblcCargo: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    sbtnGrafico: TToolbarButton97;
    sbtnTendencia: TToolbarButton97;
    tbsTend: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbreFreq: TDBRealEdit;
    dbreNom: TDBRealEdit;
    dbreReal: TDBRealEdit;
    dbedMenor: TDBRealEdit;
    dbedMenorR: TDBRealEdit;
    dbedPrimQ: TDBRealEdit;
    dbedPrimQR: TDBRealEdit;
    dbedModa: TDBRealEdit;
    dbedModaR: TDBRealEdit;
    dbedMedia: TDBRealEdit;
    dbedMediaR: TDBRealEdit;
    dbedMediana: TDBRealEdit;
    dbedMedianaR: TDBRealEdit;
    dbedTercQ: TDBRealEdit;
    dbedTercQR: TDBRealEdit;
    dbedMaior: TDBRealEdit;
    dbedMaiorR: TDBRealEdit;
    Label13: TLabel;
    dbedFreq: TDBEdit;
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnGraficoClick(Sender: TObject);
    procedure sbtnTendenciaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblcPesquisaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPesqEmpr: TfrmCadPesqEmpr;

implementation

uses uMensErro, fColetaSal, fTelaAut, fChartDado, uSistema, uDataBase;

{$R *.DFM}

procedure TfrmCadPesqEmpr.CmeDetalheInsert(Sender: TObject);
var
  Ind : Integer;
begin
  //inherited;

  if (qry.FieldByName('IDEMPRESAPARTIC').Value <> Sistema.IdEmpresa) or
     (MsgDlg('Varre o Cadastro para Coleta ?', LerMensagem(4), mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes) then
  begin
    inherited;
    qryDet.FieldByName('IDPESQSALAR').AsString := trim(dbedCodPesqui.Text);
    qryDet.FieldByName('IDCARGO').AsString     := trim(dbedCodCargo.Text);
    qryDet.FieldByName('IDEMPRPART').AsFloat   := qry.FieldByName('IDEMPRESAPARTIC').AsFloat;
    qryDet.FieldByName('NUMSEQ').asFloat       := LeUltRegistro(Nil,'DADOPESQSAL');
  end
  else
  begin
    AbrirFormModal(frmColetaSal, TfrmColetaSal);

    if (frmColetaSal.ModalResult <> mrCancel) then
    begin
      qryDet.First;
      while not(qryDet.EOF) do
        qryDet.Delete;

      if (frmColetaSal.lstSalNom.Items.Count > 0) then
        for Ind:=0 to frmColetaSal.lstSalNom.Items.Count-1 do
        begin
          qryDet.Insert;
          qryDet.FieldByName('FREQ').asString    := frmColetaSal.lstQtdeSal.Items[IND];
          qryDet.FieldByName('NOMINAL').asString := frmColetaSal.lstSalNom.Items[IND];
          qryDet.FieldByName('REAL').asString    := frmColetaSal.lstSalReal.Items[IND];
          qryDet.Post;
        end;
    end;
    frmColetaSal.Free;
    sbtnTendenciaClick(Self);
    qryDet.First;
    sbtnInsDet.Down := false;
  end;

end;

procedure TfrmCadPesqEmpr.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESQSALAR').asInteger   := -1;
  qry.ParamByName('IDCARGO').asInteger       := -1;
  qry.ParamByName('IDEMPRESAPARTIC').asFloat := -1;
  qry.Open;

  qryPesqui.Open;
  qryCargo.Open;
  qryEntid.Open;

end;

procedure TfrmCadPesqEmpr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    qry.Close;
    qry.ParamByName('IDPESQSALAR').asInteger     := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDCARGO').asInteger         := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDEMPRESAPARTIC').asFloat   := StrToFloat(MontaSelect.ValoresChave[2]);
    qry.Open;
  end;

end;

procedure TfrmCadPesqEmpr.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPESQSALAR').AsString := trim(dbedCodPesqui.Text);
  qryDet.ParamByName('IDCARGO').AsString     := trim(dbedCodCargo.Text);
  qryDet.ParamByName('IDEMPRPART').asFloat   := qry.FieldByName('IDEMPRESAPARTIC').AsFloat;
  qryDet.Open;
  TFloatField(qryDet.FieldByName('NOMINAL')).DisplayFormat := '###,###,##0.00';
  TFloatField(qryDet.FieldByName('REAL')).DisplayFormat    := '###,###,##0.00';
end;

procedure TfrmCadPesqEmpr.sbtnGraficoClick(Sender: TObject);
begin
  inherited;
   if (dbedMaior.Value = 0) then exit;

   frmChartDado := TFrmChartDado.Create(Application);
   frmChartDado.edCodEntid.Text := FloatToStr(qry.FieldByName('IDEMPRESAPARTIC').AsFloat);
   frmChartDado.dsTend := ds;
   frmChartDado.dsTend.Dataset := qry;
   frmChartDado.EditPesq.Text := trim(dblcPesquisa.Text) +
                            ' - ' + trim(dbedData.Text);
   frmChartDado.EditCargo.Text := dblcCargo.Text;
   frmChartDado.EditEntid.Text := dblcEntid.Text;
   frmChartDado.ShowModal;
   frmChartDado.Free;
end;

procedure TfrmCadPesqEmpr.sbtnTendenciaClick(Sender: TObject);
var
   TotFreq, IND, ModaFreq, Tamanho : Integer;
   TotNom, TotReal, ModaNom, ModaReal : Real;
   VinteZeros : String[20];
   bFazEditPost: Boolean;
begin
  //sbtnTendencia.Down := False;
  if (qryDet.IsEmpty) then exit;

  qryDet.First;
  lstSalNom.Clear;
  lstSalReal.Clear;
  VinteZeros := '00000000000000000000';
  TotFreq := 0;
  ModaFreq := 0;
  TotNom := 0;
  TotReal := 0;
  while  not  qryDet.Eof  do begin
     TotFreq := TotFreq + qryDet.FieldByName('FREQ').AsInteger;
     for IND := 1 to qryDet.FieldByName('FREQ').AsInteger do begin
        // Criar Listas Classificadas para Sal. Nominal e Real
        Tamanho := Length(FloatToStrF
          (qryDet.FieldByName('NOMINAL').Value, ffFixed,12,2));
        lstSalNom.Items.Add(copy(VinteZeros,1,20-Tamanho) + FloatToStrF
          (qryDet.FieldByName('NOMINAL').Value, ffFixed,12,2));
        Tamanho := Length(FloatToStrF
          (qryDet.FieldByName('REAL').Value, ffFixed,12,2));
        lstSalReal.Items.Add(copy(VinteZeros,1,20-Tamanho) + FloatToStrF
          (qryDet.FieldByName('REAL').Value, ffFixed,12,2));
     end;
     TotNom := TotNom + qryDet.FieldByName('FREQ').Value * qryDet.FieldByName('NOMINAL').Value;
     TotReal := TotReal + qryDet.FieldByName('FREQ').Value * qryDet.FieldByName('REAL').Value;
     if  qryDet.FieldByName('FREQ').Value >= ModaFreq  then begin
         ModaNom := qryDet.FieldByName('NOMINAL').Value;
         ModaReal := qryDet.FieldByName('REAL').Value;
         ModaFreq := qryDet.FieldByName('FREQ').AsInteger;
     end;
     qryDet.Next;
  end;
  qryDet.First;

  if  lstSalNom.Items.Count = 0  then  exit;

  bFazEditPost := not (qry.State in [dsInsert, dsEdit]);

  if bFazEditPost then qry.Edit;

  qry.FieldByName('FREQ').Value := TotFreq;
  qry.FieldByName('MENOR').AsString := lstSalNom.Items[0];
  IND := round(lstSalNom.Items.Count/4)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('PRIMQUA').AsString := lstSalNom.Items[IND];
  IND := round(lstSalNom.Items.Count/2)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('MEDIANA').AsString := lstSalNom.Items[IND];
  IND := round(3*lstSalNom.Items.Count/4)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('TERCQUA').AsString := lstSalNom.Items[IND];
  qry.FieldByName('MEDIA').Value := TotNom / TotFreq;
  qry.FieldByName('MODA').Value := ModaNom;
  qry.FieldByName('MAIOR').AsString := lstSalNom.Items[lstSalNom.Items.Count-1];
  qry.FieldByName('MENOR_R').AsString := lstSalReal.Items[0];
  IND := round(lstSalReal.Items.Count/4)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('PRIMQUA_R').AsString := lstSalReal.Items[IND];
  IND := round(lstSalReal.Items.Count/2)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('MEDIANA_R').AsString := lstSalReal.Items[IND];
  IND := round(3*lstSalReal.Items.Count/4)-1;
  if  IND < 0 then IND := 0;
  qry.FieldByName('TERCQUA_R').AsString := lstSalReal.Items[IND];
  qry.FieldByName('MEDIA_R').Value := TotReal / TotFreq;
  qry.FieldByName('MODA_R').Value := ModaReal;
  qry.FieldByName('MAIOR_R').AsString := lstSalReal.Items[lstSalReal.Items.Count - 1];
  if bFazEditPost then qry.Post;
end;

procedure TfrmCadPesqEmpr.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;

  inherited;
end;

procedure TfrmCadPesqEmpr.dblcPesquisaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) then
     qry.FieldByName('DATAREFPESQ').Value := qryPesqui.FieldByName('DATAREFPESQ').Value;
end;

procedure TfrmCadPesqEmpr.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  gbxPesquisa.Enabled := False;
end;

procedure TfrmCadPesqEmpr.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  gbxPesquisa.Enabled := True;
end;

end.
