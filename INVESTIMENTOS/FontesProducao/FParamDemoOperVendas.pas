unit FParamDemoOperVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery, UOperacaoInvest, FAguarde;

type
  TfrmParamDemoOperVendas = class(TfrmOkCancelar)
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdInicio: TCMDateTimePicker;
    dbdFim: TCMDateTimePicker;
    DblInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDemoOperVendas: TfrmParamDemoOperVendas;
  fVrlRendimento : Double;

implementation

uses FDmRelatorio, UImpostos, uOperComum, fPreview, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmParamDemoOperVendas.FormShow(Sender: TObject);
begin
  inherited;
   QryCarteira.Open;
   QryInvestimento.Open;
   dbdInicio.Date := pRPI.DATAULTFECH;
   dbdFim.Date    := pRPI.DATAULTFECH;
end;

procedure TfrmParamDemoOperVendas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   With DtmRelatorio Do
   Begin
      //Fecha a query e limpa os parametros
      OperComum.LimpaParametros(DtmRelatorio.QryDemoOpVd);

      If Trim(DblInvestimento.Text) <> '' Then
         QryDemoOpVd.ParamByName('IDINVESTIMENTO').AsInteger :=
                            qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

      QryDemoOpVd.ParamByName('IDCARTEIRAINVEST').AsInteger  :=
                            QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

      QryDemoOpVd.ParamByName('DATAINI').AsString          := dbdInicio.Text;
      QryDemoOpVd.ParamByName('DATAFIM').AsString          := dbdFim.Text;
      QryDemoOpVd.Open;
      QryDemoOpVd.First;
      If QryDemoOpVd.RecordCount > 0 Then
      Begin
         frmAguarde.Pos := 0;
         frmAguarde.Max := QryDemoOpVd.RecordCount;
         frmAguarde.Mostra('Aguarde - Processando !');
      End;
      While Not QryDemoOpVd.Eof Do
      Begin
          QryDemoOpVd.Edit;
          fVrlRendimento := 0;
          QryDemoOpVd.FieldByName('VLRIR').AsFloat :=
          Impostos.CalculaIr(2,
                    QryDemoOpVd.FieldByName('IDINVESTIMENTO').AsInteger, 0{CARTEIRAGERENC},
                    QryDemoOpVd.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    QryDemoOpVd.FieldByName('IDTIPOOPERACAO').AsInteger,
                    QryDemoOpVd.FieldByName('IDMERCADO').AsInteger,
                    '',
                    QryDemoOpVd.FieldByName('DATAMOVCARTINV').AsDateTime,
                    QryDemoOpVd.FieldByName('DATAMOVCARTINV').AsDateTime,
                    QryDemoOpVd.FieldByName('VALCUSTO').AsFloat,
                    QryDemoOpVd.FieldByName('VLRMOVCARTINV').AsFloat-QryDemoOpVd.FieldByName('TOTALDESPESAS').AsFloat, 0, 'S',
                    QryDemoOpVd.FieldByName('FLGTRATAIR').AsString,
                    fVrlRendimento);
         QryDemoOpVd.Post;
         QryDemoOpVd.Next;
         frmAguarde.Pos := frmAguarde.Pos + 1;
      End;
      If QryDemoOpVd.RecordCount > 0 Then
         frmAguarde.Apaga;
      ppDataIni.Caption := dbdInicio.Text;
      ppDataFim.Caption := dbdFim.Text;
      ppCarteira.Caption:= dblCarteira.Text;

      TFrmPreview.CreateModalPreview(Application,
                                     DtmRelatorio.RpDemoOpVd,
                                     DtmRelatorio.RpDemoOpVd.PrinterSetup.DocumentName);

   End;
end;

end.
