{ --------------------------------------------------------------------------------------------------
Rotina    : FormCreate
Data      : 09/03/2004
Autor     : Marchetti
Pendencia : 15900
Descrição : Mostrar todos os inventários
---------------------------------------------------------------------------------------------------}

unit FMTIniContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask,
  uCtrlGrupoProd, uCtrlInventario, uCmTypes;

type
  TFrmMTIniContagem = class(TFrmCadastroMT)
    Label3: TLabel;
    edDataInvent: TCMDateTimePicker;
    RgMostraSaldo: TDBRadioGroup;
    Label1: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    Label2: TLabel;
    edAlmox: TEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    cdsGrupoProd: TCMClientDataSet;
    rdgAbrangencia: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure rdgAbrangenciaClick(Sender: TObject);
  private
    { Private declarations }
    GrupoProd  : TCtrlGrupoProd;
    Inventario : TCtrlInventario;
    IdInvent   : Double;
    //
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTIniContagem: TFrmMTIniContagem;

implementation

{$R *.DFM}

uses uSistema, dBaseDados, uMensErro, uModulo;

procedure TFrmMTIniContagem.FormCreate(Sender: TObject);
begin
  inherited;
  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Inventario.cds := cds;
  //
  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsGrupoProd.Data := GrupoProd.ListGrupoProd;

  Sel(-1);

  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));

  edAlmox.Text := Modulo.sAlmoxaUsuario;

  dblcGrupo.Enabled := False;
  dblcGrupo.Color   := clBtnFace;
end;

procedure TFrmMTIniContagem.Sel(n: Double);
begin
  cds.Data := Inventario.Procurar( n );
end;

procedure TFrmMTIniContagem.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('IDPESSOA').AsInteger         := Sistema.IdEmpresa;
  cds.FieldByName('CODALMOXARIFADO').AsInteger  := Modulo.iCodAlmoxa;
  cds.FieldByName('PARCIALTOTAL').AsString      := 'T';
  cds.FieldByName('CONTAGEMENCERRADA').AsString := 'F';
  cds.FieldByName('ABERTOFECHADO').AsString     := 'A';
  if Modulo.LeDataRepresa > Date then
     cds.FieldByName('DATAINVENTARIO').asDateTime := Date
  else
     cds.FieldByName('DATAINVENTARIO').asDateTime := Modulo.LeDataRepresa;

  RdgAbrangencia.Enabled := True;
  
end;

procedure TFrmMTIniContagem.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If Inventario.ExisteInvetario(Sistema.IdEmpresa,Modulo.iCodAlmoxa, cds.FieldByName('CODGRUPOPROD').AsString) Then
     Begin
        MsgDlg(Inventario.MessageInfo,'Erro',mtError,[mbOk],0);
        edDataInvent.SetFocus;
        Accept := False;
     end
  Else
  if Trim(edDataInvent.Text)='' then
     Begin
        MsgDlg('Obrigatório preencher a Data do Inventário','Erro',mtError,[mbOk],0);
        edDataInvent.SetFocus;
        Accept := False;
     end
  Else
  if edDataInvent.Date > Date then
     Begin
        MsgDlg('Data do Inventário não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        edDataInvent.SetFocus;
        Accept := False;
     end
  Else   
  if edDataInvent.Date > Modulo.LeDataRepresa then
     Begin
        MsgDlg('Data do Inventário não pode ser maior que a data de represamento','Erro',mtError,[mbOk],0);
        edDataInvent.SetFocus;
        Accept := False;
     end;

end;

procedure TFrmMTIniContagem.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  IdInvent := Inventario.AbreInventario(cds.FieldByName('CODGRUPOPROD').AsString);
  Accept   := IdInvent > 0;
  if Accept Then
      MsgDlg('Inventário ' + FloatToStr(IdInvent) + ' iniciado.','Informação',mtInformation,[mbOk],0);
end;

procedure TFrmMTIniContagem.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Inventario.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTIniContagem.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Inventario.ExcluirInventario;
end;

procedure TFrmMTIniContagem.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
    Sel( IdInvent );
end;

procedure TFrmMTIniContagem.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToIntDef(MontaSelect.ValoresChave[0],0));

end;

procedure TFrmMTIniContagem.rdgAbrangenciaClick(Sender: TObject);
begin
  inherited;
   if cds.State in dsEditModes then
   begin
      case rdgAbrangencia.ItemIndex of
           0 : cds.FieldByName('PARCIALTOTAL').AsString := 'T';
           1 : cds.FieldByName('PARCIALTOTAL').AsString := 'P';
      end;
   end;

   dblcGrupo.Enabled := (cds.FieldByName('PARCIALTOTAL').AsString = 'P');

   if dblcGrupo.Enabled then
      dblcGrupo.Color   := clWindow
   else
      dblcGrupo.Color   := clBtnFace;

end;

end.
