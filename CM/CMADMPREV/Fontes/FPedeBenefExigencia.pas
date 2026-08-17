unit FPedeBenefExigencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmPedeBenefExigencia = class(TfrmOkCancelar)
    rgrpModoConcessao: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cModoConcessao : char;  
  end;

var
  frmPedeBenefExigencia: TfrmPedeBenefExigencia;

implementation

{$R *.DFM}

procedure TfrmPedeBenefExigencia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Modos de Concessao = N - concedido Normal
  //                      E - concedido em Exigencia
  //                      P - manter Pendente
  //                      C - nao conceder (Cancelar requerimento)
  if rgrpModoConcessao.ItemIndex = 0
  then cModoConcessao := 'N' // Normal
  else if rgrpModoConcessao.ItemIndex = 1
       then cModoConcessao := 'E' // Exigencia
       else if rgrpModoConcessao.ItemIndex = 2
            then cModoConcessao := 'P' // Pendente
            else cModoConcessao := 'C'; // Cancelar

end;

procedure TfrmPedeBenefExigencia.FormShow(Sender: TObject);
begin
  inherited;
  cModoConcessao := 'P';
end;

procedure TfrmPedeBenefExigencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmPedeBenefExigencia.bbtnCancelarClick(Sender: TObject);
begin 
  inherited;
  cModoConcessao := 'P' // Pendente
end;

procedure TfrmPedeBenefExigencia.bbtnSairClick(Sender: TObject);
begin
  inherited;
  cModoConcessao := 'S' // Sair
end;

end.
