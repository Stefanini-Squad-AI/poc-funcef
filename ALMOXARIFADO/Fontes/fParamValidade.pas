unit fParamValidade;

interface
       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti;

type
  TfrmParamValidade = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    Label3: TLabel;
    dblkcmbAlmox: TwwDBLookupCombo;
    Label4: TLabel;
    qryAlmox: TwwQuery;
    rgrpOpcao: TRadioGroup;
    ChkSaldoZero: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamValidade: TfrmParamValidade;
implementation

uses DRelatoriosAlmox, uSistema;

{$R *.DFM}

procedure TfrmParamValidade.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosAlmox.qryValidade.Close;
  dtmRelatoriosAlmox.qryValidade.Sql.Text :=
' SELECT '+
'   AL.DESCALMOX AS ALMOXARIFADO, '+
'   AR.CODARTIGO, '+
'   PR.DESCPROD ||'' ''|| RTRIM(AR.CODCOR,'' '') ||'' ''|| RTRIM(AR.CODTAMANHO,'' '') AS PRODUTO, '+
'   L.DATAVALIDADE, '+
'   L.SALDOLOTE '+
' FROM ALMOX AL, ARTIGO AR, PRODUTO PR, LOTEVALI L '+
' WHERE '+
'       (AL.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
'   AND (L.DATAVALIDADE >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))'+
'   AND (L.DATAVALIDADE <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY''))';
    if Trim(dblkcmbAlmox.text ) <> '' then
       dtmRelatoriosAlmox.qryValidade.SQL.add(' AND AL.CODALMOXARIFADO = ' + dblkcmbAlmox.LookupValue );
IF Not ChkSaldoZero.Checked Then
   dtmRelatoriosAlmox.qryValidade.SQL.add(' AND (L.SALDOLOTE > 0)');
  dtmRelatoriosAlmox.qryValidade.SQL.add(
'   AND (AR.FLGATIVO = ''S'' ) '+
'   AND (AL.CODALMOXARIFADO = L.CODALMOXARIFADO) '+
'   AND (L.CODARTIGO = AR.CODARTIGO) '+
'   AND (AR.CODPRODUTO = PR.CODPRODUTO) ');
   case rgrpOpcao.ItemIndex of
       0 : dtmRelatoriosAlmox.qryValidade.SQL.add(' ORDER BY ALMOXARIFADO, DATAVALIDADE, PRODUTO ');
       1 : dtmRelatoriosAlmox.qryValidade.SQL.add(' ORDER BY DATAVALIDADE, ALMOXARIFADO, PRODUTO ');
   end;
  dtmRelatoriosAlmox.lblDataValidade.caption := deDataInicial.Text+ ' à ' + deDataFinal.Text;
  dtmRelatoriosAlmox.lblOpcao.caption := rgrpOpcao.Items.strings[rgrpOpcao.itemindex];
end;

procedure TfrmParamValidade.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);

end;

procedure TfrmParamValidade.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.ParamByName('Pessoa').AsInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
end;

end.
