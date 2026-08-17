unit cRelListagemProposta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelListagemProposta = class(TcfgRel)
    Label1: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MontaQuery; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelListagemProposta: TcfgRelListagemProposta;

implementation

{$R *.DFM}

uses dLookImobiliario, dRelAdminImob, uSistema, uFuncoesImob;

procedure TcfgRelListagemProposta.FormCreate(Sender: TObject);
begin
   inherited;
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;

procedure TcfgRelListagemProposta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   dtmLookImobiliario.qryLookTipoImovel.Close;
end;

procedure TcfgRelListagemProposta.MontaQuery;
begin
   with dtmRelAdminImob do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoLstPropostas.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoLstPropostas.Picture := nil;

      LimpaParametros(qryListagemProposta);

      if DBcboTipoImovel.Text <> '' then begin
         rptListagemProposta_lblSegmento.Text := DBcboTipoImovel.Text;
         qryListagemProposta.ParamByName('PCODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;
      end else begin
         rptListagemProposta_lblSegmento.Text := '< Todos >';
      end;

      if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
         qryListagemProposta.ParamByName('PDATAINI').AsDate := edtDataIni.Date;
         qryListagemProposta.ParamByName('PDATAFIM').AsDate := edtDataFim.Date;
         rptListagemProposta_lblData.Text := edtDataIni.Text + ' a ' + edtDataFim.Text;
      end else begin
         rptListagemProposta_lblData.Text := ' < Todas > ';
      end;

      qryListagemProposta.Open;
   end;
end;



end.
