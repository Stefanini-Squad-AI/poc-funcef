unit fColetaSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT, Db,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, uCtrlColetaSal;

type
  TfrmColetaSal = class(TfrmSelPessoalMT)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlColetaSal: TCtrlColetaSal;
  public
    ListaQuantSal, ListaSalNominal, ListaSalReal: string;
  end;

var
  frmColetaSal: TfrmColetaSal;

implementation

uses uCtrlFuncoesRH, uCtrlPadroes, fAguarde;

{$R *.DFM}

procedure TfrmColetaSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlColetaSal := TCtrlColetaSal.Create;
  CtrlColetaSal.InitializeAs(Padroes);

  rgSequencia.Visible := false;
  cbxCandidatos.Enabled := false;
  rgSelCargo.ItemIndex := 1;
  rgSelCargo.Enabled := false;
  IrPaginaResult := false;
end;

procedure TfrmColetaSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlColetaSal);
  inherited;
end;

procedure TfrmColetaSal.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Coletando Dados para a Pesquisa...');
  inherited;
  frmAguarde.Update;
  CtrlColetaSal.ColetarDados(CdsPrincipal.Data);
  frmAguarde.Update;
  ListaQuantSal := CtrlColetaSal.ListaQuantSal.Text;
  ListaSalNominal := CtrlColetaSal.ListaSalNominal.Text;
  ListaSalReal := CtrlColetaSal.ListaSalReal.Text;
  frmAguarde.Apaga;
end;

end.
