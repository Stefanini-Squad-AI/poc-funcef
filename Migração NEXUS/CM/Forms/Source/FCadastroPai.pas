unit FCadastroPai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ImgList, Db, Wwdatsrc, TB97Ctls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ActnList,
  CmEventosCadastro, Gauges, ComCtrls, fcLabel;

type
  TfrmCadastroPai = class(TfrmOkCancelar)
    ds: TwwDataSource;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    ImlPadrao: TImageList;
    CmeCadastro: TCmEventosCadastro;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }

  protected

  public
    
  end;

var
  frmCadastroPai: TfrmCadastroPai;

implementation


{$R *.DFM}


{ TfrmCadastroPai }


procedure TfrmCadastroPai.FormCreate(Sender: TObject);
begin
  inherited;
  CmeCadastro.OpenDataSetByTag;
end;

end.

