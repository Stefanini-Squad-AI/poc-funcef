unit cListagemProposta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgListagemProposta = class(TcfgRel)
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
  cfgListagemProposta: TcfgListagemProposta;

implementation

{$R *.DFM}

uses dLookImobiliario, dRelAdminImob, uSistema, uFuncoesImob;

procedure TcfgListagemProposta.FormCreate(Sender: TObject);
begin
   inherited;
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;

procedure TcfgListagemProposta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   dtmLookImobiliario.qryLookTipoImovel.Close;
end;

procedure TcfgListagemProposta.MontaQuery;
begin
   with dtmRelAdminImob do begin

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
