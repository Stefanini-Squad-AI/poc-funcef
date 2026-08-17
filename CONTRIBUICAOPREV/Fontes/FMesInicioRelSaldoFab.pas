//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************
//***************************************************************************************
//Nº SOL:            253577-17564
//Nº KINTANA         987196
//Data da Alteração: 29/07/2015
//Alteração Form:    Criação do form
//Responsável:       Edilaine Ferraresi
//Descrição:         Ajustes para Equacionamento do Deficit
//**************************************************************************************

unit FMesInicioRelSaldoFab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, UMensErro, TREdit, FPreview, Mask;


type
  TfrmMesInicioRelSaldoFab = class(TfrmOkCancelar)
    Label2: TLabel;
    edMesRef: TMaskEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);

  private
    FsMesReferencia: string;
    procedure SetsMesReferencia(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property sMesReferencia : string read FsMesReferencia write SetsMesReferencia;
  end;

var
  frmMesInicioRelSaldoFab: TfrmMesInicioRelSaldoFab;

implementation


{$R *.DFM}



procedure TfrmMesInicioRelSaldoFab.bbtnConfirmarClick(Sender: TObject);
begin

  if Trim(edMesRef.Text) = '/' then
  begin
    MsgDlg('Para geração do relatório Saldo FAB é necessário infromar o mês de referência.','Atenção',mtInformation,[mbOk],0);
    edMesRef.Setfocus;
    exit;
  end;

  sMesReferencia := edMesRef.Text;

  Close;

end;

procedure TfrmMesInicioRelSaldoFab.FormShow(Sender: TObject);
begin
  inherited;
  edMesRef.Setfocus;
end;

procedure TfrmMesInicioRelSaldoFab.SetsMesReferencia(const Value: string);
begin
  FsMesReferencia := Value;
end;

procedure TfrmMesInicioRelSaldoFab.bbtnSairClick(Sender: TObject);
begin
  inherited;
  sMesReferencia := '';
end;

end.

