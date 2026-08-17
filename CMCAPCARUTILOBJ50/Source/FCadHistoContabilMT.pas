unit FCadHistoContabilMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadModeloHistoricoMT, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  DBCtrls, Mask, ExtCtrls, uCtrlParamIntegra;

type
  TFrmCadHistoContabilMT = class(TFrmCadModeloHistoricoMT)
    chkTitulo: TCheckBox;
    Bevel1: TBevel;
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure RgTipoHistoricoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadHistoContabilMT: TFrmCadHistoContabilMT;

implementation

{$R *.DFM}

Uses uListaCamposHistCapCar, uSistema;

procedure TFrmCadHistoContabilMT.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('TIPO').AsInteger := 0;
end;

procedure TFrmCadHistoContabilMT.RgTipoHistoricoChange(Sender: TObject);
begin
  inherited;
  SetListaCamposHistCapCar(StrToIntDef(RgTipoHistorico.Value, -1), LbCampoBanco.Items, sistema.IdModulo );
end;

procedure TFrmCadHistoContabilMT.FormCreate(Sender: TObject);
begin
  inherited;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30001;
    bbtnAjuda.HelpContext := 30001;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;


procedure TFrmCadHistoContabilMT.BtnAddClick(Sender: TObject);
begin
//início - andré tavares - pendência 25081 - 13/04/2007
//  inherited;
  If ((EdtTextoFixo.Focused) or (chkTitulo.Focused)) and (trim(EdtTextoFixo.Text) <> '') Then
  Begin
     If (Trim(EdtTextoFixo.Text) <> '') and (chkTitulo.Checked) Then //Titulo do campo
     Begin
       LbHistCompo.Items.Add('&' + EdtTextoFixo.Text);
       EdtTextoFixo.Text := '';
     End
     else if (Trim(EdtTextoFixo.Text) <> '') and (not chkTitulo.Checked) Then //Texto Fixo qualquer
     Begin
       LbHistCompo.Items.Add('#' + EdtTextoFixo.Text);
       EdtTextoFixo.Text := '';
     End
  End
  Else
   If (LbCampoBanco.ItemIndex <> -1) Then
      LbHistCompo.Items.Add(LbCampoBanco.Items[LbCampoBanco.ItemIndex]);

// fim - andré tavares - pendência 25081 - 13/04/2007

end;

end.
