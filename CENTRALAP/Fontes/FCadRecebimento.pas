(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit FCadRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, wwdbedit, Mask, Wwdbspin, StdCtrls, ExtCtrls, DBCtrls,
  ComCtrls, wwriched, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList;

type
  TFrmCadTpRecebXCancelamento = class(TFrmCadastroGridCS)
    Label2: TLabel;
    RgTipo: TDBRadioGroup;
    EdtDesc: TwwDBEdit;
    MemMensagem: TDBMemo;
    qryIDCANCELAMENTO: TFloatField;
    qryDESCRICAO: TStringField;
    qryMENSAGEM: TMemoField;
    qrySTATUSRECEBIMENTO: TFloatField;
    qryTIPOOPERACAO: TFloatField;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTpRecebXCancelamento: TFrmCadTpRecebXCancelamento;

implementation

Uses UDataBase, FPrincipal ;
{$R *.DFM}

procedure TFrmCadTpRecebXCancelamento.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If EdtDesc.CanFocus Then EdtDesc.SetFocus;
  qry.FieldByName('IDCANCELAMENTO').AsInteger := LeUltRegistro(nil,'TPCANCELAMENTO');
  qry.FieldByName('TIPOOPERACAO').AsInteger := 0;
end;

procedure TFrmCadTpRecebXCancelamento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If EdtDesc.CanFocus Then EdtDesc.SetFocus;
end;   

procedure TFrmCadTpRecebXCancelamento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     qry.Locate('idcancelamento',MontaSelect.ValoresChave[0],[]);
  end;
end;


end.
