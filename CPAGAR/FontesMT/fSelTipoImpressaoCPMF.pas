unit fSelTipoImpressaoCPMF;

{ --------------------------------------------------------------------------------------------------
Autor     : Alex Pererira
Data      : 24/08/2004
Pendência : 17419
Descrição : Implementar relatóirio para verificar os relatórios que não
            calcularam CPMF
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FConciliaCPMFMT, ppTypes;

type
  TFrmSelTipoImpressaoCPMF = class(TfrmOkCancelar)
    RgTipoRelat: TRadioGroup;
    RgSaidaRelat: TRadioGroup;
    CkbRateio: TCheckBox;
    Bevel1: TBevel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrmSelTipoImpressaoCPMF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If RgSaidaRelat.ItemIndex = 0 Then
     FrmConciliaCPMFMT.ConciliaCPMF.DtmConciliaCPMFMT.RptConciliaCpmf.Device := DvScreen
  Else
     FrmConciliaCPMFMT.ConciliaCPMF.DtmConciliaCPMFMT.RptConciliaCpmf.Device := DvPrinter;

  Case RgTipoRelat.ItemIndex of
     0: FrmConciliaCPMFMT.TipoRelatCPMF := trSintetico;
     1: FrmConciliaCPMFMT.TipoRelatCPMF := trAnalitico;
     2: FrmConciliaCPMFMT.TipoRelatCPMF := trAnaliticoInconsistente;
     3: FrmConciliaCPMFMT.TipoRelatCPMF := trAnaliticoPorData;
     4: FrmConciliaCPMFMT.TipoRelatCPMF := trFaltamRelacionamentos;
  End;

  FrmConciliaCPMFMT.ImprimeRateio := CkbRateio.Checked;
end;

end.
