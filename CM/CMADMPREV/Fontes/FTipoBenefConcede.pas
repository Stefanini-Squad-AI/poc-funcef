{-----------------------------------------------------------------------------------------------------------------------------------
Rotina.....: (.dfm) Alterado o caption do item 2 no .dfm
Nº SIG.....: 20491
Data merge : 24/06/2022
Inicio dev : 27/02/2018
Responsável: Darivaldo Alencar
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
-----------------------------------------------------------------------------------------------------------------------------------}

unit FTipoBenefConcede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmTipoBenefConcede = class(TfrmOkCancelar)
    rgrpTipo: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cTipoBeneficio : char; //P - Participante, B - Beneficiario , C - cancelar , S - Sair
  end;

var
  frmTipoBenefConcede: TfrmTipoBenefConcede;

implementation

{$R *.DFM}

procedure TfrmTipoBenefConcede.FormShow(Sender: TObject);
begin
  inherited;
  cTipoBeneficio := 'P';
end;

procedure TfrmTipoBenefConcede.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  case rgrpTipo.ItemIndex of
       0 : cTipoBeneficio := 'P';
       1 : cTipoBeneficio := 'B';
       2 : cTipoBeneficio := 'D';
       else cTipoBeneficio := 'C';
  end;

end;

procedure TfrmTipoBenefConcede.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cTipoBeneficio := 'C';
end;

procedure TfrmTipoBenefConcede.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmTipoBenefConcede.bbtnSairClick(Sender: TObject);
begin
  inherited;
  cTipoBeneficio := 'S';
end;

end.
