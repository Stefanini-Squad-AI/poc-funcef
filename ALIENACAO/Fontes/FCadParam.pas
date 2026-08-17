unit FCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, CMDBLookupCombo,
  ComCtrls, DBCtrls;

type
  TfrmCadParam = class(TfrmCadastroCS)
    pcParam: TPageControl;
    tsOper: TTabSheet;
    pnlOper: TPanel;
    Label9: TLabel;
    dblcTipoAVista: TwwDBLookupCombo;
    Label11: TLabel;
    dblcTipoAmortiz: TwwDBLookupCombo;
    Label12: TLabel;
    dblcTipoSinal: TwwDBLookupCombo;
    Label5: TLabel;
    dblcProjecao: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    dblcTipoParcela: TwwDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    tsGeral: TTabSheet;
    PnGeral: TPanel;
    dbcbNumProp: TDBCheckBox;
    qryIDPESSOA: TFloatField;
    qryIDRECAMORTIZACAO: TFloatField;
    qryIDRECJUROS: TFloatField;
    qryIDRECCORRECAO: TFloatField;
    qryIDRECSINAL: TFloatField;
    qryIDRECAVISTA: TFloatField;
    qryIDRECPROJECAO: TFloatField;
    qryIDRECAMORTEXTRA: TFloatField;
    qryFLGNUMPROPOSTA: TFloatField;
    qryFLGINTEGRAATIVO: TFloatField;
    dbcbIntegraCAF: TDBCheckBox;
    Label1: TLabel;
    Label10: TLabel;
    dblcTipoPerdas: TwwDBLookupCombo;
    qryIDRECPERDAS: TFloatField;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParam: TfrmCadParam;

implementation

{$R *.DFM}

Uses uModulo, uFuncoesImob, uSistema, dLookImobiliario;

procedure TfrmCadParam.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   CmeCadastro.RepetirInsert := False;
   if not qry.IsEmpty then begin
      qry.Cancel;
      qry.Edit;
   end;
   pnlOper.Enabled  := True;
   if pcParam.ActivePage = tsGeral then dbcbIntegraCAF.SetFocus;
   if pcParam.ActivePage = tsOper  then dblcTipoAVista.SetFocus;
end;

procedure TfrmCadParam.CmeCadastroConfirma(Sender: TObject);
begin
   qryIDPESSOA.asInteger := Sistema.IdEmpresa;
   inherited;
   Modulo.GetParams(Sistema.IdEmpresa);
   bbtnCancelar.Click;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
   inherited;

   qry.Close;
   qry.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
   qry.Open;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   with dtmLookImobiliario.qryLookAlterador do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlterador);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      Open;
   end;

   pnlFundo.Enabled   := True;
   pnlOper.Enabled    := False;
   pcParam.ActivePage := TsGeral;
end;

procedure TfrmCadParam.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   pnlOper.Enabled  := False;
end;

procedure TfrmCadParam.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   pnlOper.Enabled  := False;
end;

end.
