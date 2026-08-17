unit FCadSaldoAnterioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  Mask, wwdblook;

type
  TfrmCadSaldoAnteriorMT = class(TFrmCadastroMT)
    dblkExercicio: TwwDBLookupCombo;
    Label8: TLabel;
    mskConta: TMaskEdit;
    Label12: TLabel;
    edtNomeConta: TEdit;
    btnConta: TBitBtn;
    dblkCCusto: TwwDBLookupCombo;
    Label15: TLabel;
    mskSubConta: TMaskEdit;
    Label16: TLabel;
    edtNomeSubConta: TEdit;
    btnSubConta: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskUnidNegoc: TMaskEdit;
    Label1: TLabel;
    edtNomeAtivProj: TEdit;
    btnAtivProj: TBitBtn;
    btnSeleciona: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    sbtnCreditoCorrente: TSpeedButton;
    sbtnDebitoCorrente: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sbtnCreditoOficial: TSpeedButton;
    sbtnDebitoOficial: TSpeedButton;
    sbtnCreditoHistorico: TSpeedButton;
    sbtnDebitoHistorico: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sbtnCreditoGer1: TSpeedButton;
    sbtnDebitoGer1: TSpeedButton;
    sbtnCreditoGer2: TSpeedButton;
    sbtnDebitoGer2: TSpeedButton;
    sbtnCreditoGer3: TSpeedButton;
    sbtnDebitoGer3: TSpeedButton;
    redSaldoCorrente: TRealEdit;
    redSaldoOficial: TRealEdit;
    redSaldoHistorico: TRealEdit;
    redSaldoGer3: TRealEdit;
    redSaldoGer2: TRealEdit;
    redSaldoGer1: TRealEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSaldoAnteriorMT: TfrmCadSaldoAnteriorMT;

implementation

{$R *.DFM}

end.
