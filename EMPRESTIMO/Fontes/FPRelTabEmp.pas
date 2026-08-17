unit FPRelTabEmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, StdCtrls, Machklb, MAHlpBtn, Buttons, {cmRepBtn,} ExtCtrls,
  checklst, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmPRelTabEmp = class(TCMParamRel)
    Label1: TLabel;
    TabSheet1: TTabSheet;
    rgTabelas: TRadioGroup;
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelTabEmp: TfrmPRelTabEmp;

implementation

{
uses FRelSTabEmp, FRelTpContr;
}
{$R *.DFM}


procedure TfrmPRelTabEmp.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRelTabEmp.rbtnVisualizarClick(Sender: TObject);
var
 varSql : string;
begin
  inherited;
{
  frmRelSTabEmp := TfrmRelSTabEmp.Create(Self);
  frmRelTpContr := TfrmRelTpContr.Create(Self);

  case rgTabelas.ItemIndex of
  0 :begin
       Varsql := 'Select  A.DESCTIPOEMPTMO, B.NOMEREGRA '+
                 'From TIPOEMPTMO A, REGRA B '+
                 'Where A.IDREGRAELEGIB = B.IDREGRA(+) '+
                 'Order by A.DESCTIPOEMPTMO ';
       frmRelSTabEmp.wwQuery1.Sql.Add(Varsql);
       frmRelSTabEmp.qrlblTitRel.Caption := 'Relação de Tipos de Emprestimo';
       frmRelSTabEmp.QRLabel4.Caption  := 'Tipo de Empréstimo';
       frmRelSTabEmp.Coluna2.Caption   := 'Regra';
       frmRelSTabEmp.Coluna3.Caption   := '';
       frmRelSTabEmp.QRDBText1.DataField := 'DESCTIPOEMPTMO';
       frmRelSTabEmp.Coluna2.DataField := 'NOMEREGRA';
       frmRelSTabEmp.Coluna3.DataField := '';
       frmRelSTabEmp.Coluna3.Visible := False;
       frmRelSTabEmp.wwQuery1.Open;
       frmRelSTabEmp.qr.Preview;
     end;
  1 :begin
       frmRelTpContr.qryTpContrato.Open;
       frmRelTpContr.qryItensRec.Open;
       frmRelTpContr.qryItensDesp.Open;
       frmRelTpContr.qr.Preview;
      end;
  2 :begin
       Varsql := 'Select A.DESCRENEG, B.NOMEREGRA '+
                 'From TIPORENEG A, REGRA B '+
                 'Where A.IDREGRARENEG = B.IDREGRA(+) '+
                 'Order by A.DESCRENEG';
       frmRelSTabEmp.wwQuery1.Sql.Add(Varsql);
       frmRelSTabEmp.qrlblTitRel.Caption := 'Relação de Tipos de Renegociação';
       frmRelSTabEmp.QRLabel4.Caption := 'Tipo de Renegociação';
       frmRelSTabEmp.Coluna2.Caption   := 'Regra';
       frmRelSTabEmp.Coluna3.Caption   := '';
       frmRelSTabEmp.QRDBText1.DataField := 'DESCRENEG';
       frmRelSTabEmp.Coluna2.DataField := 'NOMEREGRA';
       frmRelSTabEmp.Coluna3.DataField := '';
       frmRelSTabEmp.Coluna3.Visible := False;
       frmRelSTabEmp.wwQuery1.Open;
       frmRelSTabEmp.qr.Preview;
      end;
  3 :begin
       Varsql := 'Select IteDescricao, CONTROLASALDO '+
                 'From ItemEmptmo '+
                 'Order by IteDescricao ';
       frmRelSTabEmp.wwQuery1.Sql.Add(Varsql);
       frmRelSTabEmp.qrlblTitRel.Caption := 'Relação de Itens de Recebimento de Crédito Mútuo';
       frmRelSTabEmp.QRLabel4.Caption := 'Item de Recebimento';
       frmRelSTabEmp.Coluna2.Caption  := 'Controle de Saldo';
       frmRelSTabEmp.Coluna3.Caption   := '';
       frmRelSTabEmp.QRDBText1.DataField := 'IteDescricao';
       frmRelSTabEmp.Coluna2.DataField := 'CONTROLASALDO';
       frmRelSTabEmp.Coluna3.DataField := '';
       frmRelSTabEmp.Coluna3.Visible := False;
       frmRelSTabEmp.wwQuery1.Open;
       frmRelSTabEmp.qr.Preview;
      end;
  4 :begin
       Varsql := 'Select NOMEITEMDESP From ITEMDESPCRED '+
                 'Order by NOMEITEMDESP';
       frmRelSTabEmp.wwQuery1.Sql.Add(Varsql);
       frmRelSTabEmp.qrlblTitRel.Caption := 'Relação de Itens de Despesa de Crédito Mútuo';
       frmRelSTabEmp.QRLabel4.Caption := 'Item de Despesa';
       frmRelSTabEmp.Coluna2.Caption   := '';
       frmRelSTabEmp.Coluna3.Caption   := '';
       frmRelSTabEmp.QRDBText1.DataField := 'NOMEITEMDESP';
       frmRelSTabEmp.Coluna2.DataField := '';
       frmRelSTabEmp.Coluna3.DataField := '';
       frmRelSTabEmp.Coluna2.Visible := False;
       frmRelSTabEmp.Coluna3.Visible := False;
       frmRelSTabEmp.wwQuery1.Open;
       frmRelSTabEmp.qr.Preview;
      end;
    end;
}    
end;



end.

