unit FObservacao;


{***************************************************************************************
Alteração   : criação do form
Pendência   : SIG 27469
Data        : 29/06/2017
Responsável : Edilaine
Descrição   : alteração de valores na interface de previa para usuários responsáveis pelo
              processamento da Folha
***************************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmObservacao = class(TfrmOkCancelar)
    lblCaption: TLabel;
    pnlObs: TPanel;
    mmoObs: TMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sObservacao : string;
  public
    { Public declarations }
  end;

var
  FrmObservacao: TFrmObservacao;

  function InsereObservacao(var mModalResult : TModalResult;
                            sTitJanela, sTitLabel : string;
                            const iTamanho : Integer = -1) : string;


implementation

uses UMensErro, UAdmPrev;

{$R *.DFM}

function InsereObservacao(var mModalResult : TModalResult;
                          sTitJanela, sTitLabel : string;
                          const iTamanho : Integer) : string;
begin
   FrmObservacao := TFrmObservacao.Create(Application);
   with FrmObservacao do
   begin
      sObservacao := '';

      Caption := sTitJanela;
      lblCaption.Caption := sTitLabel;
      
      if iTamanho > 0 then
         mmoObs.MaxLength := iTamanho;

      ShowModal;

      Result := sObservacao;
      mModalResult := ModalResult;
   end;
   FrmObservacao.Free;
end;


procedure TFrmObservacao.bbtnConfirmarClick(Sender: TObject);
begin
  sObservacao := mmoObs.text;

  inherited;
end;

procedure TFrmObservacao.FormShow(Sender: TObject);
begin
  inherited;
  mmoObs.setfocus;
end;

end.
