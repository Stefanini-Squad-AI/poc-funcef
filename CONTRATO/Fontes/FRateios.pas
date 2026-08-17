unit FRateios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery;

type
  TfrmRateios = class(TfrmOkCancelar)
    dbgRateioDiferenciado: TwwDBGrid;
    Panel1: TPanel;
    rgpTipoRateio: TRadioGroup;
    edItem: TEdit;
    edObjeto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edQtdeTotal: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edValorTotal: TEdit;
    Label5: TLabel;
    edQtdeNaoRateada: TEdit;
    Label6: TLabel;
    edPercNaoRateado: TEdit;
    qryRateioCCDif: TwwQuery;
    qryRateioCCDifCODCENTROCUSTO: TStringField;
    qryRateioCCDifIDEMPRESA: TFloatField;
    qryRateioCCDifPERCRATEIOCONTR: TFloatField;
    qryRateioCCDifNOME: TStringField;
    qryRateioCCDifDIVISOR: TFloatField;
    upRateioCCDif: TUpdateSQL;
    dsRateioCCDif: TDataSource;
    qryRateioCCDifIDITEM: TFloatField;
    qryRateioCCDifIDOBJETO: TFloatField;
    qryRateioCCDifIDPROGRAMA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure rgpTipoRateioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryRateioCCDifBeforeInsert(DataSet: TDataSet);
    procedure qryRateioCCDifAfterPost(DataSet: TDataSet);
    procedure dbgRateioDiferenciadoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
  private
    { Private declarations }
    MudandoTipoRateio   : Boolean;
    function TestaRateio: Real;
  public
    { Public declarations }
  end;

var
  frmRateios: TfrmRateios;

implementation

uses FMedicao,uMensErro;

{$R *.DFM}

procedure TfrmRateios.FormCreate(Sender: TObject);
begin
   MudandoTipoRateio:=False;
   inherited;
   with FrmMedicao do
   begin
      edItem.Text:=dblcItem.Text;
      edObjeto.Text:=dblcObjeto.Text;
      edQtdeTotal.Text:=FormatFloat('000,00',qryDetQTDEMEDICAO.AsFloat);
      edValorTotal.Text:=FormatFloat('#,##0.00',qryDetVALORMEDICAO.AsFloat);
      qryRateioCCDif.Close;
      qryRateioCCDif.ParamByName('IDCONTRATO').AsInteger := qryDadosContratoIDCONTRATO.AsInteger;
      qryRateioCCDif.ParamByName('IDITEM').AsInteger     := qryDadosContratoIDITEM.AsInteger;
      qryRateioCCDif.ParamByName('IDOBJETO').AsInteger   := qryDadosContratoIDOBJETO.AsInteger;
      qryRateioCCDif.Open;
   end;
end;

procedure TfrmRateios.rgpTipoRateioClick(Sender: TObject);
begin
   MudandoTipoRateio:=True;
   try
      qryRateioCCDif.First;
      while not(qryRateioCCDif.Eof) do
      begin
         qryRateioCCDif.Edit;

         if rgpTipoRateio.ItemIndex=0 then
           qryRateioCCDifDIVISOR.AsFloat:=100
         else
           qryRateioCCDifDIVISOR.AsFloat:=1;

         qryRateioCCDif.Post;
         qryRateioCCDif.Next;
      end;
   finally
      MudandoTipoRateio:=False;
      qryRateioCCDifAfterPost(nil);
   end;
   qryRateioCCDif.First;   
end;

procedure TfrmRateios.bbtnConfirmarClick(Sender: TObject);
begin
   if TestaRateio=0 then
    begin
       // Exclui Todos os Registros do Rateio da Tela de Medição
       FrmMedicao.qryRateioCC.First;
       while not(FrmMedicao.qryRateioCC.Eof) do
       begin
          FrmMedicao.qryRateioCC.Delete;
       end;

       // Copia os Valores do Rateio Diferenciado para o Rateio da Tela de Medição
       qryRateioCCDif.First;
       while not(qryRateioCCDif.Eof) do
       begin
          FrmMedicao.qryRateioCC.Append;
          FrmMedicao.qryRateioCCCODCENTROCUSTO.Value:=qryRateioCCDifCODCENTROCUSTO.Value;
          FrmMedicao.qryRateioCCIDEMPRESA.Value:=qryRateioCCDifIDEMPRESA.Value;
          FrmMedicao.qryRateioCCPERCRATEIOCONTR.Value:=qryRateioCCDifPERCRATEIOCONTR.Value;
          FrmMedicao.qryRateioCCDIVISOR.Value:=qryRateioCCDifDIVISOR.Value;
          FrmMedicao.qryRateioCCIDITEM.Value:=qryRateioCCDifIDITEM.Value;
          FrmMedicao.qryRateioCCIDOBJETO.Value:=qryRateioCCDifIDOBJETO.Value;
          FrmMedicao.qryRateioCCIDPROGRAMA.Value:=qryRateioCCDifIDPROGRAMA.Value;          
          FrmMedicao.qryRateioCC.Post;
          qryRateioCCDif.Next;
       end;

       inherited;
    end
   else
      if rgpTipoRateio.ItemIndex=0 then
         MsgDlg('A soma dos Rateios não pode ser diferente de 100','Erro',mtError,[mbOk],0)
      else
         MsgDlg('A soma dos Rateios não pode ser diferente de'+
                edQtdeTotal.Text,'Erro',mtError,[mbOk],0)      
end;

function TfrmRateios.TestaRateio: Real;
begin
   Result:=100;
   if rgpTipoRateio.ItemIndex=1 then Result:=FrmMedicao.qryDetQTDEMEDICAO.Value;

   qryRateioCCDif.First;
   while not(qryRateioCCDif.Eof) do
   begin
      Result:=Result-qryRateioCCDifPERCRATEIOCONTR.Value;
      qryRateioCCDif.Next;
   end;
   qryRateioCCDif.First;
end;

procedure TfrmRateios.qryRateioCCDifBeforeInsert(DataSet: TDataSet);
begin
   Abort;
end;

procedure TfrmRateios.qryRateioCCDifAfterPost(DataSet: TDataSet);
begin
   if MudandoTipoRateio then Exit;
   if rgpTipoRateio.ItemIndex=0 then
    begin
       edPercNaoRateado.Text:=FormatFloat('0.00',TestaRateio);
       edQtdeNaoRateada.Text:='0';
    end
   else
    begin
       edPercNaoRateado.Text:='0';
       edQtdeNaoRateada.Text:=FloatToStr(TestaRateio);
    end;
end;

procedure TfrmRateios.dbgRateioDiferenciadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   if (Field.FieldName='CODCENTROCUSTO') or (Field.FieldName='NOME') then ABrush.Color:=clBtnFace;
end;

end.
