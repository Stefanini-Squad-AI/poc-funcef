unit FCadRateio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, wwdblook, Wwquery, TB97,
  TB97Ctls, TB97Tlbr, wwdbedit, CMTree, IvDictio, IvMulti, IvEMulti,
  TREdit, TEdNum, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadRateio = class(TfrmCadastroGrid)
    ds2: TwwDataSource;
    gbxGrupoFunc: TGroupBox;
    tblRateio: TwwTable;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    dblcEntid: TwwDBLookupCombo;
    qryEstab: TwwQuery;
    dbspeAno: TwwDBSpinEdit;
    Label3: TLabel;
    dbedDataBase: TCMDateTimePicker;
    Label2: TLabel;
    qryEntid: TwwQuery;
    dbrgTipoRateio: TDBRadioGroup;
    pnlData: TPanel;
    Label6: TLabel;
    dbedPerc1: TDBRealEdit;
    Label4: TLabel;
    dbedPerc2: TDBRealEdit;
    Label5: TLabel;
    pnlValor: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedPerc1V: TDBRealEdit;
    dbedPerc2V: TDBRealEdit;
    dbedVal1: TDBRealEdit;
    dbedVal2: TDBRealEdit;
    dbedVal3: TDBRealEdit;
    dbedVal4: TDBRealEdit;
    dbedPerc3V: TDBRealEdit;
    dbedPerc4V: TDBRealEdit;
    dbedVal5: TDBRealEdit;
    dbedPerc5V: TDBRealEdit;
    Shape1: TShape;
    Label10: TLabel;
    MontaSelect: TMontaSelect;
    Label11: TLabel;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblRateioAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tblRateioAfterScroll(DataSet: TDataSet);
    procedure qryEstabAfterScroll(DataSet: TDataSet);
    procedure dbrgTipoRateioChange(Sender: TObject);
    procedure tblRateioBeforeInsert(DataSet: TDataSet);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRateio: TfrmCadRateio;
  JaTem : Boolean;
implementation

uses UMensErro, uSistema{, uModulo};

{$R *.DFM}




procedure TfrmCadRateio.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.Down := False;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')
  then qryEstab.Locate('IDFILIALPESSOA',StrToFloat(MontaSelect.ValoresChave[0]),[]);
  qryEstabAfterScroll(ds2.DataSet);
end;

procedure TfrmCadRateio.FormCreate(Sender: TObject);
begin
  qryEstab.ParamByName('IdEmpresa').AsInteger := Sistema.IdEmpresa;
  qryEstab.Open;

  inherited;
  if not tblRateio.Active then
     tblRateio.Open;

  qryEntid.Open;
  qryEstabAfterScroll(ds2.DataSet);
end;


procedure TfrmCadRateio.tblRateioAfterInsert(DataSet: TDataSet);
begin
  if  JaTem  then begin
      MsgDlg('Apenas Uma Informação de Reateio por Estabelecimento é Permitida',
             'Aviso',mtInformation,[mbOK],0);
      bbtnCancelarClick(Self);
      Exit;
  end;
  inherited;
  tblRateio.FieldByName('IDFILIALPESSOA').Value := qryEstab.FieldByName('IDFILIALPESSOA').Value;
  tblRateio.FieldByName('TIPORATEIO').AsInteger := 0;
  dbrgTipoRateio.ItemIndex := 0;
  tblRateio.FieldByName('PERIODO').AsInteger := 60;
end;

procedure TfrmCadRateio.bbtnConfirmarClick(Sender: TObject);
begin

      if dbedDataBase.Text = '' then
        begin
          MsgDlg('Informe a Data de Cisão ou Incorporação','Aviso',mtInformation,[mbOK],0);
          dbedDataBase.SetFocus;
          Exit;
        end;

      inherited; //codigo antes deste comando

end;

procedure TfrmCadRateio.tblRateioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dbrgTipoRateioChange(Self);
end;

procedure TfrmCadRateio.qryEstabAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sbtnAlterar.Enabled := not tblRateio.Eof;
  sbtnApagar.Enabled  := not tblRateio.Eof;
  dbrgTipoRateioChange(Self);
end;

procedure TfrmCadRateio.dbrgTipoRateioChange(Sender: TObject);
begin
  inherited;
  if  dbrgTipoRateio.ItemIndex = 0  then  pnlData.BringToFront
  else  pnlValor.BringToFront;
end;

procedure TfrmCadRateio.tblRateioBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  JaTem := not tblRateio.Eof;
end;

end.
