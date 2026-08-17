unit CRelSaldoXCustoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Wwdbspin, Pptypes, ppPrvDlg, ppforms, CRel,
  StdCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelSaldoXCustoContabil = class(TcfgRel)
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edtDataContabil: TCMDateTimePicker;

    // procedimentos definidos

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  cfgRelSaldoXCustoContabil: TcfgRelSaldoXCustoContabil;



implementation
{$R *.DFM}
uses
   uSistema, uModulo, uMensErro, uComunsImobiliario, uVerificaPreenchimento, dRelInvestImob, uFuncoesImob;



procedure TcfgRelSaldoXCustoContabil.bbtnConfirmarClick(Sender: TObject);
begin
   try
      if length(trim(edtDataContabil.Text)) > 0 then begin

         dtmRelInvestImob.dDataCustoContabil := edtDataContabil.Date;

         with dtmRelInvestImob.qrySaldoInvestXCustoContabil do begin
            LimpaParametros(dtmRelInvestImob.qrySaldoInvestXCustoContabil);
            ParamByName('PDATAMOV').asDateTime  := edtDataContabil.Date;
            ParamByName('PIDMODULO').asInteger  := Sistema.idModulo;
            ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;
            Open;
         end;

         inherited;

         dtmRelInvestImob.qrySaldoInvestXCustoContabil.Open;
         dtmRelInvestImob.rptSaldoInvestXCustoContabil.Print;
         dtmRelInvestImob.qrySaldoInvestXCustoContabil.Close;

      end;

   finally

      bbtnConfirmar.Enabled   := True;
      bbtnCancelar.Enabled    := True;
      bbtnSair.Enabled        := True;

      Screen.Cursor           := crDefault;

   end;
end;



procedure TcfgRelSaldoXCustoContabil.FormShow(Sender: TObject);
begin
   inherited;
   edtDataContabil.Date := Date;
end;



procedure TcfgRelSaldoXCustoContabil.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



end.
