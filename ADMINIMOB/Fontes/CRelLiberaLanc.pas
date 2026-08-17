unit CRelLiberaLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, mUsuario, wwdblook,
  Grids, DBGrids, fcCombo, fcColorCombo, uModuloImobiliario;

type
  TcfgRelLiberaLanc = class(TcfgRel)
    MolUsuario1: TMolUsuario;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label2: TLabel;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;

    procedure MontaQuery; override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelLiberaLanc: TcfgRelLiberaLanc;

implementation

uses UFuncoesImob, UDataBase, USistema, uMensErro, dRelAdminImobCC, dLookImobiliario;

{$R *.DFM}

procedure TcfgRelLiberaLanc.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoLancLiberados.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoLancLiberados.Picture := nil;

      LimpaParametros(qryLiberaLanc);
      qryLiberaLanc.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      if MolUsuario1.iUsuario > 0 then
         qryLiberaLanc.ParamByName('PIDUSUARIOSISTEMA').AsInteger := MolUsuario1.iUsuario;
      if DBcboTipoRecDes.Text <> '' then
         qryLiberaLanc.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
      if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
         qryLiberaLanc.ParamByName('PDATALIBERA1').AsDateTime := edtDataIni.DateTime;
         qryLiberaLanc.ParamByName('PDATALIBERA2').AsDateTime := edtDataFim.DateTime;
      end;
      if not qryLiberaLanc.Prepared then qryLiberaLanc.Prepare;
      qryLiberaLanc.Open;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      bSeparador  := chkLinhas.Checked;
   end;
end;


procedure TcfgRelLiberaLanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;
  inherited;
end;

procedure TcfgRelLiberaLanc.FormShow(Sender: TObject);
begin
  inherited;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      if Active = False then Open;
   end;
end;

end.
